begin;

do
$$
    begin
        create sequence if not exists tracks_track_id_seq start with 1 increment by 1;
        create sequence if not exists ratings_rating_id_seq start with 1 increment by 1;
        create sequence if not exists artists_artist_id_seq start with 1 increment by 1;
        create sequence if not exists albums_album_id_seq start with 1 increment by 1;
        create sequence if not exists labels_label_id_seq start with 1 increment by 1;
    end
$$;


-- usa - (United States of America)
-- chn - (China)
-- ind - (India)
-- idn - (Indonesia)
-- bra - (Brazil)
-- pak - (Pakistan)
-- nga - (Nigeria)
-- bgd - (Bangladesh)
-- rus - (Russia)
-- mex - (Mexico)
-- jpn - (Japan)
-- eth - (Ethiopia)
-- phl - (Philippines)
-- egy - (Egypt)
-- vnm - (Vietnam)
-- cod - (Democratic Republic of the Congo)
-- tur - (Turkey)
-- irn - (Iran)
-- deu - (Germany)
-- tha - (Thailand)
-- gbr - (United Kingdom)
-- fra - (France)
-- ita - (Italy)
-- tza - (Tanzania)
-- mmr - (Myanmar)
-- zaf - (South Africa)
-- ken - (Kenya)
-- kor - (South Korea)
-- col - (Colombia)
-- esp - (Spain)

create table if not exists genres
(
    genre_id serial primary key,
    name     varchar(20) not null
);

create type content_warning as enum ('paec', 'exp_lyrics', 'age');

create table if not exists tracks
(
--     track_id        serial primary key,
--     track_id        int primary key,
    track_id        int PRIMARY KEY DEFAULT nextval('tracks_track_id_seq'),
    name            varchar(50)  not null,
    is_available    bool         not null,
    content_warning content_warning,
    duration_ms     int          not null,
    file_url        varchar(100) not null,
    file_size_kb    int          not null,
    cover_url       varchar(100),
    pos_volume      int          not null,
    pos_index       int          not null,
    genre_id        int          not null
);

create table if not exists ratings
(
--     rating_id    serial primary key,
--     rating_id    int primary key,
    rating_id    int PRIMARY KEY DEFAULT nextval('ratings_rating_id_seq'),
    artist_id    int unique,
    daily        int not null,
    monthly      int,
    all_the_time int
);

create table if not exists artists
(
--     artist_id    serial primary key,
--     artist_id    int primary key,
    artist_id    int PRIMARY KEY DEFAULT nextval('artists_artist_id_seq'),
    name         varchar(50)   not null,
    is_available bool          not null,
    avatar_url   varchar(1000),
    description  varchar(1000) not null,
    genre_id     int           not null,
    albums_count int           not null
);

create table if not exists artists_have_tracks
(
    artist_id int not null,
    track_id  int not null
);

create type country as enum ('usa', 'chn', 'ind', 'idn', 'bra', 'pak', 'nga', 'bgd', 'rus', 'mex', 'jpn', 'eth', 'phl', 'egy', 'vnm', 'cod', 'tur', 'irn', 'deu', 'tha', 'gbr', 'fra', 'ita', 'tza', 'mmr', 'zaf', 'ken', 'kor', 'col', 'esp');

create table if not exists labels
(
--     label_id    serial primary key,
--     label_id    int primary key,
    label_id    int PRIMARY KEY DEFAULT nextval('labels_label_id_seq'),
    name        varchar(50) not null,
    description varchar(500),
    country     country
);

create type encoding_type as enum ('mp3', 'aac', 'flac', 'wav');

create table if not exists encodings
(
    encoding_id serial primary key,
    type        encoding_type not null
);

create table if not exists albums
(
--     album_id     serial primary key,
--     album_id     int primary key,
    album_id     int PRIMARY KEY DEFAULT nextval('albums_album_id_seq'),
    name         varchar(50) not null,
    is_available bool        not null,
    cover_url    varchar(1000),
    track_count  int         not null,
    label_id     int,
    genre_id     int         not null,
    encoding_id  int         not null
);

create table if not exists artists_have_albums
(
    artist_id int not null,
    album_id  int not null
);


create table if not exists albums_include_tracks
(
    album_id int not null,
    track_id int not null
);

create type interface_language as enum ('en', 'fr', 'es', 'sk', 'pl');

create type state_lang as enum ('usa', 'chn', 'ind', 'idn', 'bra', 'pak', 'nga', 'bgd', 'rus', 'mex', 'jpn', 'eth', 'phl', 'egy', 'vnm', 'cod', 'tur', 'irn', 'deu', 'tha', 'gbr', 'fra', 'ita', 'tza', 'mmr', 'zaf', 'ken', 'kor', 'col', 'esp');

create table if not exists account_data
(
    data_id           serial primary key,
    user_id           int unique               not null,
    interface_lang    interface_language       not null,
    state_lang        state_lang               not null,
    state             varchar(30)              not null,
    birthdate         date                     not null,
    avatar_url        varchar(100),
    registration_date timestamp with time zone not null
);

create table if not exists users
(
    user_id       serial primary key,
    nickname      varchar(50) unique  not null,
    email         varchar(100) unique not null,
    password_hash varchar(200)        not null
);

create table if not exists users_like_artists
(
    user_id   int        not null,
    artist_id int unique not null
);

create table if not exists users_like_albums
(
    user_id  int        not null,
    album_id int unique not null
);

create table if not exists users_like_tracks
(
    user_id  int        not null,
    track_id int unique not null
);

