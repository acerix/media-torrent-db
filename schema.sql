BEGIN TRANSACTION;
CREATE TABLE `video_quality` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `name`  TEXT NOT NULL UNIQUE,
  `priority`  INTEGER
);
INSERT INTO `video_quality` VALUES (1,'480p',2),
 (2,'720p',1),
 (3,'1080p',3),
 (4,'4K',4),
 (11,'3D',NULL);
CREATE TABLE `torrent` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `hash`  BLOB NOT NULL UNIQUE
);
CREATE TABLE `series_alias` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `series_id`  INTEGER NOT NULL,
  `title`  TEXT NOT NULL UNIQUE,
  FOREIGN KEY(`series_id`) REFERENCES series ( id )
);
CREATE TABLE `series_season_episode_release_video` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `episode_release_id`  INTEGER NOT NULL,
  `torrent_id`  INTEGER NOT NULL,
  `filename`  TEXT NOT NULL,
  FOREIGN KEY(`episode_release_id`) REFERENCES series_season_episode_release ( id ),
  FOREIGN KEY(`torrent_id`) REFERENCES torrent(id)
);
CREATE TABLE `series_season_episode_release` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `episode_id`  INTEGER NOT NULL,
  `release_format_id` INTEGER NOT NULL,
  `video_quality_id`  INTEGER NOT NULL,
  `name`  TEXT NOT NULL,
  `created` INTEGER,
  FOREIGN KEY(`episode_id`) REFERENCES series_season_episode ( id ),
  FOREIGN KEY(`release_format_id`) REFERENCES release_format ( id ),
  FOREIGN KEY(`video_quality_id`) REFERENCES video_quality ( id )
);
CREATE TABLE `series_season_episode` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `series_season_id`  INTEGER NOT NULL,
  `number`  INTEGER NOT NULL,
  `title` TEXT,
  `minutes_long`  INTEGER,
  `release_date`  TEXT,
  `synopsis`  TEXT,
  FOREIGN KEY(`series_season_id`) REFERENCES series_episode ( id )
);
CREATE TABLE `series_season` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `series_id` INTEGER NOT NULL,
  `number`  INTEGER NOT NULL,
  FOREIGN KEY(`series_id`) REFERENCES series ( id )
);
CREATE TABLE `series_genre` (
  `series_id`  INTEGER NOT NULL,
  `genre_id`  INTEGER NOT NULL,
  FOREIGN KEY(`series_id`) REFERENCES series(id),
  FOREIGN KEY(`genre_id`) REFERENCES genre(id)
);
CREATE TABLE `series` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `title` TEXT NOT NULL,
  `synopsis`  TEXT,
  `content_rating_id` INTEGER
);
CREATE TABLE `release_format_label` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `label` TEXT NOT NULL UNIQUE,
  `release_format_id` INTEGER NOT NULL,
  FOREIGN KEY(`release_format_id`) REFERENCES release_format ( id )
);
INSERT INTO `release_format_label` VALUES (1,'CAMRip',1),
 (2,'CAM',1),
 (3,'TS',2),
 (4,'HDTS',2),
 (5,'TELESYNC',2),
 (6,'PDVD',2),
 (7,'PreDVDRip',2),
 (8,'WP',3),
 (9,'WORKPRINT',3),
 (10,'TC',4),
 (11,'HDTC',4),
 (12,'TELECINE',4),
 (13,'PPV',5),
 (14,'PPVRip',5),
 (15,'SCR',6),
 (16,'SCREENER',6),
 (17,'DVDSCR',6),
 (18,'DVDSCREENER',6),
 (19,'BDSCR',6),
 (20,'DDC',7),
 (21,'R5',8),
 (22,'R5.LINE',8),
 (23,'R5.AC3.5.1.HQ',8),
 (24,'DVDRip',9),
 (25,'DVDMux',9),
 (26,'DVDR',10),
 (27,'DVD-Full',10),
 (28,'Full-Rip',10),
 (29,'ISO rip',10),
 (30,'lossless rip',10),
 (31,'untouched rip',10),
 (32,'DVD-5',10),
 (33,'DVD-9',10),
 (34,'DSR',11),
 (35,'DSRip',11),
 (36,'SATRip',11),
 (37,'DTHRip',11),
 (38,'DVBRip',11),
 (39,'HDTV',11),
 (40,'PDTV',11),
 (41,'TVRip',11),
 (42,'HDTVRip',11),
 (43,'VODRip',12),
 (44,'VODR',12),
 (45,'WEBDL',13),
 (46,'WEB DL',13),
 (47,'WEB-DL',13),
 (48,'HDRip',13),
 (49,'WEB-DLRip',13),
 (50,'WEBRip',14),
 (51,'WEB Rip',14),
 (52,'WEB-Rip',14),
 (53,'WEB',14),
 (54,'WEB-Cap',15),
 (55,'WEBCAP',15),
 (56,'WEB Cap',15),
 (57,'BDRip',16),
 (58,'BRRip',16),
 (59,'Blu-Ray',16),
 (60,'BluRay',16),
 (61,'BLURAY',16),
 (62,'BDMV',16),
 (63,'BDR',16),
 (64,'BD5',16),
 (65,'BD9',16),
 (66,'BD25',16),
 (67,'BD50',16),
 (68,'Scr',6),
 (69,'BrRip',16),
 (70,'DvDrip',9);
