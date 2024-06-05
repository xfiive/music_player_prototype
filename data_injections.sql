do
$$
    begin
        insert into encodings(type)
        values ('mp3'::encoding_type);

        insert into encodings(type)
        values ('aac'::encoding_type);

        insert into encodings(type)
        values ('flac'::encoding_type);

        insert into encodings(type)
        values ('wav'::encoding_type);
    end
$$;
-- encodings ^^

do
$$
    begin
        INSERT INTO genres (name)
        VALUES ('Rock');

        INSERT INTO genres (name)
        VALUES ('Pop');

        INSERT INTO genres (name)
        VALUES ('Country');

        INSERT INTO genres (name)
        VALUES ('Metal');

        INSERT INTO genres (name)
        VALUES ('Heavy-metal');

        INSERT INTO genres (name)
        VALUES ('Grunge');

        INSERT INTO genres (name)
        VALUES ('Blues');

        INSERT INTO genres (name)
        VALUES ('Blues-rock');

        INSERT INTO genres (name)
        VALUES ('Rock-n-roll');
    end
$$;
-- genres ^^

do
$$
    begin
        insert into labels(name, description, country)
        values ('Capitol Records',
                'Capitol Records, LLC (known legally as Capitol Records, Inc. until 2007) is an American record label owned by Universal Music Group through its Capitol Music Group imprint',
                'usa'::country);

        insert into labels(name, description, country)
        values ('Sanctuary Records',
                'Sanctuary Records Group Limited was a record label based in the United Kingdom and is, as at 2013, a subsidiary of BMG Rights Management solely for reissues',
                'gbr'::country);

        insert into labels(name, description, country)
        values ('Fontana Records',
                'Fontana Records is a record label that was started in the 1950s as a subsidiary of the Dutch Philips Records',
                'usa'::country);

        insert into labels(name, description, country)
        values ('Atlantic Records',
                'Atlantic Records (Atlantic Recording Corporation) is an American record label owned by Warner Music Group.',
                'usa'::country);

        insert into labels(name, description, country)
        values ('Warner Records',
                'Warner Records Inc. (formerly Warner Bros. Records Inc. until 2019) is an American record label. A subsidiary of the Warner Music Group, it is headquartered in Los Angeles, California.It was founded on March 19, 1958, as the recorded music division of the American film studio Warner Bros',
                'usa'::country);

        insert into labels(name, description, country)
        values ('Fueled by Ramen',
                'Fueled by Ramen LLC is an American record label owned by Warner Music Group and distributed by 300 Elektra Entertainment. The label, founded in Gainesville, Florida, in 1996, is now based in New York City.',
                'usa'::country);
    end
$$;
-- labels ^^

