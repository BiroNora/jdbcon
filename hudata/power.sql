--power alapja
CREATE TABLE actors (
    actor_id INTEGER PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date SMALLINT NULL,
    death_date SMALLINT DEFAULT NULL
);

CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    title_original VARCHAR(255),
    release_date SMALLINT NOT NULL,
    end_date SMALLINT NULL,
    m_type TEXT,
    is_adult BOOLEAN
);

CREATE TABLE plays (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL,
    movie_id INTEGER NULL,
    actor_id INTEGER NULL,
    CONSTRAINT fk_plays_movie_id
        FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_plays_actor_id
        FOREIGN KEY (actor_id)
        REFERENCES actors (actor_id)
        ON DELETE CASCADE
);

CREATE TABLE photos (
    photo_id INTEGER PRIMARY KEY,
    url TEXT NOT NULL,
    movie_id INTEGER NULL,
    actor_id INTEGER NULL,
    role_id INTEGER NULL,
    CONSTRAINT fk_photos_movie_id
        FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
        ON DELETE SET NULL,
    CONSTRAINT fk_photos_actor_id
        FOREIGN KEY (actor_id)
        REFERENCES actors (actor_id)
        ON DELETE SET NULL,
    CONSTRAINT fk_photos_role_id
        FOREIGN KEY (role_id)
        REFERENCES plays (role_id)
        ON DELETE SET NULL
);