create table if not exists playlists
(
    playlist_id serial primary key,
    name        varchar(50) not null,
    cover_url   varchar(100),
    description varchar(50)
);

create table if not exists users_have_playlists
(
    user_id     int not null,
    playlist_id int not null
);

create table if not exists playlists_have_tracks
(
    playlist_id int not null,
    track_id    int not null
);

commit;

begin;

do
$$
    begin
        alter table tracks
            add constraint fk_genre_id
                foreign key (genre_id) references genres (genre_id);
    end
$$;

do
$$
    begin
        alter table albums
            add constraint fk_label_id
                foreign key (label_id) references labels (label_id);

        alter table albums
            add constraint fk_encoding_id
                foreign key (encoding_id) references encodings (encoding_id);

        alter table albums
            add constraint fk_genre_id
                foreign key (genre_id) references genres (genre_id);
    end
$$;

do
$$
    begin
        alter table ratings
            add constraint fk_artis_id
                foreign key (artist_id) references artists (artist_id);

        alter table artists
            add constraint fk_genre_id
                foreign key (genre_id) references genres (genre_id);
    end
$$;

do
$$
    begin
        alter table artists_have_albums
            add constraint fk_artist_id
                foreign key (artist_id) references artists (artist_id);

        alter table artists_have_albums
            add constraint fk_album_id
                foreign key (album_id) references albums (album_id);
    end
$$;

do
$$
    begin
        alter table albums_include_tracks
            add constraint fk_album_id
                foreign key (album_id) references albums (album_id);

        alter table albums_include_tracks
            add constraint fk_track_id
                foreign key (track_id) references tracks (track_id);
    end
$$;

do
$$
    begin
        alter table artists_have_tracks
            add constraint fk_track_id
                foreign key (track_id) references tracks (track_id);

        alter table artists_have_tracks
            add constraint fk_artist_id
                foreign key (artist_id) references artists (artist_id);
    end
$$;

do
$$
    begin
        alter table account_data
            add constraint fk_user_id
                foreign key (user_id) references users (user_id);
    end
$$;

do
$$
    begin
        alter table users_like_artists
            add constraint fk_user_id
                foreign key (user_id) references users (user_id);

        alter table users_like_artists
            add constraint fk_artist_id
                foreign key (artist_id) references artists (artist_id);
    end
$$;

do
$$
    begin
        alter table users_like_albums
            add constraint fk_user_id
                foreign key (user_id) references users (user_id);

        alter table users_like_albums
            add constraint fk_album_id
                foreign key (album_id) references albums (album_id);
    end
$$;

do
$$
    begin
        alter table users_like_tracks
            add constraint fk_user_id
                foreign key (user_id) references users (user_id);

        alter table users_like_tracks
            add constraint fk_track_id
                foreign key (track_id) references tracks (track_id);
    end
$$;

do
$$
    begin
        alter table users_have_playlists
            add constraint fk_user_id
                foreign key (user_id) references users (user_id);

        alter table users_have_playlists
            add constraint fk_playlist_id
                foreign key (playlist_id) references playlists (playlist_id);
    end
$$;

do
$$
    begin
        alter table playlists_have_tracks
            add constraint fk_playlist_id
                foreign key (playlist_id) references playlists (playlist_id);

        alter table playlists_have_tracks
            add constraint fk_track_id
                foreign key (track_id) references tracks (track_id);
    end
$$;

create or replace function update_track_count()
    returns trigger as
$$
begin
    perform album_id from albums where album_id = NEW.album_id;
    if found then
        update albums
        set track_count = (select count(*) from albums_include_tracks where album_id = new.album_id)
        where album_id = new.album_id;
    else
        raise notice 'Album not found or FK constraint violation: %', new.album_id;
    end if;
    return new;
exception
    when foreign_key_violation then
        raise warning 'Attempted to update an album that violates FK constraints.';
        return null;
end;
$$ language plpgsql;


create trigger track_count_trigger
    after insert
    on albums_include_tracks
    for each row
execute function update_track_count();


create or replace function auto_increment_track_id()
    returns trigger as
$$
begin
    new.track_id := nextval('tracks_track_id_seq');
    return new;
end;
$$ language plpgsql;

create trigger auto_increment_track_id_trigger
    before insert or update
    on tracks
    for each row
execute function auto_increment_track_id();


create or replace function auto_increment_rating_id()
    returns trigger as
$$
begin
    new.rating_id := nextval('ratings_rating_id_seq');
    return new;
end;
$$ language plpgsql;

create trigger auto_increment_rating_id_trigger
    before insert or update
    on ratings
    for each row
execute function auto_increment_rating_id();


create or replace function auto_increment_artist_id()
    returns trigger as
$$
begin
    new.artist_id := nextval('artists_artist_id_seq');
    return new;
end;
$$ language plpgsql;

create trigger auto_increment_artist_id_trigger
    before insert or update
    on artists
    for each row
execute function auto_increment_artist_id();


create or replace function auto_increment_album_id()
    returns trigger as
$$
begin
    new.album_id := nextval('albums_album_id_seq');
    return new;
end;
$$ language plpgsql;

create trigger auto_increment_album_id_trigger
    before insert or update
    on albums
    for each row
execute function auto_increment_album_id();


create or replace function auto_increment_label_id()
    returns trigger as
$$
begin
    new.label_id := nextval('labels_label_id_seq');
    return new;
end;
$$ language plpgsql;

create trigger auto_increment_label_id_trigger
    before insert or update
    on labels
    for each row
execute function auto_increment_label_id();


commit;