do
$$
    begin
        insert into artists (name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Black Sabbath',
               true,
               'https://www.rollingstone.com/wp-content/uploads/2021/02/Sabbath-Press-Shot-1_Credit_Photo-Duffy-C-Duffy-Archive.jpg?w=1581&h=1054&crop=1',
               'Black Sabbath were an English rock band formed in Birmingham in 1968 by guitarist Tony Iommi, drummer Bill Ward, bassist Geezer Butler and vocalist Ozzy Osbourne. They are often cited as pioneers of heavy metal music.[1] The band helped define the genre with their first three albums Black Sabbath (1970), Paranoid (1970) and Master of Reality (1971). Following Osbourne''s departure in 1979, the band underwent multiple line-up changes, with Iommi being the only constant member throughout their history.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Heavy-metal';
        insert into ratings(artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               1,
               1,
               1
        from artists a
        where a.name = 'Black Sabbath';

        insert into artists(name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Iron Maiden',
               true,
               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVDweArb4zrFmH3Q8VNdnIBHVBX-MO2TnUoCgtu9l1Dw&s',
               'Iron Maiden are an English heavy metal band formed in Leyton, East London, in 1975 by bassist and primary songwriter Steve Harris. Although fluid in the early years of the band, the line-up for most of the band''s history has consisted of Harris, lead vocalist Bruce Dickinson, drummer Nicko McBrain, and guitarists Dave Murray, Adrian Smith and Janick Gers. As pioneers of the new wave of British heavy metal movement, Iron Maiden released a series of UK and US Platinum and Gold albums, including 1980''s debut album, 1981''s Killers, and 1982''s The Number of the Beast – its first album with Bruce Dickinson, who in 1981 replaced Paul Di''Anno as lead singer. The addition of Dickinson was a turning point in their career, establishing them as one of heavy metal''s most important bands.[2] The Number of the Beast is among the most popular heavy metal albums of all time, having sold almost 20 million copies worldwide.[3]',
               g.genre_id,
               0
        from genres g
        where g.name = 'Heavy-metal';
        insert into ratings(artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               2,
               2,
               2
        from artists a
        where a.name = 'Iron Maiden';

        insert into artists(name, is_available, avatar_url, description, genre_id, albums_count)
        select 'The Doors',
               true,
               'https://i.scdn.co/image/ab6761610000e5eb440959e022afc20e819050bd',
               'The Doors were an American rock band formed in Los Angeles in 1965, with vocalist Jim Morrison, keyboardist Ray Manzarek, guitarist Robby Krieger and drummer John Densmore. They were among the most influential and controversial rock acts of the 1960s, primarily due to Morrison''s lyrics and voice, along with his erratic stage persona and legal issues. The group is widely regarded as an important figure of the era''s counterculture.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Blues-rock';
        insert into ratings(artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               3,
               3,
               3
        from artists a
        where a.name = 'The Doors';

        insert into artists(name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Twenty One Pilots',
               true,
               'https://www.billboard.com/wp-content/uploads/media/Twenty-One-Pilots-portrait-2015-billboard-1548.jpg?w=942&h=623&crop=1',
               'Twenty One Pilots are an American musical duo from Columbus, Ohio. Initially a band, the group was formed in 2009 by lead vocalist Tyler Joseph along with Nick Thomas and Chris Salih, who both left in 2011. Since their departure, the line-up has consisted of Joseph and drummer Josh Dun. The duo is best known for their singles "Stressed Out", "Ride", and "Heathens". The group received a Grammy Award for Best Pop Duo/Group Performance at the 59th Annual Grammy Awards for "Stressed Out". The band independently released two albums, Twenty One Pilots (2009) and Regional at Best (2011), before being signed by record label Fueled by Ramen in 2012. Their label debut Vessel (2013) became the second album in history on which every track received at least a gold certification, making Twenty One Pilots the first and only band in the history of music to see every song on two albums earn gold or platinum awards.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Pop';
        insert into ratings(artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               6,
               6,
               6
        from artists a
        where a.name = 'Twenty One Pilots';

        insert into artists(name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Led Zeppelin',
               true,
               'https://upload.wikimedia.org/wikipedia/ru/a/a6/LedZeppelin1969Promo.JPEG',
               'Led Zeppelin were an English rock band formed in London in 1968. The group consisted of vocalist Robert Plant, guitarist Jimmy Page, bassist/keyboardist John Paul Jones, and drummer John Bonham. Widely regarded as one of the most successful, innovative, and influential bands in the history of rock music, Led Zeppelin are recognized as the progenitors of heavy metal and hard rock.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Rock';
        insert into ratings(artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               1,
               1,
               1
        from artists a
        where a.name = 'Led Zeppelin';

        insert into artists (name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Johnny Cash',
               true,
               'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Johnny_Cash_Kneeling_in_Prayer.jpg/800px-Johnny_Cash_Kneeling_in_Prayer.jpg',
               'Johnny Cash (born J. R. Cash; February 26, 1932 – September 12, 2003) was an American singer, songwriter, musician, and actor. Much of Cash''s music contained themes of sorrow, moral tribulation, and redemption, especially in the later stages of his career.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Country';
        insert into ratings (artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               7,
               7,
               7
        from artists a
        where a.name = 'Johnny Cash';

        insert into artists (name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Metallica',
               true,
               'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Metallica_at_The_O2_Arena%2C_London-09_%28cropped%29.jpg/800px-Metallica_at_The_O2_Arena%2C_London-09_%28cropped%29.jpg',
               'Metallica is an American heavy metal band. The band was formed in 1981 in Los Angeles by vocalist/guitarist James Hetfield and drummer Lars Ulrich, and has been based in San Francisco for most of its career. Metallica''s rapid success ensured that their first five albums would go multi-platinum, making them one of the best-selling music artists of all time.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Metal';
        insert into ratings (artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               8,
               8,
               8
        from artists a
        where a.name = 'Metallica';

        insert into artists (name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Elvis Presley',
               true,
               'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Elvis_Presley_promoting_Jailhouse_Rock.jpg/800px-Elvis_Presley_promoting_Jailhouse_Rock.jpg',
               'Elvis Aaron Presley (January 8, 1935 – August 16, 1977) was an American singer and actor. Regarded as one of the most significant cultural icons of the 20th century, he is often referred to as the "King of Rock and Roll" or simply "the King".',
               g.genre_id,
               0
        from genres g
        where g.name = 'Rock-n-roll';
        insert into ratings (artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               9,
               9,
               9
        from artists a
        where a.name = 'Elvis Presley';

        insert into artists (name, is_available, avatar_url, description, genre_id, albums_count)
        select 'B.B. King',
               true,
               'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/B.B._King_in_2009.jpg/800px-B.B._King_in_2009.jpg',
               'Riley B. King (September 16, 1925 – May 14, 2015), known professionally as B.B. King, was an American singer-songwriter, guitarist, and record producer. King introduced a sophisticated style of soloing based on fluid string bending and shimmering vibrato that influenced many later electric blues guitarists.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Blues';
        insert into ratings (artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               12,
               12,
               12
        from artists a
        where a.name = 'B.B. King';

        insert into artists(name, is_available, avatar_url, description, genre_id, albums_count)
        select 'Nirvana',
               true,
               'https://upload.wikimedia.org/wikipedia/ru/e/e9/Band_Nirvana.jpg',
               'Nirvana was an American rock band formed in 1987 in Aberdeen, Washington. Founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic, the band went through a succession of drummers before recruiting Dave Grohl in 1990. Nirvanas success popularized alternative rock, and they were often referenced as the figurehead band of Generation X.',
               g.genre_id,
               0
        from genres g
        where g.name = 'Grunge';
        insert into ratings(artist_id, daily, monthly, all_the_time)
        select a.artist_id,
               5,
               5,
               5
        from artists a
        where a.name = 'Nirvana';

    end
$$;
-- artists + ratings ^^

do
$$
    begin
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Paranoid',
               true,
               'https://upload.wikimedia.org/wikipedia/en/thumb/6/64/Black_Sabbath_-_Paranoid.jpg/220px-Black_Sabbath_-_Paranoid.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Heavy-metal'
          and e.type = 'flac'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Paranoid');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Master of Reality',
               true,
               'https://upload.wikimedia.org/wikipedia/en/4/40/Bsmor.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Capitol Records'
          and g.name = 'Heavy-metal'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Master of Reality');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Black Sabbath',
               true,
               'https://upload.wikimedia.org/wikipedia/en/d/da/Black_Sabbath_debut_album.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Sanctuary Records'
          and g.name = 'Heavy-metal'
          and e.type = 'wav'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Black Sabbath');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'The Number of the Beast',
               true,
               'https://upload.wikimedia.org/wikipedia/en/thumb/3/32/IronMaiden_NumberOfBeast.jpg/220px-IronMaiden_NumberOfBeast.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Capitol Records'
          and g.name = 'Heavy-metal'
          and e.type = 'flac'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'The Number of the Beast');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Powerslave',
               true,
               'https://upload.wikimedia.org/wikipedia/en/1/1c/Iron_Maiden_-_Powerslave.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Heavy-metal'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Powerslave');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Fear of the Dark',
               true,
               'https://upload.wikimedia.org/wikipedia/en/e/eb/Iron_Maiden_-_Fear_Of_The_Dark.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Capitol Records'
          and g.name = 'Heavy-metal'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Fear of the Dark');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Morrison Hotel',
               true,
               'https://upload.wikimedia.org/wikipedia/en/c/cd/The_Doors_-_Morrison_Hotel.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Blues-rock'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Morrison Hotel');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Strange Days',
               true,
               'https://upload.wikimedia.org/wikipedia/en/f/fc/AlbumStrangeDays.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Capitol Records'
          and g.name = 'Blues-rock'
          and e.type = 'wav'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Strange Days');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Blurryface',
               true,
               'https://shop.rukahore.sk/upload/twentyonepilots/Twenty_One_Pilots_Blurryface.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Fueled by Ramen'
          and g.name = 'Pop'
          and e.type = 'flac'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Blurryface');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Trench',
               true,
               'https://upload.wikimedia.org/wikipedia/en/f/f3/Trench_Twenty_One_Pilots.png',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Pop'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Trench');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Vessel',
               true,
               'https://upload.wikimedia.org/wikipedia/en/thumb/2/20/Vessel_by_Twenty_One_Pilots.jpg/220px-Vessel_by_Twenty_One_Pilots.jpg  ',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Fueled by Ramen'
          and g.name = 'Pop'
          and e.type = 'wav'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Vessel');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'At Folsom Prison',
               true,
               'https://upload.wikimedia.org/wikipedia/en/5/52/Johnny_Cash_At_Folsom_Prison.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Country'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'At Folsom Prison');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Metallica (The Black Album)',
               true,
               'https://upload.wikimedia.org/wikipedia/en/7/75/Metallica_-_Metallica_cover.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Metal'
          and e.type = 'flac'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Metallica (The Black Album)');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Live at the Regal',
               true,
               'https://upload.wikimedia.org/wikipedia/en/0/05/BBKing-LiveAtTheRegal.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Fontana Records'
          and g.name = 'Blues'
          and e.type = 'wav'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Live at the Regal');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Elvis Presley',
               true,
               'https://upload.wikimedia.org/wikipedia/en/e/e2/Elvis_Presley_%281956%29.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Atlantic Records'
          and g.name = 'Rock-n-roll'
          and e.type = 'flac'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Elvis Presley');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Physical Graffiti',
               true,
               'https://upload.wikimedia.org/wikipedia/en/e/e3/Led_Zeppelin_-_Physical_Graffiti.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Atlantic Records'
          and g.name = 'Rock'
          and e.type = 'flac'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Physical Graffiti');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Houses of the Holy',
               true,
               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSciga2V_RQKIrMdGFpbgjdhumJinbJp3X-d7hS6Ez06g&s',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Rock'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Houses of the Holy');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Led Zeppelin III',
               true,
               'https://upload.wikimedia.org/wikipedia/ru/0/0d/Led_Zeppelin_III.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Capitol Records'
          and g.name = 'Rock'
          and e.type = 'wav'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Led Zeppelin III');

        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'Nevermind',
               true,
               'https://m.media-amazon.com/images/I/51Smi49bo8L._SY200_QL15_.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Capitol Records'
          and g.name = 'Rock'
          and e.type = 'flac'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'Nevermind');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'In Utero',
               true,
               'https://upload.wikimedia.org/wikipedia/en/e/e5/In_Utero_%28Nirvana%29_album_cover.jpg',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Sanctuary Records'
          and g.name = 'Rock'
          and e.type = 'mp3'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'In Utero');
        insert into albums(name, is_available, cover_url, track_count, label_id, genre_id, encoding_id)
        select 'MTV Unplugged in New York',
               true,
               'https://upload.wikimedia.org/wikipedia/en/5/54/Nirvana_mtv_unplugged_in_new_york.png',
               0,
               l.label_id,
               g.genre_id,
               e.encoding_id
        from labels l,
             genres g,
             encodings e
        where l.name = 'Warner Records'
          and g.name = 'Rock'
          and e.type = 'wav'
          and not exists (select 1
                          from albums a
                          where a.label_id = l.label_id
                            and a.name = 'MTV Unplugged in New York');
    end
$$;
-- albums + labels ^^

do
$$
    begin
        with black_sabbath_id as (select artist_id
                                  from artists
                                  where name = 'Black Sabbath')
           , paranoid_id as (select album_id
                             from albums
                             where name = 'Paranoid')
        insert
        into artists_have_albums (artist_id, album_id)
        select bs.artist_id, p.album_id
        from black_sabbath_id bs
                 cross join paranoid_id p;

        with black_sabbath_id as (select artist_id
                                  from artists
                                  where name = 'Black Sabbath')
           , master_of_reality_id as (select album_id
                                      from albums
                                      where name = 'Master of Reality')
        insert
        into artists_have_albums (artist_id, album_id)
        select bs.artist_id, mr.album_id
        from black_sabbath_id bs
                 cross join master_of_reality_id mr;

        with black_sabbath_id as (select artist_id
                                  from artists
                                  where name = 'Black Sabbath')
           , black_sabbath_debut_id as (select album_id
                                        from albums
                                        where name = 'Black Sabbath')
        insert
        into artists_have_albums (artist_id, album_id)
        select bs.artist_id, bb.album_id
        from black_sabbath_id bs
                 cross join black_sabbath_debut_id bb;

        with iron_maiden_id as (select artist_id
                                from artists
                                where name = 'Iron Maiden')
           , number_of_the_beast_id as (select album_id
                                        from albums
                                        where name = 'The Number of the Beast')
        insert
        into artists_have_albums (artist_id, album_id)
        select im.artist_id, nb.album_id
        from iron_maiden_id im
                 cross join number_of_the_beast_id nb;

        with iron_maiden_id as (select artist_id
                                from artists
                                where name = 'Iron Maiden')
           , powerslave_id as (select album_id
                               from albums
                               where name = 'Powerslave')
        insert
        into artists_have_albums (artist_id, album_id)
        select im.artist_id, ps.album_id
        from iron_maiden_id im
                 cross join powerslave_id ps;

        with iron_maiden_id as (select artist_id
                                from artists
                                where name = 'Iron Maiden')
           , fear_of_the_dark_id as (select album_id
                                     from albums
                                     where name = 'Fear of the Dark')
        insert
        into artists_have_albums (artist_id, album_id)
        select im.artist_id, fd.album_id
        from iron_maiden_id im
                 cross join fear_of_the_dark_id fd;

        with the_doors_id as (select artist_id
                              from artists
                              where name = 'The Doors')
           , morrison_hotel_id as (select album_id
                                   from albums
                                   where name = 'Morrison Hotel')
        insert
        into artists_have_albums (artist_id, album_id)
        select td.artist_id, mh.album_id
        from the_doors_id td
                 cross join morrison_hotel_id mh;

        with the_doors_id as (select artist_id
                              from artists
                              where name = 'The Doors')
           , strange_days_id as (select album_id
                                 from albums
                                 where name = 'Strange Days')
        insert
        into artists_have_albums (artist_id, album_id)
        select td.artist_id, sd.album_id
        from the_doors_id td
                 cross join strange_days_id sd;

        with twenty_one_pilots_id as (select artist_id
                                      from artists
                                      where name = 'Twenty One Pilots')
           , blurryface_id as (select album_id
                               from albums
                               where name = 'Blurryface')
        insert
        into artists_have_albums (artist_id, album_id)
        select top_id.artist_id, bfa.album_id
        from twenty_one_pilots_id top_id
                 cross join blurryface_id bfa;

        with twenty_one_pilots_id as (select artist_id
                                      from artists
                                      where name = 'Twenty One Pilots')
           , trench_id as (select album_id
                           from albums
                           where name = 'Trench')
        insert
        into artists_have_albums (artist_id, album_id)
        select top_id.artist_id, trench_id.album_id
        from twenty_one_pilots_id top_id
                 cross join trench_id;

        with twenty_one_pilots_id as (select artist_id
                                      from artists
                                      where name = 'Twenty One Pilots')
           , vessel_id as (select album_id
                           from albums
                           where name = 'Vessel')
        insert
        into artists_have_albums (artist_id, album_id)
        select top_id.artist_id, vessel_id.album_id
        from twenty_one_pilots_id top_id
                 cross join vessel_id;

        with led_zeppelin_id as (select artist_id
                                 from artists
                                 where name = 'Led Zeppelin')
           , physical_graffiti_id as (select album_id
                                      from albums
                                      where name = 'Physical Graffiti')
        insert
        into artists_have_albums (artist_id, album_id)
        select lz_id.artist_id, pg_id.album_id
        from led_zeppelin_id lz_id
                 cross join physical_graffiti_id pg_id;


        with led_zeppelin_id as (select artist_id
                                 from artists
                                 where name = 'Led Zeppelin')
           , houses_of_the_holy_id as (select album_id
                                       from albums
                                       where name = 'Houses of the Holy')
        insert
        into artists_have_albums (artist_id, album_id)
        select lz_id.artist_id, hoth_id.album_id
        from led_zeppelin_id lz_id
                 cross join houses_of_the_holy_id hoth_id;

        with led_zeppelin_id as (select artist_id
                                 from artists
                                 where name = 'Led Zeppelin')
           , led_zeppelin_iii_id as (select album_id
                                     from albums
                                     where name = 'Led Zeppelin III')
        insert
        into artists_have_albums (artist_id, album_id)
        select lz_id.artist_id, lz_iii_id.album_id
        from led_zeppelin_id lz_id
                 cross join led_zeppelin_iii_id lz_iii_id;

        with johnny_cash_id as (select artist_id
                                from artists
                                where name = 'Johnny Cash')
           , at_folsom_prison_id as (select album_id
                                     from albums
                                     where name = 'At Folsom Prison')
        insert
        into artists_have_albums (artist_id, album_id)
        select jc_id.artist_id, afp_id.album_id
        from johnny_cash_id jc_id
                 cross join at_folsom_prison_id afp_id;

        with metallica_id as (select artist_id
                              from artists
                              where name = 'Metallica')
           , black_album_id as (select album_id
                                from albums
                                where name = 'Metallica (The Black Album)')
        insert
        into artists_have_albums (artist_id, album_id)
        select m_id.artist_id, ba_id.album_id
        from metallica_id m_id
                 cross join black_album_id ba_id;

        with elvis_presley_id as (select artist_id
                                  from artists
                                  where name = 'Elvis Presley')
           , elvis_album_id as (select album_id
                                from albums
                                where name = 'Elvis Presley')
        insert
        into artists_have_albums (artist_id, album_id)
        select ep_id.artist_id, ea_id.album_id
        from elvis_presley_id ep_id
                 cross join elvis_album_id ea_id;

        with bb_king_id as (select artist_id
                            from artists
                            where name = 'B.B. King')
           , live_at_regal_id as (select album_id
                                  from albums
                                  where name = 'Live at the Regal')
        insert
        into artists_have_albums (artist_id, album_id)
        select bb_id.artist_id, lar_id.album_id
        from bb_king_id bb_id
                 cross join live_at_regal_id lar_id;

        with nirvana_id as (select artist_id
                            from artists
                            where name = 'Nirvana')
           , nevermind_id as (select album_id
                              from albums
                              where name = 'Nevermind')
        insert
        into artists_have_albums (artist_id, album_id)
        select n_id.artist_id, nm_id.album_id
        from nirvana_id n_id
                 cross join nevermind_id nm_id;

        with nirvana_id as (select artist_id
                            from artists
                            where name = 'Nirvana')
           , in_utero_id as (select album_id
                             from albums
                             where name = 'In Utero')
        insert
        into artists_have_albums (artist_id, album_id)
        select n_id.artist_id, iu_id.album_id
        from nirvana_id n_id
                 cross join in_utero_id iu_id;

        with nirvana_id as (select artist_id
                            from artists
                            where name = 'Nirvana')
           , mtv_unplugged_id as (select album_id
                                  from albums
                                  where name = 'MTV Unplugged in New York')
        insert
        into artists_have_albums (artist_id, album_id)
        select n_id.artist_id, mtv_id.album_id
        from nirvana_id n_id
                 cross join mtv_unplugged_id mtv_id;
    end
$$;
-- connect albums && artists ^^

do
$$
    begin
        with paranoid_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('War Pigs', true, 'age', 442000, 'https://example.com/warpigs.mp3', 10240,
                        'https://example.com/warpigs_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Paranoid', true, 'age', 200000, 'https://example.com/paranoid.mp3', 5120,
                        'https://example.com/paranoid_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Planet Caravan', true, 'age', 306000, 'https://example.com/planetcaravan.mp3', 7168,
                        'https://example.com/planetcaravan_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Iron Man', true, 'age', 357000, 'https://example.com/ironman.mp3', 8192,
                        'https://example.com/ironman_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Electric Funeral', true, 'age', 293000, 'https://example.com/electricfuneral.mp3', 6144,
                        'https://example.com/electricfuneral_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Hand of Doom', true, 'age', 430000, 'https://example.com/handofdoom.mp3', 9216,
                        'https://example.com/handofdoom_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Rat Salad', true, 'age', 156000, 'https://example.com/ratsalad.mp3', 3072,
                        'https://example.com/ratsalad_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Fairies Wear Boots', true, 'age', 373000, 'https://example.com/fairieswearboots.mp3', 8704,
                        'https://example.com/fairieswearboots_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Heavy-metal'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, pt.track_id
        from paranoid_tracks pt
                 cross join albums a
        where a.name = 'Paranoid';

        with master_of_reality_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Sweet Leaf', true, 'age', 339000, 'https://example.com/sweetleaf.mp3', 8192,
                        'https://example.com/sweetleaf_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('After Forever', true, 'age', 350000, 'https://example.com/afterforever.mp3', 8192,
                        'https://example.com/afterforever_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Embryo', true, 'age', 121000, 'https://example.com/embryo.mp3', 3072,
                        'https://example.com/embryo_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Children of the Grave', true, 'age', 329000, 'https://example.com/childrenofthegrave.mp3',
                        8192, 'https://example.com/childrenofthegrave_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Orchid', true, 'age', 123000, 'https://example.com/orchid.mp3', 3072,
                        'https://example.com/orchid_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Lord of This World', true, 'age', 307000, 'https://example.com/lordofthisworld.mp3', 8192,
                        'https://example.com/lordofthisworld_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Solitude', true, 'age', 318000, 'https://example.com/solitude.mp3', 8192,
                        'https://example.com/solitude_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Into the Void', true, 'age', 387000, 'https://example.com/intothevoid.mp3', 9216,
                        'https://example.com/intothevoid_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Heavy-metal'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, mrt.track_id
        from master_of_reality_tracks mrt
                 cross join albums a
        where a.name = 'Master of Reality';

        with inserted_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Black Sabbath', true, 'paec', 420000, 'https://example.com/black_sabbath.mp3', 5120,
                        'https://example.com/black_sabbath_cover.jpg', 7, 1, 1),
                       ('The Wizard', true, 'exp_lyrics', 320000, 'https://example.com/the_wizard.mp3', 4096,
                        'https://example.com/the_wizard_cover.jpg', 6, 2, 1),
                       ('Behind the Wall of Sleep', true, 'age', 390000,
                        'https://example.com/behind_the_wall_of_sleep.mp3', 4608,
                        'https://example.com/behind_the_wall_of_sleep_cover.jpg', 5, 3, 1),
                       ('N.I.B.', true, 'paec', 380000, 'https://example.com/nib.mp3', 4096,
                        'https://example.com/nib_cover.jpg', 8, 4, 1),
                       ('Evil Woman', true, 'exp_lyrics', 280000, 'https://example.com/evil_woman.mp3', 3584,
                        'https://example.com/evil_woman_cover.jpg', 4, 5, 1),
                       ('Sleeping Village', true, 'age', 450000, 'https://example.com/sleeping_village.mp3', 5120,
                        'https://example.com/sleeping_village_cover.jpg', 3, 6, 1),
                       ('Warning', true, 'paec', 510000, 'https://example.com/warning.mp3', 6144,
                        'https://example.com/warning_cover.jpg', 9, 7, 1)
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, it.track_id
        from inserted_tracks it
                 cross join albums a
        where a.name = 'Black Sabbath';

        with number_of_the_beast_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Invaders', true, 'age', 208000, 'https://example.com/invaders.mp3', 5120,
                        'https://example.com/invaders_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Children of the Damned', true, 'age', 263000, 'https://example.com/childrenofthedamned.mp3',
                        6144,
                        'https://example.com/childrenofthedamned_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('The Prisoner', true, 'age', 368000, 'https://example.com/theprisoner.mp3', 8192,
                        'https://example.com/theprisoner_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('22 Acacia Avenue', true, 'age', 410000, 'https://example.com/22acaciaavenue.mp3', 9216,
                        'https://example.com/22acaciaavenue_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('The Number of the Beast', true, 'age', 464000, 'https://example.com/numberofthebeast.mp3',
                        10240,
                        'https://example.com/numberofthebeast_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Run to the Hills', true, 'age', 205000, 'https://example.com/runtothehills.mp3', 5120,
                        'https://example.com/runtothehills_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Gangland', true, 'age', 213000, 'https://example.com/gangland.mp3', 5120,
                        'https://example.com/gangland_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Hallowed Be Thy Name', true, 'age', 454000, 'https://example.com/hallowedbethyname.mp3', 10240,
                        'https://example.com/hallowedbethyname_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Heavy-metal'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, nb.track_id
        from number_of_the_beast_tracks nb
                 cross join albums a
        where a.name = 'The Number of the Beast';

        with powerslave_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Aces High', true, 'age', 282000, 'https://example.com/aceshigh.mp3', 7168,
                        'https://example.com/aceshigh_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('2 Minutes to Midnight', true, 'age', 366000, 'https://example.com/2minutestomidnight.mp3',
                        8192,
                        'https://example.com/2minutestomidnight_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Losfer Words (Big Orra)', true, 'age', 276000, 'https://example.com/losferwords.mp3', 7168,
                        'https://example.com/losferwords_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Flash of the Blade', true, 'age', 188000, 'https://example.com/flashoftheblade.mp3', 5120,
                        'https://example.com/flashoftheblade_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('The Duellists', true, 'age', 359000, 'https://example.com/theduellists.mp3', 8192,
                        'https://example.com/theduellists_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Back in the Village', true, 'age', 232000, 'https://example.com/backinthevillage.mp3', 6144,
                        'https://example.com/backinthevillage_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Powerslave', true, 'age', 426000, 'https://example.com/powerslave.mp3', 10240,
                        'https://example.com/powerslave_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Rime of the Ancient Mariner', true, 'age', 812000,
                        'https://example.com/rimeoftheancientmariner.mp3', 17408,
                        'https://example.com/rimeoftheancientmariner_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Heavy-metal'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, pt.track_id
        from powerslave_tracks pt
                 cross join albums a
        where a.name = 'Powerslave';

        with fear_of_the_dark_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Be Quick or Be Dead', true, 'age', 212000, 'https://example.com/bequickorbedead.mp3', 5120,
                        'https://example.com/bequickorbedead_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('From Here to Eternity', true, 'age', 226000, 'https://example.com/fromheretoeternity.mp3',
                        5120,
                        'https://example.com/fromheretoeternity_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Afraid to Shoot Strangers', true, 'age', 430000,
                        'https://example.com/afraidtoshootstrangers.mp3', 10240,
                        'https://example.com/afraidtoshootstrangers_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Fear Is the Key', true, 'age', 351000, 'https://example.com/fearisthekey.mp3', 8192,
                        'https://example.com/fearisthekey_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Childhoods End', true, 'age', 284000, 'https://example.com/childhoodsend.mp3', 7168,
                        'https://example.com/childhoodsend_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Wasting Love', true, 'age', 356000, 'https://example.com/wastinglove.mp3', 8192,
                        'https://example.com/wastinglove_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('The Fugitive', true, 'age', 272000, 'https://example.com/thefugitive.mp3', 6144,
                        'https://example.com/thefugitive_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Chains of Misery', true, 'age', 446000, 'https://example.com/chainsofmisery.mp3', 10240,
                        'https://example.com/chainsofmisery_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('The Apparition', true, 'age', 300000, 'https://example.com/theapparition.mp3', 7168,
                        'https://example.com/theapparition_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Judas Be My Guide', true, 'age', 312000, 'https://example.com/judasbemyguide.mp3', 7168,
                        'https://example.com/judasbemyguide_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Weekend Warrior', true, 'age', 234000, 'https://example.com/weekendwarrior.mp3', 5120,
                        'https://example.com/weekendwarrior_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Heavy-metal')),
                       ('Fear of the Dark', true, 'age', 437000, 'https://example.com/fearofthedark.mp3', 10240,
                        'https://example.com/fearofthedark_cover.jpg', 1, 12,
                        (select genre_id from genres where name = 'Heavy-metal'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, fotd.track_id
        from fear_of_the_dark_tracks fotd
                 cross join albums a
        where a.name = 'Fear of the Dark';

        with morrison_hotel_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Roadhouse Blues', true, 'age', 251000, 'https://example.com/roadhouseblues.mp3', 6144,
                        'https://example.com/roadhouseblues_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Waiting for the Sun', true, 'age', 235000, 'https://example.com/waitingforthesun.mp3', 5120,
                        'https://example.com/waitingforthesun_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('You Make Me Real', true, 'age', 132000, 'https://example.com/youmakemereal.mp3', 3072,
                        'https://example.com/youmakemereal_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Peace Frog', true, 'age', 143000, 'https://example.com/peacefrog.mp3', 3072,
                        'https://example.com/peacefrog_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Blue Sunday', true, 'age', 140000, 'https://example.com/bluesunday.mp3', 3072,
                        'https://example.com/bluesunday_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Ship of Fools', true, 'age', 181000, 'https://example.com/shipoffools.mp3', 5120,
                        'https://example.com/shipoffools_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Land Ho!', true, 'age', 184000, 'https://example.com/landho.mp3', 5120,
                        'https://example.com/landho_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('The Spy', true, 'age', 260000, 'https://example.com/thespy.mp3', 7168,
                        'https://example.com/thespy_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Queen of the Highway', true, 'age', 147000, 'https://example.com/queenofthehighway.mp3', 3072,
                        'https://example.com/queenofthehighway_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Indian Summer', true, 'age', 146000, 'https://example.com/indiansummer.mp3', 3072,
                        'https://example.com/indiansummer_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Maggie MacGill', true, 'age', 244000, 'https://example.com/maggiemgill.mp3', 6144,
                        'https://example.com/maggiemgill_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Blues-rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, mht.track_id
        from morrison_hotel_tracks mht
                 cross join albums a
        where a.name = 'Morrison Hotel';

        with strange_days_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Strange Days', true, 'age', 231000, 'https://example.com/strangedays.mp3', 5120,
                        'https://example.com/strangedays_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('You are Lost Little Girl', true, 'age', 180000, 'https://example.com/yourelostlittlegirl.mp3',
                        4096,
                        'https://example.com/yourelostlittlegirl_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Love Me Two Times', true, 'age', 197000, 'https://example.com/lovemetwotimes.mp3', 4096,
                        'https://example.com/lovemetwotimes_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Unhappy Girl', true, 'age', 124000, 'https://example.com/unhappygirl.mp3', 3072,
                        'https://example.com/unhappygirl_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Horse Latitudes', true, 'age', 221000, 'https://example.com/horselatitudes.mp3', 5120,
                        'https://example.com/horselatitudes_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('Moonlight Drive', true, 'age', 200000, 'https://example.com/moonlightdrive.mp3', 4096,
                        'https://example.com/moonlightdrive_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('People Are Strange', true, 'age', 123000, 'https://example.com/peoplearestrange.mp3', 3072,
                        'https://example.com/peoplearestrange_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('My Eyes Have Seen You', true, 'age', 143000, 'https://example.com/myeyeshaveseenyou.mp3', 3072,
                        'https://example.com/myeyeshaveseenyou_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('I Cannot See Your Face in My Mind', true, 'age', 208000,
                        'https://example.com/icantseeyourfaceinmymind.mp3', 5120,
                        'https://example.com/icantseeyourfaceinmymind_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Blues-rock')),
                       ('When the Music is Over', true, 'age', 680000, 'https://example.com/whenthemusics_over.mp3',
                        15360,
                        'https://example.com/whenthemusics_over_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Blues-rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, sdt.track_id
        from strange_days_tracks sdt
                 cross join albums a
        where a.name = 'Strange Days';

        with blurryface_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Stressed Out', true, 'age', 202000, 'https://example.com/stressedout.mp3', 5120,
                        'https://example.com/stressedout_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Pop')),
                       ('Ride', true, 'age', 198000, 'https://example.com/ride.mp3', 5120,
                        'https://example.com/ride_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Pop')),
                       ('Heathens', true, 'age', 195000, 'https://example.com/heathens.mp3', 5120,
                        'https://example.com/heathens_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Pop')),
                       ('Lane Boy', true, 'age', 216000, 'https://example.com/laneboy.mp3', 5120,
                        'https://example.com/laneboy_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Pop')),
                       ('Tear in My Heart', true, 'age', 209000, 'https://example.com/tearinmyheart.mp3', 5120,
                        'https://example.com/tearinmyheart_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Pop')),
                       ('Fairly Local', true, 'age', 188000, 'https://example.com/fairlylocal.mp3', 4096,
                        'https://example.com/fairlylocal_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Pop')),
                       ('Heavydirtysoul', true, 'age', 229000, 'https://example.com/heavydirtysoul.mp3', 5120,
                        'https://example.com/heavydirtysoul_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Pop')),
                       ('The Judge', true, 'age', 160000, 'https://example.com/thejudge.mp3', 4096,
                        'https://example.com/thejudge_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Pop')),
                       ('Message Man', true, 'age', 227000, 'https://example.com/messageman.mp3', 5120,
                        'https://example.com/messageman_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Pop')),
                       ('Hometown', true, 'age', 213000, 'https://example.com/hometown.mp3', 5120,
                        'https://example.com/hometown_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Pop')),
                       ('Not Today', true, 'age', 226000, 'https://example.com/nottoday.mp3', 5120,
                        'https://example.com/nottoday_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Pop')),
                       ('Goner', true, 'age', 207000, 'https://example.com/goner.mp3', 5120,
                        'https://example.com/goner_cover.jpg', 1, 12,
                        (select genre_id from genres where name = 'Pop'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, bft.track_id
        from blurryface_tracks bft
                 cross join albums a
        where a.name = 'Blurryface';

        with trench_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Jumpsuit', true, 'age', 243000, 'https://example.com/jumpsuit.mp3', 6144,
                        'https://example.com/jumpsuit_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Pop')),
                       ('Levitate', true, 'age', 176000, 'https://example.com/levitate.mp3', 4096,
                        'https://example.com/levitate_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Pop')),
                       ('Morph', true, 'age', 269000, 'https://example.com/morph.mp3', 7168,
                        'https://example.com/morph_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Pop')),
                       ('My Blood', true, 'age', 232000, 'https://example.com/myblood.mp3', 6144,
                        'https://example.com/myblood_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Pop')),
                       ('Chlorine', true, 'age', 191000, 'https://example.com/chlorine.mp3', 5120,
                        'https://example.com/chlorine_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Pop')),
                       ('Smithereens', true, 'age', 185000, 'https://example.com/smithereens.mp3', 5120,
                        'https://example.com/smithereens_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Pop')),
                       ('Neon Gravestones', true, 'age', 233000, 'https://example.com/neongravestones.mp3', 6144,
                        'https://example.com/neongravestones_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Pop')),
                       ('The Hype', true, 'age', 244000, 'https://example.com/thehype.mp3', 6144,
                        'https://example.com/thehype_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Pop')),
                       ('Nico and the Niners', true, 'age', 205000, 'https://example.com/nicoandtheniners.mp3', 5120,
                        'https://example.com/nicoandtheniners_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Pop')),
                       ('Cut My Lip', true, 'age', 218000, 'https://example.com/cutmylip.mp3', 5120,
                        'https://example.com/cutmylip_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Pop')),
                       ('Bandito', true, 'age', 297000, 'https://example.com/bandito.mp3', 7168,
                        'https://example.com/bandito_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Pop')),
                       ('Pet Cheetah', true, 'age', 220000, 'https://example.com/petcheetah.mp3', 5120,
                        'https://example.com/petcheetah_cover.jpg', 1, 12,
                        (select genre_id from genres where name = 'Pop')),
                       ('Legend', true, 'age', 162000, 'https://example.com/legend.mp3', 4096,
                        'https://example.com/legend_cover.jpg', 1, 13,
                        (select genre_id from genres where name = 'Pop')),
                       ('Leave the City', true, 'age', 244000, 'https://example.com/leavethecity.mp3', 6144,
                        'https://example.com/leavethecity_cover.jpg', 1, 14,
                        (select genre_id from genres where name = 'Pop')),
                       ('Smithereens (Trench Version)', true, 'age', 185000,
                        'https://example.com/smithereens_trench.mp3',
                        5120, 'https://example.com/smithereens_trench_cover.jpg', 1, 15,
                        (select genre_id from genres where name = 'Pop'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, tt.track_id
        from trench_tracks tt
                 cross join albums a
        where a.name = 'Trench';

        with vessel_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Ode to Sleep', true, 'age', 332000, 'https://example.com/odetosleep.mp3', 7168,
                        'https://example.com/odetosleep_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Pop')),
                       ('Holding on to You', true, 'age', 229000, 'https://example.com/holdingontoyou.mp3', 5120,
                        'https://example.com/holdingontoyou_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Pop')),
                       ('Migraine', true, 'age', 280000, 'https://example.com/migraine.mp3', 6144,
                        'https://example.com/migraine_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Pop')),
                       ('House of Gold', true, 'age', 163000, 'https://example.com/houseofgold.mp3', 4096,
                        'https://example.com/houseofgold_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Pop')),
                       ('Car Radio', true, 'age', 259000, 'https://example.com/carradio.mp3', 6144,
                        'https://example.com/carradio_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Pop')),
                       ('Semi-Automatic', true, 'age', 255000, 'https://example.com/semiautomatic.mp3', 6144,
                        'https://example.com/semiautomatic_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Pop')),
                       ('Screen', true, 'age', 213000, 'https://example.com/screen.mp3', 5120,
                        'https://example.com/screen_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Pop')),
                       ('The Run and Go', true, 'age', 198000, 'https://example.com/therunandgo.mp3', 5120,
                        'https://example.com/therunandgo_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Pop')),
                       ('Fake You Out', true, 'age', 259000, 'https://example.com/fakeyouout.mp3', 6144,
                        'https://example.com/fakeyouout_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Pop')),
                       ('Guns for Hands', true, 'age', 191000, 'https://example.com/gunsforhands.mp3', 5120,
                        'https://example.com/gunsforhands_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Pop')),
                       ('Trees', true, 'age', 254000, 'https://example.com/trees.mp3', 6144,
                        'https://example.com/trees_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Pop')),
                       ('Truce', true, 'age', 148000, 'https://example.com/truce.mp3', 4096,
                        'https://example.com/truce_cover.jpg', 1, 12,
                        (select genre_id from genres where name = 'Pop'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, vt.track_id
        from vessel_tracks vt
                 cross join albums a
        where a.name = 'Vessel';

        with at_folsom_prison_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Folsom Prison Blues', true, 'age', 170000, 'https://example.com/folsom_prison_blues.mp3', 4096,
                        'https://example.com/folsom_prison_blues_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Country')),
                       ('Dark as the Dungeon', true, 'age', 164000, 'https://example.com/dark_as_the_dungeon.mp3', 4096,
                        'https://example.com/dark_as_the_dungeon_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Country')),
                       ('I Still Miss Someone', true, 'age', 150000, 'https://example.com/i_still_miss_someone.mp3',
                        4096,
                        'https://example.com/i_still_miss_someone_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Country')),
                       ('Cocaine Blues', true, 'age', 166000, 'https://example.com/cocaine_blues.mp3', 4096,
                        'https://example.com/cocaine_blues_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Country')),
                       ('25 Minutes to Go', true, 'age', 137000, 'https://example.com/25_minutes_to_go.mp3', 3072,
                        'https://example.com/25_minutes_to_go_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Country')),
                       ('Orange Blossom Special', true, 'age', 224000, 'https://example.com/orange_blossom_special.mp3',
                        5120,
                        'https://example.com/orange_blossom_special_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Country')),
                       ('The Long Black Veil', true, 'age', 207000, 'https://example.com/the_long_black_veil.mp3', 5120,
                        'https://example.com/the_long_black_veil_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Country')),
                       ('Send a Picture of Mother', true, 'age', 155000,
                        'https://example.com/send_a_picture_of_mother.mp3', 4096,
                        'https://example.com/send_a_picture_of_mother_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Country')),
                       ('The Wall', true, 'age', 150000, 'https://example.com/the_wall.mp3', 4096,
                        'https://example.com/the_wall_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Country')),
                       ('Dirty Old Egg-Sucking Dog', true, 'age', 159000,
                        'https://example.com/dirty_old_egg_sucking_dog.mp3', 4096,
                        'https://example.com/dirty_old_egg_sucking_dog_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Country')),
                       ('Flushed from the Bathroom of Your Heart', true, 'age', 160000,
                        'https://example.com/flushed_from_the_bathroom_of_your_heart.mp3', 4096,
                        'https://example.com/flushed_from_the_bathroom_of_your_heart_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Country')),
                       ('Joe Bean', true, 'age', 185000, 'https://example.com/joe_bean.mp3', 4096,
                        'https://example.com/joe_bean_cover.jpg', 1, 12,
                        (select genre_id from genres where name = 'Country'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, afpt.track_id
        from at_folsom_prison_tracks afpt
                 cross join albums a
        where a.name = 'At Folsom Prison';

        with metallica_black_album_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Enter Sandman', true, 'age', 336000, 'https://example.com/enter_sandman.mp3', 8192,
                        'https://example.com/enter_sandman_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Metal')),
                       ('Sad but True', true, 'age', 324000, 'https://example.com/sad_but_true.mp3', 8192,
                        'https://example.com/sad_but_true_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Metal')),
                       ('Holier Than Thou', true, 'age', 228000, 'https://example.com/holier_than_thou.mp3', 6144,
                        'https://example.com/holier_than_thou_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Metal')),
                       ('The Unforgiven', true, 'age', 386000, 'https://example.com/the_unforgiven.mp3', 9216,
                        'https://example.com/the_unforgiven_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Metal')),
                       ('Wherever I May Roam', true, 'age', 399000, 'https://example.com/wherever_i_may_roam.mp3', 9216,
                        'https://example.com/wherever_i_may_roam_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Metal')),
                       ('Dont Tread on Me', true, 'age', 240000, 'https://example.com/dont_tread_on_me.mp3', 6144,
                        'https://example.com/dont_tread_on_me_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Metal')),
                       ('Through the Never', true, 'age', 280000, 'https://example.com/through_the_never.mp3', 7168,
                        'https://example.com/through_the_never_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Metal')),
                       ('Nothing Else Matters', true, 'age', 387000, 'https://example.com/nothing_else_matters.mp3',
                        9216,
                        'https://example.com/nothing_else_matters_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Metal')),
                       ('Of Wolf and Man', true, 'age', 256000, 'https://example.com/of_wolf_and_man.mp3', 7168,
                        'https://example.com/of_wolf_and_man_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Metal')),
                       ('The God That Failed', true, 'age', 320000, 'https://example.com/the_god_that_failed.mp3', 7168,
                        'https://example.com/the_god_that_failed_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Metal')),
                       ('My Friend of Misery', true, 'age', 386000, 'https://example.com/my_friend_of_misery.mp3', 9216,
                        'https://example.com/my_friend_of_misery_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Metal')),
                       ('The Struggle Within', true, 'age', 204000, 'https://example.com/the_struggle_within.mp3', 6144,
                        'https://example.com/the_struggle_within_cover.jpg', 1, 12,
                        (select genre_id from genres where name = 'Metal'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, mbat.track_id
        from metallica_black_album_tracks mbat
                 cross join albums a
        where a.name = 'Metallica (The Black Album)';

        with live_at_the_regal_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Every Day I Have the Blues', true, 'age', 275000,
                        'https://example.com/every_day_i_have_the_blues.mp3', 6144,
                        'https://example.com/every_day_i_have_the_blues_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Blues')),
                       ('Sweet Little Angel', true, 'age', 346000, 'https://example.com/sweet_little_angel.mp3', 8192,
                        'https://example.com/sweet_little_angel_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Blues')),
                       ('Its My Own Fault', true, 'age', 312000, 'https://example.com/its_my_own_fault.mp3', 7168,
                        'https://example.com/its_my_own_fault_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Blues')),
                       ('How Blue Can You Get', true, 'age', 300000, 'https://example.com/how_blue_can_you_get.mp3',
                        7168,
                        'https://example.com/how_blue_can_you_get_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Blues')),
                       ('Please Accept My Love', true, 'age', 286000, 'https://example.com/please_accept_my_love.mp3',
                        6144,
                        'https://example.com/please_accept_my_love_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Blues')),
                       ('You Upset Me Baby', true, 'age', 250000, 'https://example.com/you_upset_me_baby.mp3', 6144,
                        'https://example.com/you_upset_me_baby_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Blues')),
                       ('Worry, Worry, Worry ', true, 'age', 242000, 'https://example.com/worry_worry_worry.mp3', 6144,
                        'https://example.com/worry_worry_worry_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Blues')),
                       ('Woke Up This Morning (My Baby is Gone)', true, 'age', 278000,
                        'https://example.com/woke_up_this_morning.mp3', 6144,
                        'https://example.com/woke_up_this_morning_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Blues')),
                       ('You Done Lost Your Good Thing Now', true, 'age', 244000,
                        'https://example.com/you_done_lost_your_good_thing_now.mp3', 6144,
                        'https://example.com/you_done_lost_your_good_thing_now_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Blues')),
                       ('Help the Poor', true, 'age', 294000, 'https://example.com/help_the_poor.mp3', 7168,
                        'https://example.com/help_the_poor_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Blues'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, latrt.track_id
        from live_at_the_regal_tracks latrt
                 cross join albums a
        where a.name = 'Live at the Regal';

        with elvis_presley_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Blue Suede Shoes', true, 'age', 123000, 'https://example.com/blue_suede_shoes.mp3', 3072,
                        'https://example.com/blue_suede_shoes_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Rock-n-roll')),
                       ('I am Counting On You', true, 'age', 138000, 'https://example.com/im_counting_on_you.mp3', 3072,
                        'https://example.com/im_counting_on_you_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Rock-n-roll')),
                       ('I Got a Woman', true, 'age', 157000, 'https://example.com/i_got_a_woman.mp3', 3072,
                        'https://example.com/i_got_a_woman_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Rock-n-roll')),
                       ('One-Sided Love Affair', true, 'age', 142000, 'https://example.com/one_sided_love_affair.mp3',
                        3072,
                        'https://example.com/one_sided_love_affair_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Rock-n-roll'))
                        ,
                       ('I Love You Because', true, 'age', 137000, 'https://example.com/i_love_you_because.mp3', 3072,
                        'https://example.com/i_love_you_because_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Rock-n-roll'))
                        ,
                       ('Just Because', true, 'age', 118000, 'https://example.com/just_because.mp3', 3072,
                        'https://example.com/just_because_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Rock-n-roll'))
                        ,
                       ('Tutti Frutti', true, 'age', 122000, 'https://example.com/tutti_frutti.mp3', 3072,
                        'https://example.com/tutti_frutti_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Rock-n-roll'))
                        ,
                       ('Trying to Get to You', true, 'age', 137000, 'https://example.com/trying_to_get_to_you.mp3',
                        3072,
                        'https://example.com/trying_to_get_to_you_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Rock-n-roll'))
                        ,
                       ('I am Gonna Sit Right Down and Cry (Over You) ', true, 'age', 128000,
                        ' https://example.com/im_gonna_sit_right_down_and_cry.mp3 ', 3072,
                        ' https://example.com/im_gonna_sit_right_down_and_cry_cover.jpg ', 1, 9,
                        (select genre_id from genres where name = 'Rock-n-roll')),
                       (' I will Never Let You Go (Little Darling) ', true, 'age', 136000,
                        'https://example.com/ill_never_let_you_go.mp3', 3072,
                        'https://example.com/ill_never_let_you_go_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Rock-n-roll')),
                       ('Blue Moon', true, 'age', 160000, 'https://example.com/blue_moon.mp3', 3072,
                        'https://example.com/blue_moon_cover.jpg', 1, 11,
                        (select genre_id from genres where name = 'Rock-n-roll')),
                       ('Money Honey', true, 'age', 138000, 'https://example.com/money_honey.mp3', 3072,
                        'https://example.com/money_honey_cover.jpg', 1, 12,
                        (select genre_id from genres where name = 'Rock-n-roll'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, ept.track_id
        from elvis_presley_tracks ept
                 cross join albums a
        where a.name = 'Elvis Presley';

        with physical_graffiti_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Custard Pie', true, 'age', 442000, 'https://example.com/custardpie.mp3', 10240,
                        'https://example.com/custardpie_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Rock')),
                       ('The Rover', true, 'age', 200000, 'https://example.com/therover.mp3', 5120,
                        'https://example.com/therover_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Rock')),
                       ('In My Time of Dying', true, 'age', 306000, 'https://example.com/inmytimeofdying.mp3', 7168,
                        'https://example.com/inmytimeofdying_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Rock')),
                       ('Houses of the Holy', true, 'age', 357000, 'https://example.com/housesoftheholy.mp3', 8192,
                        'https://example.com/housesoftheholy_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Rock')),
                       ('Trampled Under Foot', true, 'age', 293000, 'https://example.com/trampledunderfoot.mp3', 6144,
                        'https://example.com/trampledunderfoot_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Rock')),
                       ('Kashmir', true, 'age', 430000, 'https://example.com/kashmir_pg.mp3', 9216,
                        'https://example.com/kashmir_pg_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Rock')),
                       ('In the Light', true, 'age', 156000, 'https://example.com/inthelight.mp3', 3072,
                        'https://example.com/inthelight_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Rock')),
                       ('Bron-Yr-Aur', true, 'age', 373000, 'https://example.com/bron-yraur.mp3', 8704,
                        'https://example.com/bron-yraur_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, pt.track_id
        from physical_graffiti_tracks pt
                 cross join (select album_id from albums where name = 'Physical Graffiti') as a;

        with houses_of_the_holy_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('The Song Remains the Same', true, 'age', 442000,
                        'https://example.com/thesongremainsthesame.mp3', 10240,
                        'https://example.com/thesongremainsthesame_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Rock')),
                       ('The Rain Song', true, 'age', 200000, 'https://example.com/therainsong.mp3', 5120,
                        'https://example.com/therainsong_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Rock')),
                       ('Over the Hills and Far Away', true, 'age', 306000,
                        'https://example.com/overthehillsandfaraway.mp3', 7168,
                        'https://example.com/overthehillsandfaraway_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Rock')),
                       ('The Crunge', true, 'age', 357000, 'https://example.com/thecrunge.mp3', 8192,
                        'https://example.com/thecrunge_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Rock')),
                       ('Dancing Days', true, 'age', 293000, 'https://example.com/dancingdays.mp3', 6144,
                        'https://example.com/dancingdays_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Rock')),
                       ('Dyer Maker', true, 'age', 430000, 'https://example.com/dyermaker.mp3', 9216,
                        'https://example.com/dyermaker_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Rock')),
                       ('No Quarter', true, 'age', 156000, 'https://example.com/noquarter.mp3', 3072,
                        'https://example.com/noquarter_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Rock')),
                       ('The Ocean', true, 'age', 373000, 'https://example.com/theocean.mp3', 8704,
                        'https://example.com/theocean_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, ht.track_id
        from houses_of_the_holy_tracks ht
                 cross join (select album_id from albums where name = 'Houses of the Holy') as a;

        with led_zeppelin_iii_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Immigrant Song', true, 'age', 442000, 'https://example.com/immigrantsong.wav', 10240,
                        'https://example.com/immigrantsong_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Rock')),
                       ('Friends', true, 'age', 200000, 'https://example.com/friends.wav', 5120,
                        'https://example.com/friends_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Rock')),
                       ('Celebration Day', true, 'age', 306000, 'https://example.com/celebrationday.wav', 7168,
                        'https://example.com/celebrationday_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Rock')),
                       ('Since I have Been Loving You', true, 'age', 357000,
                        'https://example.com/sinceivebeenlovingyou.wav', 8192,
                        'https://example.com/sinceivebeenlovingyou_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Rock')),
                       ('Out on the Tiles', true, 'age', 293000, 'https://example.com/outonthetiles.wav', 6144,
                        'https://example.com/outonthetiles_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Rock')),
                       ('Gallows Pole', true, 'age', 430000, 'https://example.com/gallowspole.wav', 9216,
                        'https://example.com/gallowspole_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Rock')),
                       ('Tangerine', true, 'age', 156000, 'https://example.com/tangerine.wav', 3072,
                        'https://example.com/tangerine_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Rock')),
                       ('That is the Way', true, 'age', 373000, 'https://example.com/thatstheway.wav', 8704,
                        'https://example.com/thatstheway_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, lziii.track_id
        from led_zeppelin_iii_tracks lziii
                 cross join (select album_id from albums where name = 'Led Zeppelin III') as a;

        with nevermind_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Smells Like Teen Spirit', true, 'age', 442000, 'https://example.com/smellsliketeenspirit.flac',
                        10240,
                        'https://example.com/smellsliketeenspirit_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Rock')),
                       ('In Bloom', true, 'age', 200000, 'https://example.com/inbloom.flac', 5120,
                        'https://example.com/inbloom_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Rock')),
                       ('Come as You Are', true, 'age', 306000, 'https://example.com/comeasyouare.flac', 7168,
                        'https://example.com/comeasyouare_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Rock')),
                       ('Breed', true, 'age', 357000, 'https://example.com/breed.flac', 8192,
                        'https://example.com/breed_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Rock')),
                       ('Lithium', true, 'age', 293000, 'https://example.com/lithium.flac', 6144,
                        'https://example.com/lithium_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Rock')),
                       ('Polly', true, 'age', 430000, 'https://example.com/polly.flac', 9216,
                        'https://example.com/polly_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Rock')),
                       ('Territorial Pissings', true, 'age', 156000, 'https://example.com/territorialpissings.flac',
                        3072,
                        'https://example.com/territorialpissings_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Rock')),
                       ('Drain You', true, 'age', 373000, 'https://example.com/drainyou.flac', 8704,
                        'https://example.com/drainyou_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, nm.track_id
        from nevermind_tracks nm
                 cross join (select album_id from albums where name = 'Nevermind') as a;

        with in_utero_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('Serve the Servants', true, 'age', 442000, 'https://example.com/servetheservants.mp3', 10240,
                        'https://example.com/servetheservants_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Rock')),
                       ('Scentless Apprentice', true, 'age', 200000, 'https://example.com/scentlessapprentice.mp3',
                        5120,
                        'https://example.com/scentlessapprentice_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Rock')),
                       ('Heart-Shaped Box', true, 'age', 306000, 'https://example.com/heartshapedbox.mp3', 7168,
                        'https://example.com/heartshapedbox_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Rock')),
                       ('Rape Me', true, 'age', 357000, 'https://example.com/rapeme.mp3', 8192,
                        'https://example.com/rapeme_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Rock')),
                       ('Frances Farmer Will Have Her Revenge on Seattle', true, 'age', 293000,
                        'https://example.com/francesfarmer.mp3', 6144,
                        'https://example.com/francesfarmer_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Rock')),
                       ('Dumb', true, 'age', 430000, 'https://example.com/dumb.mp3', 9216,
                        'https://example.com/dumb_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Rock')),
                       ('Very Ape', true, 'age', 156000, 'https://example.com/veryape.mp3', 3072,
                        'https://example.com/veryape_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Rock')),
                       ('Milk It', true, 'age', 373000, 'https://example.com/milkit.mp3', 8704,
                        'https://example.com/milkit_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, iut.track_id
        from in_utero_tracks iut
                 cross join (select album_id from albums where name = 'In Utero') as a;

        with mtv_unplugged_tracks as (
            insert into tracks (name, is_available, content_warning, duration_ms, file_url, file_size_kb, cover_url,
                                pos_volume, pos_index, genre_id)
                values ('About a Girl', true, 'age', 442000, 'https://example.com/aboutagirl.wav', 10240,
                        'https://example.com/aboutagirl_cover.jpg', 1, 1,
                        (select genre_id from genres where name = 'Rock')),
                       ('Come as You Are', true, 'age', 200000, 'https://example.com/comeasyouare.wav', 5120,
                        'https://example.com/comeasyouare_cover.jpg', 1, 2,
                        (select genre_id from genres where name = 'Rock')),
                       ('Jesus Doesnt Want Me for a Sunbeam', true, 'age', 306000,
                        'https://example.com/jesusdoesntwantme.wav', 7168,
                        'https://example.com/jesusdoesntwantme_cover.jpg', 1, 3,
                        (select genre_id from genres where name = 'Rock')),
                       ('The Man Who Sold the World', true, 'age', 357000, 'https://example.com/themanwhosold.wav',
                        8192,
                        'https://example.com/themanwhosold_cover.jpg', 1, 4,
                        (select genre_id from genres where name = 'Rock')),
                       ('Pennyroyal Tea', true, 'age', 293000, 'https://example.com/pennyroyaltea.wav', 6144,
                        'https://example.com/pennyroyaltea_cover.jpg', 1, 5,
                        (select genre_id from genres where name = 'Rock')),
                       ('Dumb', true, 'age', 430000, 'https://example.com/dumb.wav', 9216,
                        'https://example.com/dumb_cover.jpg', 1, 6,
                        (select genre_id from genres where name = 'Rock')),
                       ('Polly', true, 'age', 156000, 'https://example.com/polly.wav', 3072,
                        'https://example.com/polly_cover.jpg', 1, 7,
                        (select genre_id from genres where name = 'Rock')),
                       ('On a Plain', true, 'age', 373000, 'https://example.com/onaplain.wav', 8704,
                        'https://example.com/onaplain_cover.jpg', 1, 8,
                        (select genre_id from genres where name = 'Rock')),
                       ('Something in the Way', true, 'age', 373000, 'https://example.com/somethingintheway.wav', 8704,
                        'https://example.com/somethingintheway_cover.jpg', 1, 9,
                        (select genre_id from genres where name = 'Rock')),
                       ('Plateau', true, 'age', 373000, 'https://example.com/plateau.wav', 8704,
                        'https://example.com/plateau_cover.jpg', 1, 10,
                        (select genre_id from genres where name = 'Rock'))
                returning track_id)
        insert
        into albums_include_tracks (album_id, track_id)
        select a.album_id, mtv.track_id
        from mtv_unplugged_tracks mtv
                 cross join (select album_id from albums where name = 'MTV Unplugged in New York') as a;
    end
$$;
-- insert tracks into albums ^^

do
$$
    begin
        insert into artists_have_tracks (artist_id, track_id)
        select aha.artist_id, ait.track_id
        from albums_include_tracks ait
                 join artists_have_albums aha on aha.album_id = ait.album_id
                 join artists a on a.artist_id = aha.artist_id
        where a.name in
              ('Black Sabbath', 'Iron Maiden', 'The Doors', 'Twenty One Pilots', 'Led Zeppelin', 'Johnny Cash',
               'Metallica',
               'Elvis Presley', 'B.B. King', 'Nirvana');
    end
$$;
-- connect artist and their tracks ^^

do
$$
    begin
        insert into users (nickname, email, password_hash)
        values ('User1', 'user1@example.com', 'password_hash_1');
        insert into account_data (user_id, interface_lang, state_lang, state, birthdate, avatar_url, registration_date)
        values (1, 'en'::interface_language, 'usa'::state_lang, 'New Orleans', '2005-04-14',
                'https://example.com/avatar1.jpg', current_timestamp);

        insert into users (nickname, email, password_hash)
        values ('User2', 'user2@example.com', 'password_hash_2');
        insert into account_data (user_id, interface_lang, state_lang, state, birthdate, avatar_url, registration_date)
        values (2, 'fr'::interface_language, 'fra'::state_lang, 'Paris', '2000-01-01',
                'https://example.com/avatar2.jpg', current_timestamp);

        insert into users (nickname, email, password_hash)
        values ('User3', 'user3@example.com', 'password_hash_3');
        insert into account_data (user_id, interface_lang, state_lang, state, birthdate, avatar_url, registration_date)
        values (3, 'es'::interface_language, 'esp'::state_lang, 'Valencia', '1980-05-21',
                'https://example.com/avatar3.jpg', current_timestamp);

    end
$$;
-- insert users and their data ^^

do
$$
    begin
        with artist_id as (select artist_id
                           from artists
                           where name = 'Black Sabbath')
           , user_id as (select user_id
                         from users
                         where nickname = 'User1')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;
        with artist_id as (select artist_id
                           from artists
                           where name = 'Iron Maiden')
           , user_id as (select user_id
                         from users
                         where nickname = 'User1')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;
        with artist_id as (select artist_id
                           from artists
                           where name = 'Metallica')
           , user_id as (select user_id
                         from users
                         where nickname = 'User1')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;

        with artist_id as (select artist_id
                           from artists
                           where name = 'Led Zeppelin')
           , user_id as (select user_id
                         from users
                         where nickname = 'User2')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;
        with artist_id as (select artist_id
                           from artists
                           where name = 'Twenty One Pilots')
           , user_id as (select user_id
                         from users
                         where nickname = 'User2')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;
        with artist_id as (select artist_id
                           from artists
                           where name = 'Johnny Cash')
           , user_id as (select user_id
                         from users
                         where nickname = 'User2')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;

        with artist_id as (select artist_id
                           from artists
                           where name = 'Nirvana')
           , user_id as (select user_id
                         from users
                         where nickname = 'User3')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;
        with artist_id as (select artist_id
                           from artists
                           where name = 'Elvis Presley')
           , user_id as (select user_id
                         from users
                         where nickname = 'User3')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;
        with artist_id as (select artist_id
                           from artists
                           where name = 'B.B. King')
           , user_id as (select user_id
                         from users
                         where nickname = 'User3')
        insert
        into users_like_artists (artist_id, user_id)
        select a.artist_id, u.user_id
        from artist_id a
                 cross join user_id u;
    end
$$;
-- connect users and their liked artists ^^

do
$$
    begin
        with album_id as (select album_id
                          from albums
                          where name = 'Paranoid')
           , user_id as (select user_id
                         from users
                         where nickname = 'User1')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;
        with album_id as (select album_id
                          from albums
                          where name = 'Powerslave')
           , user_id as (select user_id
                         from users
                         where nickname = 'User1')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;
        with album_id as (select album_id
                          from albums
                          where name = 'Metallica (The Black Album)')
           , user_id as (select user_id
                         from users
                         where nickname = 'User1')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;


        with album_id as (select album_id
                          from albums
                          where name = 'Vessel')
           , user_id as (select user_id
                         from users
                         where nickname = 'User2')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;
        with album_id as (select album_id
                          from albums
                          where name = 'At Folsom Prison')
           , user_id as (select user_id
                         from users
                         where nickname = 'User2')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;
        with album_id as (select album_id
                          from albums
                          where name = 'Led Zeppelin III')
           , user_id as (select user_id
                         from users
                         where nickname = 'User2')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;


        with album_id as (select album_id
                          from albums
                          where name = 'Elvis Presley')
           , user_id as (select user_id
                         from users
                         where nickname = 'User3')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;
        with album_id as (select album_id
                          from albums
                          where name = 'Live at the Regal')
           , user_id as (select user_id
                         from users
                         where nickname = 'User3')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;
        with album_id as (select album_id
                          from albums
                          where name = 'MTV Unplugged in New York')
           , user_id as (select user_id
                         from users
                         where nickname = 'User3')
        insert
        into users_like_albums (album_id, user_id)
        select a.album_id, u.user_id
        from album_id a
                 cross join user_id u;

    end
$$;
-- connect users and their like albums ^^

do
$$
    begin
        with user_info as (select user_id
                           from users
                           where nickname in ('User1', 'User2', 'User3'))
        insert
        into users_like_tracks (user_id, track_id)
        select distinct ui.user_id, ait.track_id
        from user_info ui
                 join users_like_albums ula on ui.user_id = ula.user_id
                 join albums_include_tracks ait on ula.album_id = ait.album_id
                 join artists_have_albums aha on aha.album_id = ait.album_id
                 join artists_have_tracks aht on aht.artist_id = aha.artist_id;

    end
$$;
-- connect users and their liked tracks(basically just taken from their liked albums) ^^

do
$$
    begin
        with playlist_tracks as (
            insert into playlists (name, cover_url, description)
                values ('user1_playlist', 'cover_url_example', 'playlist for User1')
                returning playlist_id)
        insert
        into users_have_playlists (user_id, playlist_id)
        select u.user_id, pt.playlist_id
        from playlist_tracks pt
                 cross join users u
        where u.nickname = 'User1';

        with playlist_id as (select p.playlist_id as id
                             from users u
                                      join users_have_playlists uhp on u.user_id = uhp.user_id
                                      join playlists p on p.playlist_id = uhp.playlist_id
                             where u.nickname = 'User1')
        insert
        into playlists_have_tracks(playlist_id, track_id)
        select p.playlist_id, t.track_id
        from playlists p
                 cross join tracks t
        where t.name in ('Paranoid', 'Gallows Pole', 'Fear of the Dark');

        with playlist_tracks as (
            insert into playlists (name, cover_url, description)
                values ('user2_playlist', 'cover_url_example', 'playlist for User1')
                returning playlist_id)
        insert
        into users_have_playlists (user_id, playlist_id)
        select u.user_id, pt.playlist_id
        from playlist_tracks pt
                 cross join users u
        where u.nickname = 'User2';

        with playlist_id as (select p.playlist_id as id
                             from users u
                                      join users_have_playlists uhp on u.user_id = uhp.user_id
                                      join playlists p on p.playlist_id = uhp.playlist_id
                             where u.nickname = 'User2')
        insert
        into playlists_have_tracks(playlist_id, track_id)
        select p.playlist_id, t.track_id
        from playlists p
                 cross join tracks t
        where t.name in ('Iron Man', 'Tangerine', 'Aces High');

        with playlist_tracks as (
            insert into playlists (name, cover_url, description)
                values ('user3_playlist', 'cover_url_example', 'playlist for User1')
                returning playlist_id)
        insert
        into users_have_playlists (user_id, playlist_id)
        select u.user_id, pt.playlist_id
        from playlist_tracks pt
                 cross join users u
        where u.nickname = 'User3';

        with playlist_id as (select p.playlist_id as id
                             from users u
                                      join users_have_playlists uhp on u.user_id = uhp.user_id
                                      join playlists p on p.playlist_id = uhp.playlist_id
                             where u.nickname = 'User3')
        insert
        into playlists_have_tracks(playlist_id, track_id)
        select p.playlist_id, t.track_id
        from playlists p
                 cross join tracks t
        where t.name in ('Hand of Doom', 'Kashmir', 'Afraid to Shoot Strangers');

    end
$$;
-- create playlists for users ^^