CREATE TABLE `release_format` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `name`  TEXT NOT NULL UNIQUE,
  `priority`  INTEGER
);
INSERT INTO `release_format` VALUES (1,'Cam',NULL),
 (2,'Telesync',NULL),
 (3,'Workprint',NULL),
 (4,'Telecine',NULL),
 (5,'Pay-Per-View Rip',51),
 (6,'Screener',50),
 (7,'Digital Distribution Copy',51),
 (8,'R5',NULL),
 (9,'DVD-Rip',2),
 (10,'DVD-R',NULL),
 (11,'HDTV',3),
 (12,'VODRip',50),
 (13,'WEB-DL',3),
 (14,'WEBRip',3),
 (15,'WEBCap',3),
 (16,'Blu-ray',1);
CREATE TABLE `movie_alias` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `movie_id`  INTEGER NOT NULL,
  `title`  TEXT NOT NULL UNIQUE,
  FOREIGN KEY(`movie_id`) REFERENCES movie ( id )
);
CREATE TABLE `movie_release_video` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `movie_release_id`  INTEGER NOT NULL,
  `torrent_id`  INTEGER NOT NULL,
  `filename`  TEXT NOT NULL,
  FOREIGN KEY(`movie_release_id`) REFERENCES movie_release ( id ),
  FOREIGN KEY(`torrent_id`) REFERENCES torrent(id)
);
CREATE TABLE `movie_release` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `movie_id`  INTEGER NOT NULL,
  `release_format_id` INTEGER NOT NULL,
  `video_quality_id`  INTEGER NOT NULL,
  `name`  TEXT NOT NULL UNIQUE,
  `created` INTEGER,
  FOREIGN KEY(`movie_id`) REFERENCES movie ( id ),
  FOREIGN KEY(`release_format_id`) REFERENCES release_format ( id ),
  FOREIGN KEY(`video_quality_id`) REFERENCES video_quality ( id )
);
CREATE TABLE `movie_genre` (
  `movie_id`  INTEGER NOT NULL,
  `genre_id`  INTEGER NOT NULL,
  FOREIGN KEY(`movie_id`) REFERENCES movie(id),
  FOREIGN KEY(`genre_id`) REFERENCES genre(id)
);
CREATE TABLE `movie` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `title` TEXT NOT NULL,
  `synopsis`  TEXT,
  `theater_release_year`  INTEGER,
  `theater_release_date`  TEXT,
  `online_release_date` TEXT,
  `minutes_long`  INTEGER,
  `content_rating_id` INTEGER
);
CREATE TABLE `genre` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `name`  TEXT NOT NULL UNIQUE
);
INSERT INTO `genre` VALUES (1,'Action & Adventure'),
 (2,'Animation'),
 (3,'Art & Foreign'),
 (4,'Classics'),
 (5,'Comedy'),
 (6,'Documentary'),
 (7,'Drama'),
 (8,'Horror'),
 (9,'Kids & Family'),
 (10,'Mystery & Suspense'),
 (11,'Romance'),
 (12,'Sci-fi & Fantasy');
CREATE TABLE `content_rating` (
  `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  `name`  TEXT UNIQUE
);
INSERT INTO `content_rating` VALUES (1,'G'),
 (2,'PG'),
 (3,'PG-13'),
 (4,'R'),
 (5,'NC-17');
CREATE UNIQUE INDEX `unique_season_number` ON `series_season` (`series_id` ,`number` );
CREATE UNIQUE INDEX `unique_movie_release_video_torrent_filename` ON `movie_release_video` (`torrent_id` ,`filename` );
CREATE UNIQUE INDEX `unique_movie_genre` ON `movie_genre` (`movie_id` ,`genre_id` );
CREATE INDEX `movie_year` ON `movie` (`theater_release_year` );
CREATE INDEX `movie_title` ON `movie` (`title` ASC)
CREATE INDEX `series_title` ON `series` (`title` ASC)
COMMIT;
