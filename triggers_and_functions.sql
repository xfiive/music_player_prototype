do
$$
    begin
        create view available_rock_and_pop_tracks as
        select t.*
        from tracks t
                 join genres g on t.genre_id = g.genre_id
        where t.is_available = true
          and g.name = 'rock'
        union
        select t.*
        from tracks t
                 join genres g on t.genre_id = g.genre_id
        where t.is_available = true
          and g.name = 'pop';
    end
$$;

do
$$
    begin
        create view artist_album_count as
        select a.artist_id, count(al.album_id) as album_count
        from artists a
                 left join artists_have_albums aa on a.artist_id = aa.artist_id
                 left join albums al on aa.album_id = al.album_id
        group by a.artist_id
        order by a.artist_id;
    end
$$;

do
$$
    begin
        create view artists_with_most_and_least_albums as
        select a.artist_id, a.name, count(aa.album_id) as album_count
        from artists a
                 left join artists_have_albums aa on a.artist_id = aa.artist_id
        group by a.artist_id, a.name
        having count(aa.album_id) = (select max(album_count) from artist_album_count)
            or count(aa.album_id) = (select min(album_count) from artist_album_count);
    end
$$;

-- SELECTS ON VIEWS ^^


create or replace function update_artist_rating()
    returns trigger as
$$
begin
    if exists (select 1 from users_like_tracks where track_id = new.track_id) then
        update ratings
        set daily = daily + 10
        where artist_id = (select artist_id from artists_have_tracks where track_id = new.track_id);
    end if;

    if exists (select 1
               from users_like_albums
               where album_id in (select album_id from albums_include_tracks where track_id = new.track_id)) then
        update ratings
        set daily = daily + 5
        where artist_id in (select artist_id
                            from artists_have_albums
                            where
                                album_id in (select album_id from albums_include_tracks where track_id = new.track_id));
    end if;

    update ratings
    set daily = daily + 1
    where artist_id in (select artist_id from artists_have_tracks where track_id = new.track_id);

    return new;
end;
$$ language plpgsql;

create trigger update_artist_rating_trigger
    after insert
    on users_like_tracks
    for each row
execute function update_artist_rating();


create or replace function update_weekly_rating()
    returns trigger as
$$
begin
    if new.daily >= 25 then
        update ratings
        set monthly = monthly + 15
        where artist_id = new.artist_id;
    end if;
    return new;
end;
$$ language plpgsql;

create trigger update_weekly_rating_trigger
    after update of daily
    on ratings
    for each row
execute function update_weekly_rating();


create or replace function update_all_time_rating()
    returns trigger as
$$
begin
    if new.monthly >= 5 then
        update ratings
        set all_the_time = all_the_time + 3
        where artist_id = new.artist_id;
    end if;

    return new;
end;
$$ language plpgsql;

create trigger update_all_time_rating_trigger
    after update of monthly
    on ratings
    for each row
execute function update_all_time_rating();

-- NON-TRIVIAL TRIGGER FOR RATING UPDATE ^^

create or replace function update_track_stats()
    returns trigger as
$$
begin
    update track_stats
    set total_tracks = (select count(track_id) from artists_have_tracks where artist_id = NEW.artist_id),
        avg_duration = (select avg(duration_ms)
                        from tracks
                        where track_id in (select track_id from artists_have_tracks where artist_id = NEW.artist_id))
    where artist_id = NEW.artist_id;
end;
$$ language plpgsql;

create trigger update_track_stats_trigger
    after insert or delete
    on artists_have_tracks
    for each row
execute function update_track_stats();

-- COUNT and AVG function usage ^^

create or replace function update_available_rock_and_pop_tracks()
    returns trigger as
$$
begin
    refresh materialized view available_rock_and_pop_tracks;
    return null;
end;
$$ language plpgsql;

create trigger update_available_rock_and_pop_tracks_trigger
    after insert or delete
    on tracks
    for each statement
execute function update_available_rock_and_pop_tracks();


create or replace function update_artists_with_most_and_least_albums()
    returns trigger as
$$
begin
    refresh materialized view artists_with_most_and_least_albums;
    return null;
end;
$$ language plpgsql;

create trigger update_artists_with_most_and_least_albums_trigger
    after insert or delete
    on albums
    for each statement
execute function update_artists_with_most_and_least_albums();

-- MATERIALIZED VIEWS ^^

create or replace procedure add_album(
    album_name varchar,
    track_list int[],
    artist_list int[],
    genre_id int
)
    language plpgsql
as
$$
declare
    new_album_id int;
    track_id     int;
    artist_id    int;
begin
    insert into albums (name, track_count, genre_id)
    values (album_name, array_length(track_list, 1), genre_id)
    returning album_id into new_album_id;

    foreach track_id in array track_list
        loop
            insert into albums_include_tracks (album_id, track_id)
            values (new_album_id, track_id);
        end loop;

    foreach artist_id in array artist_list
        loop
            insert into artists_have_albums (artist_id, album_id)
            values (artist_id, new_album_id);
        end loop;
end;
$$;

create or replace procedure update_artist_rating(
    p_artist_id int
)
    language plpgsql
as
$$
begin
    update ratings
    set all_the_time = (select count(*)
                        from tracks t
                                 join artists_have_tracks aht on t.track_id = aht.track_id
                        where aht.artist_id = p_artist_id)
    where artist_id = p_artist_id;
end;
$$;

create or replace procedure delete_artist(
    p_artist_id int
)
    language plpgsql
as
$$
begin
    delete
    from albums
    where album_id in (select album_id
                       from artists_have_albums
                       where artist_id = p_artist_id);
    delete
    from tracks
    where track_id in (select track_id
                       from artists_have_tracks
                       where artist_id = p_artist_id);
    delete
    from artists_have_albums
    where artist_id = p_artist_id;

    delete
    from artists
    where artist_id = p_artist_id;
end;
$$;

-- PROCEDURES ^^

create or replace function avg_track_duration_in_album(
    p_album_id int
)
    returns numeric
    language plpgsql
as
$$
declare
    total_duration numeric;
    total_tracks   int;
begin
    select sum(duration_ms), count(*)
    into total_duration, total_tracks
    from tracks
    where track_id in (select track_id
                       from albums_include_tracks
                       where album_id = p_album_id);

    if total_tracks = 0 then
        return 0;
    else
        return total_duration / total_tracks;
    end if;
end;
$$;

create or replace function find_artists_by_genre(
    p_genre_id int
)
    returns table
            (
                artist_id   int,
                artist_name varchar
            )
    language plpgsql
as
$$
begin
    return query
        select artist_id, name
        from artists
        where genre_id = p_genre_id;
end;
$$;

create or replace function count_tracks_by_genre(
    p_genre_id int
)
    returns int
    language plpgsql
as
$$
declare
    total_tracks int;
begin
    select count(*)
    into total_tracks
    from tracks
    where genre_id = p_genre_id;
    return total_tracks;
end;
$$;

-- FUNCTIONS ^^