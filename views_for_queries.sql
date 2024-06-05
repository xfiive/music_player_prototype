do
$$
    begin
        create view users_by_todays_birthday as
        select user_id, interface_lang, state, birthdate
        from account_data
        where extract(month from birthdate) = extract(month from current_date)
          and extract(day from birthdate) = extract(day from current_date);

        create view users_by_custom_date as
        select user_id, interface_lang, state, birthdate, registration_date
        from account_data
        where birthdate = '2005-04-14';

        create view adult_users as
        select user_id, interface_lang, state, birthdate
        from account_data
        where age(birthdate) >= interval '18 years';
    end
$$;


select u.nickname
from users u
         join users_by_todays_birthday ubtb on ubtb.user_id = u.user_id
         join adult_users au on au.user_id = ubtb.user_id;

select u.nickname
from users u
         join users_by_custom_date ubcd on ubcd.user_id = u.user_id
         join adult_users au on au.user_id = ubcd.user_id;
-- 2 pohľady s jednoduchým netriviálnym selectom nad jednou tabuľkou, -> DONE  ^^

do
$$
    begin
        create or replace view top_tracks_by_genre as
        select t.name as track_name, a.name as artist_name, g.name as genre_name
        from tracks t
                 join artists_have_tracks aht on t.track_id = aht.track_id
                 join artists a on aht.artist_id = a.artist_id
                 join genres g on t.genre_id = g.genre_id
        where t.is_available = true
          and t.content_warning != 'paec'
          and (select r.all_the_time
               from ratings r
               where r.artist_id = a.artist_id) <= 2;

        create or replace view top_albums_by_artist as
        select a.name as album_name, ar.name as artist_name, l.name as label_name
        from albums a
                 join artists_have_albums aha on a.album_id = aha.album_id
                 join artists ar on aha.artist_id = ar.artist_id
                 join labels l on a.label_id = l.label_id
        where a.is_available = true
          and (select r.all_the_time
               from ratings r
               where r.artist_id = ar.artist_id) <= 2;
    end
$$;

select distinct track_name, top_tracks_by_genre.artist_name, genre_name, album_name, label_name
from top_tracks_by_genre
         join top_albums_by_artist on top_tracks_by_genre.artist_name = top_albums_by_artist.artist_name;
-- 1x spojenie aspoň 2 tabuliek -> DONE ^^

do
$$
    begin
        create or replace view account_album_labels as
        select ad.interface_lang,
               ad.state_lang,
               ua.album_id,
               a.name as album_name,
               l.name as label_name
        from account_data ad
                 join users_like_albums ua on ad.user_id = ua.user_id
                 join albums a on ua.album_id = a.album_id
                 join labels l on a.label_id = l.label_id;
    end
$$;

select a.name, aal.label_name, l.description
from account_album_labels aal
         join labels l on aal.label_name = l.name
         join albums a on a.album_id = aal.album_id;
-- 1x spojenie aspoň 3 tabuliek -> DONE ^^

do
$$
    begin
        create or replace view track_artist_album_info as
        select t.name                        as track_name,
               coalesce(a.name, 'unknown')   as artist_name,
               coalesce(alb.name, 'unknown') as album_name
        from tracks t
                 left join
             artists_have_tracks aht on t.
                                            track_id = aht.track_id
                 left join
             artists a on aht.
                              artist_id = a.artist_id
                 left join
             albums_include_tracks ait on t.
                                              track_id = ait.track_id
                 left join
             albums alb on ait.
                               album_id = alb.album_id;
    end
$$;
-- 1x outer join -> DONE ^^


do
$$
    begin
        create or replace view genre_representatives as
        select count(a.artist_id) as genre_name, count(a.artist_id) as artist_count
        from genres g
                 left join artists a on g.genre_id = a.genre_id
        group by g.name;


        create or replace view track_stats as
        select count(t.track_id)  as total_tracks,
               avg(t.duration_ms) as avg_duration,
               a.artist_id        as artist_id
        from artists a
                 join
             artists_have_tracks aht on a.artist_id = aht.artist_id
                 join
             tracks t on aht.track_id = t.track_id
        group by a.name, a.artist_id;
    end
$$;

select *
from genre_representatives;
-- 2 pohľady s použitím agregačných funkcií a/alebo zoskupenia. -> DONE ^^