do
$$
    begin
        drop function if exists update_track_count() cascade;

        drop function if exists update_artist_rating() cascade;

        drop function if exists update_weekly_rating() cascade;

        drop function if exists update_all_time_rating() cascade;

        drop function if exists auto_increment_track_id() cascade;

        drop function if exists auto_increment_rating_id() cascade;

        drop function if exists auto_increment_artist_id() cascade;

        drop function if exists auto_increment_album_id() cascade;

        drop function if exists auto_increment_label_id() cascade;

        drop function if exists update_track_stats() cascade;

        drop function if exists update_available_rock_and_pop_tracks() cascade;

        drop function if exists update_artists_with_most_and_least_albums() cascade;

        drop procedure if exists add_album(varchar, integer[], integer[], integer) cascade;

        drop procedure if exists update_artist_rating(integer) cascade;

        drop procedure if exists delete_artist(integer) cascade;

        drop function if exists avg_track_duration_in_album(integer) cascade;

        drop function if exists find_artists_by_genre(integer) cascade;

        drop function if exists count_tracks_by_genre(integer) cascade;

        drop sequence if exists tracks_track_id_seq cascade;

        drop sequence if exists ratings_rating_id_seq cascade;

        drop sequence if exists artists_artist_id_seq cascade;

        drop sequence if exists albums_album_id_seq cascade;

        drop sequence if exists labels_label_id_seq cascade;

        drop view if exists users_by_todays_birthday cascade;

        drop view if exists users_by_custom_date cascade;

        drop view if exists adult_users cascade;

        drop view if exists top_tracks_by_genre cascade;

        drop view if exists top_albums_by_artist cascade;

        drop view if exists account_album_labels cascade;

        drop view if exists track_artist_album_info cascade;

        drop view if exists genre_representatives cascade;

        drop view if exists track_stats cascade;

        drop view if exists available_rock_and_pop_tracks cascade;

        drop view if exists artist_album_count cascade;

        drop view if exists artists_with_most_and_least_albums cascade;

        drop type if exists content_warning cascade;

        drop type if exists country cascade;

        drop type if exists encoding_type cascade;

        drop type if exists interface_language cascade;

        drop type if exists state_lang cascade;

        drop table if exists public.ratings cascade;

        drop table if exists public.artists_have_tracks cascade;

        drop table if exists public.artists_have_albums cascade;

        drop table if exists public.albums_include_tracks cascade;

        drop table if exists public.account_data cascade;

        drop table if exists public.users_like_artists cascade;

        drop table if exists public.artists cascade;

        drop table if exists public.users_like_albums cascade;

        drop table if exists public.albums cascade;

        drop table if exists public.labels cascade;

        drop table if exists public.encodings cascade;

        drop table if exists public.users_like_tracks cascade;

        drop table if exists public.users_have_playlists cascade;

        drop table if exists public.users cascade;

        drop table if exists public.playlists_have_tracks cascade;

        drop table if exists public.tracks cascade;

        drop table if exists public.genres cascade;

        drop table if exists public.playlists cascade;


    end
$$;