CREATE TABLE directors (
    actor_id INTEGER,
    movie_id INTEGER,
    CONSTRAINT fk_directors_movie_id
        FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_directors_actor_id
        FOREIGN KEY (actor_id)
        REFERENCES actors (actor_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_directors PRIMARY KEY (actor_id, movie_id)
);

CREATE TABLE genre (
    movie_id INTEGER NOT NULL,
    genre TEXT NOT NULL,
    CONSTRAINT fk_genre_movie_id
        FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_genre PRIMARY KEY (movie_id, genre)
);

INSERT INTO movies VALUES(6604,'Frédi és Béni, avagy a két kőkorszaki szaki','The Flintstones',1960,1966,'tvSeries',false);
INSERT INTO movies VALUES(9918,'A keresztapa','The Godfather',1972,NULL,'movie',false);
INSERT INTO movies VALUES(10521,'A keresztapa II','The Godfather Part II',1974,NULL,'movie',false);
INSERT INTO movies VALUES(10805,'Kánikulai délután','Dog Day Afternoon',1975,NULL,'movie',false);
INSERT INTO movies VALUES(10920,'Száll a kakukk fészkére','One Flew Over the Cuckoo''s Nest',1975,NULL,'movie',false);
INSERT INTO movies VALUES(11402,'Annie Hall','Annie Hall',1977,NULL,'movie',false);
INSERT INTO movies VALUES(16594,'Holt költők társasága','Dead Poets Society',1989,NULL,'movie',false);
INSERT INTO movies VALUES(17313,'A keresztapa III.','The Godfather Part III',1990,NULL,'movie',false);
INSERT INTO movies VALUES(17954,'A Keresztapa családja','The Godfather Family: A Look Inside',1990,NULL,'tvMovie',false);
INSERT INTO movies VALUES(20113,'A Flintstone család','The Flintstones',1994,NULL,'movie',false);
INSERT INTO movies VALUES(22980,'Lesz ez még így se!','As Good as It Gets',1997,NULL,'movie',false);
INSERT INTO movies VALUES(23782,'Mathilde illata','Le parfum de Mathilde',1995,NULL,'tvMovie',true);
INSERT INTO movies VALUES(29822,'Rossz álmok','The Gift',2000,NULL,'movie',false);
INSERT INTO movies VALUES(34902,'A Karib-tenger kalózai: A Fekete Gyöngy átka','Pirates of the Caribbean: The Curse of the Black Pearl',2003,NULL,'movie',false);
INSERT INTO movies VALUES(36947,'A Karib-tenger kalózai: Holtak kincse','Pirates of the Caribbean: Dead Man''s Chest',2006,NULL,'movie',false);
INSERT INTO movies VALUES(37030,'Állj ki a szerelemért','The Godfather of Green Bay',2005,NULL,'movie',false);
INSERT INTO movies VALUES(38218,'Ádám almái','Adams æbler',2005,NULL,'movie',false);
INSERT INTO movies VALUES(39410,'A Karib-tenger kalózai: A világ végén','Pirates of the Caribbean: At World''s End',2007,NULL,'movie',false);
INSERT INTO movies VALUES(48674,'A Karib-tenger kalózai: Ismeretlen vizeken','Pirates of the Caribbean: On Stranger Tides',2011,NULL,'movie',false);
INSERT INTO movies VALUES(53855,'A Karib-tenger kalózai: Salazar bosszúja','Pirates of the Caribbean: Dead Men Tell No Tales',2017,NULL,'movie',false);
INSERT INTO movies VALUES(54706,'Senki többet','La migliore offerta',2013,NULL,'movie',false);
INSERT INTO movies VALUES(60412,'Az ajándék','The Gift',2015,NULL,'movie',false);
INSERT INTO movies VALUES(11668,'Egy úr az űrből','Mork & Mindy',1978,1982,'tvSeries',false);
INSERT INTO movies VALUES(11753,'Családi tűzfészek','Családi tüzfészek',1979,NULL,'movie',false);
INSERT INTO movies VALUES(13079,'Szabadgyalog','Szabadgyalog',1981,NULL,'movie',false);
INSERT INTO movies VALUES(13369,'Panelkapcsolat','Panelkapcsolat',1982,NULL,'movie',false);
INSERT INTO movies VALUES(14153,'Őszi almanach','Öszi almanach',1984,NULL,'movie',false);
INSERT INTO movies VALUES(16128,'Kárhozat','Kárhozat',1988,NULL,'movie',false);
INSERT INTO movies VALUES(20554,'Sátántangó','Sátántangó',1994,NULL,'movie',false);
INSERT INTO movies VALUES(21100,'Utazás az Alföldön','Utazás az Alföldön',1995,NULL,'short',false);
INSERT INTO movies VALUES(25147,'Hotel Magnezit','Hotel Magnezit',1978,NULL,'short',false);
INSERT INTO movies VALUES(31419,'Werckmeister harmóniák','Werckmeister harmóniák',2000,NULL,'movie',false);
INSERT INTO movies VALUES(32073,'The last Boat - CITY LIFE - Budapest','The last Boat - CITY LIFE - Budapest',1990,NULL,'short',false);
INSERT INTO movies VALUES(33479,'Macbeth','Macbeth',1983,NULL,'tvMovie',false);
INSERT INTO movies VALUES(38075,'A londoni férfi','A londoni férfi',2007,NULL,'movie',false);
INSERT INTO movies VALUES(38491,'Európa-képek','Visions of Europe',2004,NULL,'movie',false);
INSERT INTO movies VALUES(48950,'A torinói ló','A torinói ló',2011,NULL,'movie',false);
INSERT INTO movies VALUES(52808,'Cinemarxisme','Cinemarxisme',1979,NULL,'short',false);
INSERT INTO movies VALUES(55320,'Prologue','Prologue',2004,NULL,'short',false);
INSERT INTO movies VALUES(19181,'Bronxi mese','A Bronx Tale',1993,NULL,'movie',false);
INSERT INTO movies VALUES(35508,'Az ügynökség','The Good Shepherd',2006,NULL,'movie',false);
INSERT INTO actors VALUES(2,'Robert Duvall',1931,NULL);
INSERT INTO actors VALUES(44,'Róbert Koltai',1943,NULL);
INSERT INTO actors VALUES(299,'Mel Blanc',1908,1989);
INSERT INTO actors VALUES(493,'James Caan',1940,NULL);
INSERT INTO actors VALUES(549,'Greg Kinnear',1963,NULL);
INSERT INTO actors VALUES(729,'Lauren Holly',1963,NULL);
INSERT INTO actors VALUES(831,'Mads Mikkelsen',1965,NULL);
INSERT INTO actors VALUES(935,'Hanna Schygulla',1943,NULL);
INSERT INTO actors VALUES(999,'Keanu Reeves',1964,NULL);
INSERT INTO actors VALUES(1169,'Erika Bodnár',1948,NULL);
INSERT INTO actors VALUES(1475,'John Goodman',1952,NULL);
INSERT INTO actors VALUES(1480,'Andy Garcia',1956,NULL);
INSERT INTO actors VALUES(1902,'Judit Pogány',1944,NULL);
INSERT INTO actors VALUES(1940,'Jack Nicholson',1937,NULL);
INSERT INTO actors VALUES(2001,'Ulrich Thomsen',1963,NULL);
INSERT INTO actors VALUES(2245,'György Cserhalmi',1948,NULL);
INSERT INTO actors VALUES(2518,'Penélope Cruz',1974,NULL);
INSERT INTO actors VALUES(2926,'Donald Sutherland',1935,NULL);
INSERT INTO actors VALUES(3032,'Geoffrey Rush',1951,NULL);
INSERT INTO actors VALUES(3286,'Chazz Palminteri',1952,NULL);
INSERT INTO actors VALUES(3469,'Carol Kane',1952,NULL);
INSERT INTO actors VALUES(3785,'Al Pacino',1940,NULL);
INSERT INTO actors VALUES(3806,'Ian McShane',1942,NULL);
INSERT INTO actors VALUES(3888,'Cate Blanchett',1969,NULL);
INSERT INTO actors VALUES(4034,'Nicolas Bro',1972,NULL);
INSERT INTO actors VALUES(4049,'János Derzsi',1954,NULL);
INSERT INTO actors VALUES(4334,'Katie Holmes',1978,NULL);
INSERT INTO actors VALUES(4716,'Bea Benaderet',1906,1968);
INSERT INTO actors VALUES(5032,'Diane Keaton',1946,NULL);
INSERT INTO actors VALUES(5148,'Ethan Hawke',1970,NULL);
INSERT INTO actors VALUES(5154,'Javier Bardem',1969,NULL);
INSERT INTO actors VALUES(5454,'Halle Berry',1966,NULL);
INSERT INTO actors VALUES(5674,'Alec Baldwin',1958,NULL);
INSERT INTO actors VALUES(5700,'Tilda Swinton',1960,NULL);
INSERT INTO actors VALUES(6246,'Robin Williams',1951,2014);
INSERT INTO actors VALUES(6287,'Keira Knightley',1985,NULL);
INSERT INTO actors VALUES(6913,'Rebecca Hall',1982,NULL);
INSERT INTO actors VALUES(7335,'Jim Sturgess',1978,NULL);
INSERT INTO actors VALUES(7602,'Sylvia Hoeks',1983,NULL);
INSERT INTO actors VALUES(7827,'Helen Hunt',1963,NULL);
INSERT INTO actors VALUES(7864,'Miroslav Krobot',1951,NULL);
INSERT INTO actors VALUES(8078,'Angelina Jolie',1975,NULL);
INSERT INTO actors VALUES(8079,'Johnny Depp',1963,NULL);
INSERT INTO actors VALUES(8658,'Talia Shire',1946,NULL);
INSERT INTO actors VALUES(9143,'Francis Capra',1983,NULL);
INSERT INTO actors VALUES(9174,'Tony Goldwyn',1960,NULL);
INSERT INTO actors VALUES(9205,'Erzsébet Kútvölgyi',1950,NULL);
INSERT INTO actors VALUES(9293,'Tom Poston',1921,2007);
INSERT INTO actors VALUES(9510,'Hédi Temessy',1925,2001);
INSERT INTO actors VALUES(9527,'Rick Moranis',1953,NULL);
INSERT INTO actors VALUES(9604,'Hal Smith',1916,1994);
INSERT INTO actors VALUES(9674,'Matt Damon',1970,NULL);
INSERT INTO actors VALUES(10347,'Rosie O''Donnell',1962,NULL);
INSERT INTO actors VALUES(10433,'Cuba Gooding Jr.',1968,NULL);
INSERT INTO actors VALUES(10566,'William Hanna',1910,2001);
INSERT INTO actors VALUES(11815,'John Stephenson',1923,2015);
INSERT INTO actors VALUES(12150,'Woody Allen',1935,NULL);
INSERT INTO actors VALUES(12523,'Allison Tolman',1981,NULL);
INSERT INTO actors VALUES(12657,'Erika Bók',NULL,NULL);
INSERT INTO actors VALUES(12739,'Don Messick',1926,1997);
INSERT INTO actors VALUES(13348,'Julia Channel',1973,NULL);
INSERT INTO actors VALUES(14595,'Marlon Brando',1924,2004);
INSERT INTO actors VALUES(14883,'Jean Vander Pyl',1919,1999);
INSERT INTO actors VALUES(14933,'Jay Thomas',1948,2017);
INSERT INTO actors VALUES(15024,'Joel Edgerton',1974,NULL);
INSERT INTO actors VALUES(15085,'Robert Sean Leonard',1969,NULL);
INSERT INTO actors VALUES(15320,'Paprika Steen',1964,NULL);
INSERT INTO actors VALUES(15718,'Robert De Niro',1943,NULL);
INSERT INTO actors VALUES(16970,'Pál Hetényi',1935,1994);
INSERT INTO actors VALUES(17008,'Ralph James',1924,1992);
INSERT INTO actors VALUES(17908,'Arvo Iho',1949,NULL);
INSERT INTO actors VALUES(18323,'Josh Charles',1971,NULL);
INSERT INTO actors VALUES(18460,'Alan Reed',1907,1977);
INSERT INTO actors VALUES(20125,'Giovanni Ribisi',1974,NULL);
INSERT INTO actors VALUES(20261,'Gina Hecht',1952,NULL);
INSERT INTO actors VALUES(20607,'László feLugossy',1947,NULL);
INSERT INTO actors VALUES(21431,'Louise Fletcher',1934,NULL);
INSERT INTO actors VALUES(22239,'Orlando Bloom',1977,NULL);
INSERT INTO actors VALUES(23058,'Lars Rudolph',1966,NULL);
INSERT INTO actors VALUES(23145,'Éva Almássy Albert',1948,NULL);
INSERT INTO actors VALUES(23496,'Miklós Székely B.',1948,NULL);
INSERT INTO actors VALUES(25746,'Tony Roberts',1939,NULL);
INSERT INTO actors VALUES(26569,'Garry Marshall',1934,2016);
INSERT INTO actors VALUES(27110,'Milos Forman',1932,2018);
INSERT INTO actors VALUES(27286,'Michael Berryman',1948,NULL);
INSERT INTO actors VALUES(27542,'Peter Greenaway',1942,NULL);
INSERT INTO actors VALUES(29382,'Jason Bateman',1969,NULL);
INSERT INTO actors VALUES(29923,'John Cazale',1935,1978);
INSERT INTO actors VALUES(31945,'Sully Boyar',1923,2001);
INSERT INTO actors VALUES(33910,'Jack Davenport',1973,NULL);
INSERT INTO actors VALUES(34022,'Pam Dawber',1951,NULL);
INSERT INTO actors VALUES(37222,'Conrad Janis',1928,2022);
INSERT INTO actors VALUES(37814,'Lillo Brancato',1976,NULL);
INSERT INTO actors VALUES(39690,'Jimmy Pardo',NULL,NULL);
INSERT INTO actors VALUES(40396,'István Balla',NULL,NULL);
INSERT INTO actors VALUES(40526,'Peter Brocco',1903,1992);
INSERT INTO actors VALUES(42657,'Putyi Horváth',1953,NULL);
INSERT INTO actors VALUES(42895,'Kyri Ambrus',1945,2021);
INSERT INTO actors VALUES(43761,'Élodie Chérie',1966,NULL);
INSERT INTO actors VALUES(43773,'Penelope Allen',NULL,NULL);
INSERT INTO actors VALUES(45899,'Alan Rees',NULL,NULL);
INSERT INTO actors VALUES(46047,'László Horváth',1943,1988);
INSERT INTO actors VALUES(49115,'Draghixa',1973,NULL);
INSERT INTO actors VALUES(50160,'Peter Fitz',1931,2013);
INSERT INTO actors VALUES(50164,'András Szabó',NULL,NULL);
INSERT INTO actors VALUES(52991,'Joseph Barbera',1911,2006);
INSERT INTO actors VALUES(53825,'Gyula Pauer',1941,2012);
INSERT INTO actors VALUES(58699,'Gábor Ifj. Kun',NULL,NULL);
INSERT INTO actors VALUES(59008,'Mihály Vig',1957,NULL);
INSERT INTO actors VALUES(59107,'Mihály Kormos',NULL,NULL);
INSERT INTO actors VALUES(59786,'Gerry Johnson',1918,1990);
INSERT INTO actors VALUES(61556,'Christoph Clark',1958,NULL);
INSERT INTO actors VALUES(71537,'Frank Buxton',1930,2018);
INSERT INTO actors VALUES(74765,'Vali Kerekes',1953,NULL);
INSERT INTO actors VALUES(75359,'Imre Donkó',NULL,NULL);
INSERT INTO actors VALUES(78386,'Pete Schwaba',NULL,NULL);
INSERT INTO actors VALUES(84888,'Agneta Ulfsäter-Troell',1941,NULL);
INSERT INTO actors VALUES(88647,'Ricsi',NULL,NULL);
INSERT INTO actors VALUES(90642,'Gábor Kun',NULL,NULL);
INSERT INTO actors VALUES(90870,'Irén Szajki',NULL,NULL);
INSERT INTO actors VALUES(91077,'Yohanna Troell',1983,NULL);
INSERT INTO actors VALUES(91148,'Johan Arnesson',NULL,NULL);
INSERT INTO actors VALUES(91214,'Jolan Fodor',NULL,NULL);
INSERT INTO actors VALUES(94078,'Sidney Lumet',1924,2011);
INSERT INTO actors VALUES(94279,'Francis Ford Coppola',1939,NULL);
INSERT INTO actors VALUES(95282,'Jan Troell',1931,NULL);
INSERT INTO actors VALUES(95560,'Peter Weir',1944,NULL);
INSERT INTO actors VALUES(95861,'Bob Claver',1928,2017);
INSERT INTO actors VALUES(95995,'Howard Storm',1931,NULL);
INSERT INTO actors VALUES(95996,'Jeff Chambers',NULL,NULL);
INSERT INTO actors VALUES(95997,'Joel Zwick',1942,NULL);
INSERT INTO actors VALUES(95998,'Harvey Medlinsky',NULL,NULL);
INSERT INTO actors VALUES(95999,'Don Barnhart',NULL,2016);
INSERT INTO actors VALUES(96016,'Béla Tarr',1955,NULL);
INSERT INTO actors VALUES(96275,'Jean Rollin',1938,2010);
INSERT INTO actors VALUES(96625,'Sam Raimi',1959,NULL);
INSERT INTO actors VALUES(96787,'Tony Gatlif',1948,NULL);
INSERT INTO actors VALUES(96791,'Aki Kaurismäki',1957,NULL);
INSERT INTO actors VALUES(96804,'James L. Brooks',1940,NULL);
INSERT INTO actors VALUES(96812,'Miguel Hermoso',1942,NULL);
INSERT INTO actors VALUES(97171,'Giuseppe Tornatore',1956,NULL);
INSERT INTO actors VALUES(97518,'Brian Levant',1952,NULL);
INSERT INTO actors VALUES(97599,'Stijn Coninx',1957,NULL);
INSERT INTO actors VALUES(99108,'Francesca Comencini',1961,NULL);
INSERT INTO actors VALUES(99164,'Jeff Werner',NULL,NULL);
INSERT INTO actors VALUES(99212,'Martin Sulík',1962,NULL);
INSERT INTO actors VALUES(100327,'Teresa Villaverde',1966,NULL);
INSERT INTO actors VALUES(100576,'Sasa Gedeon',1970,NULL);
INSERT INTO actors VALUES(100928,'Theo van Gogh',1957,2004);
INSERT INTO actors VALUES(100985,'Sharunas Bartas',1964,NULL);
INSERT INTO actors VALUES(101410,'Gore Verbinski',1964,NULL);
INSERT INTO actors VALUES(101664,'Marc Dorcel',1934,NULL);
INSERT INTO actors VALUES(102072,'Barbara Albert',1970,NULL);
INSERT INTO actors VALUES(102465,'Laila Pakalnina',1962,NULL);
INSERT INTO actors VALUES(102609,'Fatih Akin',1973,NULL);
INSERT INTO actors VALUES(103012,'Andy Bausch',1959,NULL);
INSERT INTO actors VALUES(103361,'Constantine Giannaris',1959,NULL);
INSERT INTO actors VALUES(104520,'Anders Thomas Jensen',1972,NULL);
INSERT INTO actors VALUES(104924,'Ágnes Hranitzky',1945,NULL);
INSERT INTO actors VALUES(105184,'János Hollós',1959,NULL);
INSERT INTO actors VALUES(105283,'Malgorzata Szumowska',1973,NULL);
INSERT INTO actors VALUES(106097,'Aisling Walsh',1958,NULL);
INSERT INTO actors VALUES(106758,'Damjan Kozole',1964,NULL);
INSERT INTO actors VALUES(107265,'Christoffer Boe',1974,NULL);
INSERT INTO actors VALUES(107961,'Rob Marshall',1960,NULL);
INSERT INTO actors VALUES(108432,'Joachim Rønning',1972,NULL);
INSERT INTO actors VALUES(108433,'Espen Sandberg',1971,NULL);
INSERT INTO actors VALUES(108683,'Christos Georgiou',1966,NULL);
INSERT INTO actors VALUES(108684,'Kenneth Scicluna',1975,NULL);
INSERT INTO plays VALUES(1,'Billy Whistler',54706,2926);
INSERT INTO plays VALUES(2,'Captain Salazar',53855,5154);
INSERT INTO plays VALUES(3,'Virgil Oldman',54706,3032);
INSERT INTO plays VALUES(4,'Robert',54706,7335);
INSERT INTO plays VALUES(5,'Sebestyén","singer''s husband',16128,2245);
INSERT INTO plays VALUES(6,'Barney Rubble',20113,9527);
INSERT INTO plays VALUES(7,'Ohlsdorfer''s daughter',48950,12657);
INSERT INTO plays VALUES(8,'Mork","Self',11668,6246);
INSERT INTO plays VALUES(9,'Sophie","la soubrette-the maid',23782,13348);
INSERT INTO plays VALUES(10,'Elizabeth Swann',34902,6287);
INSERT INTO plays VALUES(11,'Gordo',60412,15024);
INSERT INTO plays VALUES(12,'Blackbeard',48674,3806);
INSERT INTO plays VALUES(13,'Orson',11668,17008);
INSERT INTO plays VALUES(14,'Vito Corleone',10521,15718);
INSERT INTO plays VALUES(15,'Betty Rubble',20113,10347);
INSERT INTO plays VALUES(16,'Sonny',10805,3785);
INSERT INTO plays VALUES(17,'Alvy Singer',11402,12150);
INSERT INTO plays VALUES(18,'Elizabeth Swann',39410,6287);
INSERT INTO plays VALUES(19,'Carol Connelly',22980,7827);
INSERT INTO plays VALUES(20,'Jack Sparrow',34902,8079);
INSERT INTO plays VALUES(21,'Tünde Eszter',31419,935);
INSERT INTO plays VALUES(22,'Will Turner',36947,22239);
INSERT INTO plays VALUES(23,'Schmidtné',20554,23145);
INSERT INTO plays VALUES(24,'Angelica',48674,2518);
INSERT INTO plays VALUES(25,'Captain Hector Barbossa',53855,3032);
INSERT INTO plays VALUES(26,'Vincent Mancini',17313,1480);
INSERT INTO plays VALUES(27,'Jean DaVinci',11668,20261);
INSERT INTO plays VALUES(28,'Rob',11402,25746);
INSERT INTO plays VALUES(29,'Jack Sparrow',39410,8079);
INSERT INTO plays VALUES(30,'Férj',13369,44);
INSERT INTO plays VALUES(31,'Ellis',10920,27286);
INSERT INTO plays VALUES(32,'Melvin Udall',22980,1940);
INSERT INTO plays VALUES(33,'Sal',10805,29923);
INSERT INTO plays VALUES(34,'Michael',10521,3785);
INSERT INTO plays VALUES(35,'Mulvaney',10805,31945);
INSERT INTO plays VALUES(36,'Henriette',38075,12657);
INSERT INTO plays VALUES(37,'Michael',9918,3785);
INSERT INTO plays VALUES(38,'Captain Jack Sparrow',53855,8079);
INSERT INTO plays VALUES(39,'Kay Adams',9918,5032);
INSERT INTO plays VALUES(40,'Margaret ''Clover'' Russell',35508,8078);
INSERT INTO plays VALUES(41,'Ivan',38218,831);
INSERT INTO plays VALUES(42,'Higgins',37030,39690);
INSERT INTO plays VALUES(43,'Tibor, a tanár úr',14153,16970);
INSERT INTO plays VALUES(44,'Balázs',13079,40396);
INSERT INTO plays VALUES(45,'Col. Matterson',10920,40526);
INSERT INTO plays VALUES(46,'John Keating',16594,6246);
INSERT INTO plays VALUES(47,'Sarah Svendsen',38218,15320);
INSERT INTO plays VALUES(48,'Edward Wilson',35508,9674);
INSERT INTO plays VALUES(49,'Todd Anderson',16594,5148);
INSERT INTO plays VALUES(50,'énekesnõ',13369,42895);
INSERT INTO plays VALUES(51,'Schmidt',20554,20607);
INSERT INTO plays VALUES(52,'Don Vito Corleone',9918,14595);
INSERT INTO plays VALUES(53,'La cuisinière","the cousin',23782,43761);
INSERT INTO plays VALUES(54,'Sylvia',10805,43773);
INSERT INTO plays VALUES(55,'Big Jake Norquist',37030,9174);
INSERT INTO plays VALUES(56,'Macbeth',33479,2245);
INSERT INTO plays VALUES(57,'Narrator (segment \"Sweden: The Yellow Tag\")',38491,45899);
INSERT INTO plays VALUES(58,'Fred Flintstone',20113,1475);
INSERT INTO plays VALUES(59,'Brown',38075,4049);
INSERT INTO plays VALUES(60,'Lucy',60412,12523);
INSERT INTO plays VALUES(61,'János Valuska',31419,23058);
INSERT INTO plays VALUES(62,'Eva","Rémy''s wife--Mathilde Rémy''s late wife',23782,49115);
INSERT INTO plays VALUES(63,'Karrer',16128,23496);
INSERT INTO plays VALUES(64,'Will Turner',39410,22239);
INSERT INTO plays VALUES(65,'Frank Sachs',22980,10433);
INSERT INTO plays VALUES(66,'Feleség',13369,1902);
INSERT INTO plays VALUES(67,'György Eszter',31419,50160);
INSERT INTO plays VALUES(68,'András',13079,50164);
INSERT INTO plays VALUES(69,'Annie Hall',11402,5032);
INSERT INTO plays VALUES(70,'Buddy Cole',29822,20125);
INSERT INTO plays VALUES(71,'Robyn',60412,6913);
INSERT INTO plays VALUES(72,'Knox Overstreet',16594,18323);
INSERT INTO plays VALUES(73,'Remo DaVinci',11668,14933);
INSERT INTO plays VALUES(74,'Wilma Flintstone","Pebbles Flintstone","Nurse',6604,14883);
INSERT INTO plays VALUES(75,'Laci',11753,46047);
INSERT INTO plays VALUES(76,'Willarsky","bartender',16128,53825);
INSERT INTO plays VALUES(77,'Barbossa',48674,3032);
INSERT INTO plays VALUES(78,'Man In The Broad-Cloth Coat',31419,4049);
INSERT INTO plays VALUES(79,'Sonny',19181,3286);
INSERT INTO plays VALUES(80,'Jack Sparrow',48674,8079);
INSERT INTO plays VALUES(81,'Barney Rubble","Dino","Judge',6604,299);
INSERT INTO plays VALUES(82,'Bamm-Bamm Rubble","Hoppy","Arnold',6604,12739);
INSERT INTO plays VALUES(83,'Gabi, Laci testvére',11753,58699);
INSERT INTO plays VALUES(84,'Irimiás',20554,59008);
INSERT INTO plays VALUES(85,'Bernhard',48950,59107);
INSERT INTO plays VALUES(86,'Jessica King',29822,4334);
INSERT INTO plays VALUES(87,'Will Turner',34902,22239);
INSERT INTO plays VALUES(88,'Betty Rubble","Additional Voices","Cuckoo',6604,59786);
INSERT INTO plays VALUES(89,'Anna',14153,1169);
INSERT INTO plays VALUES(90,'Ohlsdorfer',48950,4049);
INSERT INTO plays VALUES(91,'Tom Hagen',10521,2);
INSERT INTO plays VALUES(92,'Norrington',36947,33910);
INSERT INTO plays VALUES(93,'Adam Pedersen',38218,2001);
INSERT INTO plays VALUES(94,'Sir Rémy',23782,61556);
INSERT INTO plays VALUES(95,'Molly Mahoney',37030,729);
INSERT INTO plays VALUES(96,'Allison',11402,3469);
INSERT INTO plays VALUES(97,'Claire Ibbetson',54706,7602);
INSERT INTO plays VALUES(98,'Petrina',20554,42657);
INSERT INTO plays VALUES(99,'Betty Rubble","Nurse","Girl #2',6604,4716);
INSERT INTO plays VALUES(100,'Nurse Ratched',10920,21431);
INSERT INTO plays VALUES(101,'Lorenzo',19181,15718);
INSERT INTO plays VALUES(102,'Miklós',14153,23496);
INSERT INTO plays VALUES(103,'Mr. Bickley',11668,9293);
INSERT INTO plays VALUES(104,'Simon Bishop',22980,549);
INSERT INTO plays VALUES(105,'Annie Wilson',29822,3888);
INSERT INTO plays VALUES(106,'Kay',10521,5032);
INSERT INTO plays VALUES(107,'Elizabeth Swann',36947,6287);
INSERT INTO plays VALUES(108,'Calogero (Age 9)',19181,9143);
INSERT INTO plays VALUES(109,'Sam Murach',35508,5674);
INSERT INTO plays VALUES(110,'Hédi',14153,9510);
INSERT INTO plays VALUES(111,'Sonny',9918,493);
INSERT INTO plays VALUES(112,'Donnie Barksdale',29822,999);
INSERT INTO plays VALUES(113,'The Singer',16128,74765);
INSERT INTO plays VALUES(114,'Mr. Slate","Announcer","Charlie',6604,11815);
INSERT INTO plays VALUES(115,'Neil Perry',16594,15085);
INSERT INTO plays VALUES(116,'Jack Sparrow',36947,8079);
INSERT INTO plays VALUES(117,'Csotesz',13079,75359);
INSERT INTO plays VALUES(118,'Mindy McConnell","Mandy',11668,34022);
INSERT INTO plays VALUES(119,'Captain Hector Barbossa',39410,3032);
INSERT INTO plays VALUES(120,'Barbossa',34902,3032);
INSERT INTO plays VALUES(121,'Joe Keegan',37030,78386);
INSERT INTO plays VALUES(122,'Connie Corleone Rizzi',17313,8658);
INSERT INTO plays VALUES(123,'Will Turner',53855,22239);
INSERT INTO plays VALUES(124,'R.P. McMurphy',10920,1940);
INSERT INTO plays VALUES(125,'Maloin, az éjszakai váltóõr',38075,7864);
INSERT INTO plays VALUES(126,'Bill Sullivan',35508,15718);
INSERT INTO plays VALUES(127,'Fred Flintstone","J.L. Gothrocks","Professor Von Messerschmidt',6604,18460);
INSERT INTO plays VALUES(128,'Michael Corleone',17313,3785);
INSERT INTO plays VALUES(129,'Fred McConnell',11668,37222);
INSERT INTO plays VALUES(130,'Narrator (segment \"Sweden: The Yellow Tag\")',38491,84888);
INSERT INTO plays VALUES(131,'Miss Stone',20113,5454);
INSERT INTO plays VALUES(132,'Horse',48950,88647);
INSERT INTO plays VALUES(133,'Simon',60412,29382);
INSERT INTO plays VALUES(134,'Maloin felesége',38075,5700);
INSERT INTO plays VALUES(135,'Calogero (Age 17)',19181,37814);
INSERT INTO plays VALUES(136,'Kay Adams',17313,5032);
INSERT INTO plays VALUES(137,'Laci apja',11753,90642);
INSERT INTO plays VALUES(138,'Irén',11753,90870);
INSERT INTO plays VALUES(139,'Teacher (segment \"Sweden: The Yellow Tag\")',38491,91077);
INSERT INTO plays VALUES(140,'(segment \"Sweden: The Yellow Tag\")',38491,91148);
INSERT INTO plays VALUES(141,'Kata',13079,91214);
INSERT INTO plays VALUES(142,'Lady Macbeth',33479,9205);
INSERT INTO plays VALUES(143,'Gunnar',38218,4034);
INSERT INTO plays VALUES(144,'Announcer","Dinosaur","Guy #2',6604,9604);
INSERT INTO directors VALUES(6246,11668);
INSERT INTO directors VALUES(10566,6604);
INSERT INTO directors VALUES(12150,11402);
INSERT INTO directors VALUES(15024,60412);
INSERT INTO directors VALUES(15718,19181);
INSERT INTO directors VALUES(15718,35508);
INSERT INTO directors VALUES(17908,38491);
INSERT INTO directors VALUES(26569,11668);
INSERT INTO directors VALUES(27110,10920);
INSERT INTO directors VALUES(27542,38491);
INSERT INTO directors VALUES(52991,6604);
INSERT INTO directors VALUES(71537,11668);
INSERT INTO directors VALUES(78386,37030);
INSERT INTO directors VALUES(94078,10805);
INSERT INTO directors VALUES(94279,9918);
INSERT INTO directors VALUES(94279,10521);
INSERT INTO directors VALUES(94279,17313);
INSERT INTO directors VALUES(95282,38491);
INSERT INTO directors VALUES(95560,16594);
INSERT INTO directors VALUES(95861,11668);
INSERT INTO directors VALUES(95995,11668);
INSERT INTO directors VALUES(95996,11668);
INSERT INTO directors VALUES(95997,11668);
INSERT INTO directors VALUES(95998,11668);
INSERT INTO directors VALUES(95999,11668);
INSERT INTO directors VALUES(96016,11753);
INSERT INTO directors VALUES(96016,13079);
INSERT INTO directors VALUES(96016,13369);
INSERT INTO directors VALUES(96016,14153);
INSERT INTO directors VALUES(96016,16128);
INSERT INTO directors VALUES(96016,20554);
INSERT INTO directors VALUES(96016,21100);
INSERT INTO directors VALUES(96016,25147);
INSERT INTO directors VALUES(96016,31419);
INSERT INTO directors VALUES(96016,32073);
INSERT INTO directors VALUES(96016,33479);
INSERT INTO directors VALUES(96016,38075);
INSERT INTO directors VALUES(96016,38491);
INSERT INTO directors VALUES(96016,48950);
INSERT INTO directors VALUES(96016,52808);
INSERT INTO directors VALUES(96016,55320);
INSERT INTO directors VALUES(96275,23782);
INSERT INTO directors VALUES(96625,29822);
INSERT INTO directors VALUES(96787,38491);
INSERT INTO directors VALUES(96791,38491);
INSERT INTO directors VALUES(96804,22980);
INSERT INTO directors VALUES(96812,38491);
INSERT INTO directors VALUES(97171,54706);
INSERT INTO directors VALUES(97518,20113);
INSERT INTO directors VALUES(97599,38491);
INSERT INTO directors VALUES(99108,38491);
INSERT INTO directors VALUES(99164,17954);
INSERT INTO directors VALUES(99212,38491);
INSERT INTO directors VALUES(100327,38491);
INSERT INTO directors VALUES(100576,38491);
INSERT INTO directors VALUES(100928,38491);
INSERT INTO directors VALUES(100985,38491);
INSERT INTO directors VALUES(101410,34902);
INSERT INTO directors VALUES(101410,36947);
INSERT INTO directors VALUES(101410,39410);
INSERT INTO directors VALUES(101664,23782);
INSERT INTO directors VALUES(102072,38491);
INSERT INTO directors VALUES(102465,38491);
INSERT INTO directors VALUES(102609,38491);
INSERT INTO directors VALUES(103012,38491);
INSERT INTO directors VALUES(103361,38491);
INSERT INTO directors VALUES(104520,38218);
INSERT INTO directors VALUES(104924,31419);
INSERT INTO directors VALUES(104924,38075);
INSERT INTO directors VALUES(104924,38491);
INSERT INTO directors VALUES(104924,48950);
INSERT INTO directors VALUES(104924,55320);
INSERT INTO directors VALUES(105184,32073);
INSERT INTO directors VALUES(105283,38491);
INSERT INTO directors VALUES(106097,38491);
INSERT INTO directors VALUES(106758,38491);
INSERT INTO directors VALUES(107265,38491);
INSERT INTO directors VALUES(107961,48674);
INSERT INTO directors VALUES(108432,53855);
INSERT INTO directors VALUES(108433,53855);
INSERT INTO directors VALUES(108683,38491);
INSERT INTO directors VALUES(108684,38491);
INSERT INTO genre VALUES(6604,'adventure');
INSERT INTO genre VALUES(6604,'animation');
INSERT INTO genre VALUES(6604,'comedy');
INSERT INTO genre VALUES(9918,'crime');
INSERT INTO genre VALUES(9918,'drama');
INSERT INTO genre VALUES(10521,'crime');
INSERT INTO genre VALUES(10521,'drama');
INSERT INTO genre VALUES(10805,'biography');
INSERT INTO genre VALUES(10805,'crime');
INSERT INTO genre VALUES(10805,'drama');
INSERT INTO genre VALUES(10920,'drama');
INSERT INTO genre VALUES(11402,'comedy');
INSERT INTO genre VALUES(11402,'romance');
INSERT INTO genre VALUES(11668,'comedy');
INSERT INTO genre VALUES(11668,'family');
INSERT INTO genre VALUES(11668,'sci-fi');
INSERT INTO genre VALUES(11753,'drama');
INSERT INTO genre VALUES(13079,'drama');
INSERT INTO genre VALUES(13369,'drama');
INSERT INTO genre VALUES(14153,'drama');
INSERT INTO genre VALUES(16128,'crime');
INSERT INTO genre VALUES(16128,'drama');
INSERT INTO genre VALUES(16128,'romance');
INSERT INTO genre VALUES(16594,'comedy');
INSERT INTO genre VALUES(16594,'drama');
INSERT INTO genre VALUES(17313,'crime');
INSERT INTO genre VALUES(17313,'drama');
INSERT INTO genre VALUES(17954,'documentary');
INSERT INTO genre VALUES(19181,'crime');
INSERT INTO genre VALUES(19181,'drama');
INSERT INTO genre VALUES(20113,'comedy');
INSERT INTO genre VALUES(20113,'family');
INSERT INTO genre VALUES(20113,'fantasy');
INSERT INTO genre VALUES(20554,'drama');
INSERT INTO genre VALUES(21100,'short');
INSERT INTO genre VALUES(22980,'comedy');
INSERT INTO genre VALUES(22980,'drama');
INSERT INTO genre VALUES(22980,'romance');
INSERT INTO genre VALUES(23782,'adult');
INSERT INTO genre VALUES(23782,'drama');
INSERT INTO genre VALUES(25147,'short');
INSERT INTO genre VALUES(29822,'drama');
INSERT INTO genre VALUES(29822,'fantasy');
INSERT INTO genre VALUES(29822,'horror');
INSERT INTO genre VALUES(31419,'drama');
INSERT INTO genre VALUES(31419,'mystery');
INSERT INTO genre VALUES(32073,'short');
INSERT INTO genre VALUES(33479,'drama');
INSERT INTO genre VALUES(34902,'action');
INSERT INTO genre VALUES(34902,'adventure');
INSERT INTO genre VALUES(34902,'fantasy');
INSERT INTO genre VALUES(35508,'drama');
INSERT INTO genre VALUES(35508,'history');
INSERT INTO genre VALUES(35508,'thriller');
INSERT INTO genre VALUES(36947,'action');
INSERT INTO genre VALUES(36947,'adventure');
INSERT INTO genre VALUES(36947,'fantasy');
INSERT INTO genre VALUES(37030,'comedy');
INSERT INTO genre VALUES(38075,'crime');
INSERT INTO genre VALUES(38075,'drama');
INSERT INTO genre VALUES(38075,'mystery');
INSERT INTO genre VALUES(38218,'comedy');
INSERT INTO genre VALUES(38218,'crime');
INSERT INTO genre VALUES(38218,'drama');
INSERT INTO genre VALUES(38491,'comedy');
INSERT INTO genre VALUES(38491,'drama');
INSERT INTO genre VALUES(39410,'action');
INSERT INTO genre VALUES(39410,'adventure');
INSERT INTO genre VALUES(39410,'fantasy');
INSERT INTO genre VALUES(48674,'action');
INSERT INTO genre VALUES(48674,'adventure');
INSERT INTO genre VALUES(48674,'fantasy');
INSERT INTO genre VALUES(48950,'drama');
INSERT INTO genre VALUES(52808,'drama');
INSERT INTO genre VALUES(52808,'short');
INSERT INTO genre VALUES(53855,'action');
INSERT INTO genre VALUES(53855,'adventure');
INSERT INTO genre VALUES(53855,'fantasy');
INSERT INTO genre VALUES(54706,'crime');
INSERT INTO genre VALUES(54706,'drama');
INSERT INTO genre VALUES(54706,'mystery');
INSERT INTO genre VALUES(55320,'short');
INSERT INTO genre VALUES(60412,'drama');
INSERT INTO genre VALUES(60412,'mystery');
INSERT INTO genre VALUES(60412,'thriller');
