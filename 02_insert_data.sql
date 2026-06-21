/*
Sample data requirements (minimums) -- USED AI TO GENERATE THIS DATA
• 10 users (at least 2 Free, 4 Premium, 2 Family) 
• 5 artists 
• 8 albums across those artists 
• 40 songs across those albums 
• 6 playlists (mix of public and private) 
• At least 100 streaming events with varied, realistic timestamps 
• At least 20 liked-song records 
• At least 15 user-follows-user relationships 
*/

INSERT INTO users VALUES
(1, 'maurice1', 'maurice1@email.com', 'Maurice One', '2000-01-01', 'USA', '2024-01-01', 'Free'),
(2, 'alex02', 'alex02@email.com', 'Alex', '1999-02-14', 'USA', '2024-01-05', 'Premium'),
(3, 'jordan03', 'jordan03@email.com', 'Jordan', '1998-03-20', 'Canada', '2024-01-10', 'Family'),
(4, 'sam04', 'sam04@email.com', 'Sam', '2001-04-11', 'Mexico', '2024-01-15', 'Free'),
(5, 'chris05', 'chris05@email.com', 'Chris', '1997-05-08', 'USA', '2024-02-01', 'Premium'),
(6, 'taylor06', 'taylor06@email.com', 'Taylor', '1996-06-22', 'Puerto Rico', '2024-02-10', 'Premium'),
(7, 'jamie07', 'jamie07@email.com', 'Jamie', '1995-07-30', 'UK', '2024-03-01', 'Premium'),
(8, 'riley08', 'riley08@email.com', 'Riley', '2002-08-09', 'USA', '2024-03-15', 'Family'),
(9, 'casey09', 'casey09@email.com', 'Casey', '1994-09-17', 'Spain', '2024-04-01', 'Premium'),
(10, 'drew10', 'drew10@email.com', 'Drew', '1993-10-25', 'Brazil', '2024-04-20', 'Family');

INSERT INTO artist VALUES
(1, 2, 'Post Malone', 'American singer and rapper known for blending hip-hop, pop, and rock.', 'USA'),
(2, 3, 'Bad Bunny', 'Puerto Rican artist known for reggaeton, Latin trap, and genre-crossing music.', 'Puerto Rico'),
(3, 5, 'The Weeknd', 'Canadian singer known for dark R&B, pop, and atmospheric production.', 'Canada'),
(4, 7, 'Mac Miller', 'American rapper and producer known for introspective hip-hop and jazz-influenced sounds.', 'USA'),
(5, 9, 'The Neighborhood', 'American alternative band known for moody indie rock and genre-blending songs.', 'USA');

INSERT INTO genre VALUES
(1, 'Hip-Hop'),
(2, 'Reggaeton'),
(3, 'R&B'),
(4, 'Alternative'),
(5, 'Pop');

INSERT INTO artist_genre VALUES
(1, 1),
(1, 5),
(2, 2),
(2, 5),
(3, 3),
(3, 5),
(4, 1),
(5, 4);

INSERT INTO album VALUES
(1, 'Beerbongs & Bentleys', '2018-04-27', 'Album', 1),
(2, 'Hollywoods Bleeding', '2019-09-06', 'Album', 1),
(3, 'Un Verano Sin Ti', '2022-05-06', 'Album', 2),
(4, 'YHLQMDLG', '2020-02-29', 'Album', 2),
(5, 'After Hours', '2020-03-20', 'Album', 3),
(6, 'Starboy', '2016-11-25', 'Album', 3),
(7, 'Swimming', '2018-08-03', 'Album', 4),
(8, 'I Love You.', '2013-04-22', 'Album', 5);

INSERT INTO album_featured_artist VALUES
(2, 3),
(3, 1),
(5, 1),
(6, 5);

INSERT INTO song VALUES
(1, 1, 'Paranoid', 1, 221, FALSE),
(2, 1, 'Spoil My Night', 2, 226, TRUE),
(3, 1, 'Rich and Sad', 3, 206, FALSE),
(4, 1, 'Rockstar', 4, 218, TRUE),
(5, 1, 'Better Now', 5, 231, FALSE),

(6, 2, 'Hollywoods Bleeding', 1, 157, TRUE),
(7, 2, 'Saint-Tropez', 2, 150, TRUE),
(8, 2, 'Circles', 3, 215, FALSE),
(9, 2, 'Goodbyes', 4, 175, TRUE),
(10, 2, 'Sunflower', 5, 158, FALSE),

(11, 3, 'Moscow Mule', 1, 246, TRUE),
(12, 3, 'Despues de la Playa', 2, 230, FALSE),
(13, 3, 'Me Porto Bonito', 3, 178, TRUE),
(14, 3, 'Tití Me Preguntó', 4, 243, TRUE),
(15, 3, 'Ojitos Lindos', 5, 258, FALSE),

(16, 4, 'Si Veo a Tu Mama', 1, 170, FALSE),
(17, 4, 'La Dificil', 2, 163, TRUE),
(18, 4, 'Pero Ya No', 3, 160, FALSE),
(19, 4, 'La Santa', 4, 206, TRUE),
(20, 4, 'Safaera', 5, 295, TRUE),

(21, 5, 'Alone Again', 1, 250, FALSE),
(22, 5, 'Too Late', 2, 239, FALSE),
(23, 5, 'Hardest To Love', 3, 211, FALSE),
(24, 5, 'Blinding Lights', 4, 200, FALSE),
(25, 5, 'Save Your Tears', 5, 215, FALSE),

(26, 6, 'Starboy', 1, 230, TRUE),
(27, 6, 'Party Monster', 2, 249, TRUE),
(28, 6, 'Reminder', 3, 218, TRUE),
(29, 6, 'Secrets', 4, 266, FALSE),
(30, 6, 'Die For You', 5, 260, FALSE),

(31, 7, 'Come Back to Earth', 1, 161, FALSE),
(32, 7, 'Hurt Feelings', 2, 245, TRUE),
(33, 7, 'Whats the Use?', 3, 288, FALSE),
(34, 7, 'Self Care', 4, 345, TRUE),
(35, 7, '2009', 5, 347, FALSE),

(36, 8, 'How', 1, 261, FALSE),
(37, 8, 'Afraid', 2, 251, FALSE),
(38, 8, 'Sweater Weather', 3, 240, FALSE),
(39, 8, 'Female Robbery', 4, 229, TRUE),
(40, 8, 'Flawless', 5, 244, FALSE);

INSERT INTO song_genre VALUES
(1, 1),(2, 1),(3, 1),(4, 1),(5, 5),
(6, 1),(7, 1),(8, 5),(9, 1),(10, 5),
(11, 2),(12, 2),(13, 2),(14, 2),(15, 2),
(16, 2),(17, 2),(18, 2),(19, 2),(20, 2),
(21, 3),(22, 3),(23, 3),(24, 5),(25, 5),
(26, 3),(27, 3),(28, 3),(29, 5),(30, 3),
(31, 1),(32, 1),(33, 1),(34, 1),(35, 1),
(36, 4),(37, 4),(38, 4),(39, 4),(40, 4);

INSERT INTO playlist VALUES
(1, 1, 'Late Night Drive', 'Songs for driving at night.', TRUE),
(2, 2, 'Gym Rotation', 'High energy workout playlist.', FALSE),
(3, 3, 'Chill Weekend', 'Relaxed songs for the weekend.', TRUE),
(4, 4, 'Study Mix', 'Focus music for homework.', FALSE),
(5, 5, 'Summer Favorites', 'Warm weather playlist.', TRUE),
(6, 6, 'Sad Songs', 'Songs for a quiet mood.', FALSE);

INSERT INTO playlist_song VALUES
(1, 1, 8, 1),
(2, 1, 24, 2),
(3, 1, 38, 3),
(4, 1, 30, 4),
(5, 2, 4, 1),
(6, 2, 14, 2),
(7, 2, 20, 3),
(8, 2, 27, 4),
(9, 3, 5, 1),
(10, 3, 15, 2),
(11, 3, 25, 3),
(12, 3, 35, 4),
(13, 4, 1, 1),
(14, 4, 10, 2),
(15, 4, 21, 3),
(16, 4, 31, 4),
(17, 5, 11, 1),
(18, 5, 13, 2),
(19, 5, 24, 3),
(20, 5, 38, 4),
(21, 6, 6, 1),
(22, 6, 22, 2),
(23, 6, 34, 3),
(24, 6, 39, 4);

INSERT INTO liked_song VALUES
(1, 8, '2025-01-05 09:15:00'),
(1, 24, '2025-01-06 10:00:00'),
(2, 4, '2025-01-07 14:20:00'),
(2, 13, '2025-01-07 14:22:00'),
(3, 15, '2025-01-08 18:30:00'),
(3, 25, '2025-01-09 19:00:00'),
(4, 31, '2025-01-10 20:15:00'),
(4, 38, '2025-01-10 20:16:00'),
(5, 10, '2025-01-11 11:40:00'),
(5, 20, '2025-01-11 11:45:00'),
(6, 30, '2025-01-12 08:10:00'),
(6, 35, '2025-01-12 08:12:00'),
(7, 5, '2025-01-13 17:25:00'),
(7, 24, '2025-01-13 17:30:00'),
(8, 14, '2025-01-14 13:10:00'),
(8, 32, '2025-01-14 13:11:00'),
(9, 21, '2025-01-15 21:00:00'),
(9, 37, '2025-01-15 21:05:00'),
(10, 26, '2025-01-16 16:45:00'),
(10, 40, '2025-01-16 16:50:00'),
(1, 35, '2025-01-17 12:00:00'),
(2, 30, '2025-01-18 12:10:00'),
(3, 8, '2025-01-19 12:20:00'),
(4, 11, '2025-01-20 12:30:00');

INSERT INTO user_follows_user VALUES
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 4),
(2, 6),
(3, 2),
(3, 7),
(4, 1),
(4, 8),
(5, 3),
(5, 9),
(6, 4),
(6, 10),
(7, 5),
(7, 8),
(8, 2),
(8, 9),
(9, 6),
(10, 7);

INSERT INTO user_follows_artist VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 1),
(5, 2),
(6, 3),
(7, 4),
(8, 5),
(9, 1),
(10, 2);

INSERT INTO streaming_event VALUES
(1, 1, 8, '2025-01-01 08:10:00', 'Mobile'),
(2, 2, 24, '2025-01-01 09:20:00', 'Desktop'),
(3, 3, 13, '2025-01-01 10:30:00', 'Smart Speaker'),
(4, 4, 31, '2025-01-01 11:40:00', 'Tablet'),
(5, 5, 38, '2025-01-01 12:50:00', 'Mobile'),
(6, 6, 4, '2025-01-01 13:15:00', 'Desktop'),
(7, 7, 20, '2025-01-01 14:25:00', 'Smart Speaker'),
(8, 8, 30, '2025-01-01 15:35:00', 'Tablet'),
(9, 9, 35, '2025-01-01 16:45:00', 'Other'),
(10, 10, 26, '2025-01-01 17:55:00', 'Mobile'),

(11, 1, 10, '2025-01-02 08:05:00', 'Desktop'),
(12, 2, 11, '2025-01-02 09:15:00', 'Mobile'),
(13, 3, 25, '2025-01-02 10:25:00', 'Smart Speaker'),
(14, 4, 34, '2025-01-02 11:35:00', 'Desktop'),
(15, 5, 15, '2025-01-02 12:45:00', 'Mobile'),
(16, 6, 1, '2025-01-02 13:55:00', 'Tablet'),
(17, 7, 22, '2025-01-02 15:05:00', 'Other'),
(18, 8, 39, '2025-01-02 16:15:00', 'Mobile'),
(19, 9, 27, '2025-01-02 17:25:00', 'Desktop'),
(20, 10, 32, '2025-01-02 18:35:00', 'Smart Speaker'),

(21, 1, 14, '2025-01-03 07:50:00', 'Mobile'),
(22, 2, 8, '2025-01-03 09:00:00', 'Desktop'),
(23, 3, 24, '2025-01-03 10:10:00', 'Smart Speaker'),
(24, 4, 36, '2025-01-03 11:20:00', 'Tablet'),
(25, 5, 5, '2025-01-03 12:30:00', 'Mobile'),
(26, 6, 18, '2025-01-03 13:40:00', 'Desktop'),
(27, 7, 29, '2025-01-03 14:50:00', 'Smart Speaker'),
(28, 8, 33, '2025-01-03 16:00:00', 'Mobile'),
(29, 9, 40, '2025-01-03 17:10:00', 'Other'),
(30, 10, 21, '2025-01-03 18:20:00', 'Tablet'),

(31, 1, 24, '2025-01-04 08:00:00', 'Mobile'),
(32, 2, 13, '2025-01-04 09:12:00', 'Desktop'),
(33, 3, 38, '2025-01-04 10:24:00', 'Smart Speaker'),
(34, 4, 31, '2025-01-04 11:36:00', 'Tablet'),
(35, 5, 26, '2025-01-04 12:48:00', 'Mobile'),
(36, 6, 4, '2025-01-04 14:00:00', 'Desktop'),
(37, 7, 20, '2025-01-04 15:12:00', 'Smart Speaker'),
(38, 8, 30, '2025-01-04 16:24:00', 'Tablet'),
(39, 9, 35, '2025-01-04 17:36:00', 'Other'),
(40, 10, 8, '2025-01-04 18:48:00', 'Mobile'),

(41, 1, 11, '2025-01-05 08:08:00', 'Desktop'),
(42, 2, 15, '2025-01-05 09:18:00', 'Mobile'),
(43, 3, 21, '2025-01-05 10:28:00', 'Smart Speaker'),
(44, 4, 37, '2025-01-05 11:38:00', 'Tablet'),
(45, 5, 2, '2025-01-05 12:48:00', 'Mobile'),
(46, 6, 23, '2025-01-05 13:58:00', 'Desktop'),
(47, 7, 28, '2025-01-05 15:08:00', 'Smart Speaker'),
(48, 8, 34, '2025-01-05 16:18:00', 'Tablet'),
(49, 9, 6, '2025-01-05 17:28:00', 'Other'),
(50, 10, 39, '2025-01-05 18:38:00', 'Mobile'),

(51, 1, 5, '2025-01-06 07:55:00', 'Mobile'),
(52, 2, 10, '2025-01-06 09:05:00', 'Desktop'),
(53, 3, 14, '2025-01-06 10:15:00', 'Smart Speaker'),
(54, 4, 24, '2025-01-06 11:25:00', 'Tablet'),
(55, 5, 30, '2025-01-06 12:35:00', 'Mobile'),
(56, 6, 35, '2025-01-06 13:45:00', 'Desktop'),
(57, 7, 31, '2025-01-06 14:55:00', 'Smart Speaker'),
(58, 8, 38, '2025-01-06 16:05:00', 'Tablet'),
(59, 9, 25, '2025-01-06 17:15:00', 'Other'),
(60, 10, 1, '2025-01-06 18:25:00', 'Mobile'),

(61, 1, 12, '2025-01-07 08:11:00', 'Desktop'),
(62, 2, 19, '2025-01-07 09:21:00', 'Mobile'),
(63, 3, 22, '2025-01-07 10:31:00', 'Smart Speaker'),
(64, 4, 27, '2025-01-07 11:41:00', 'Tablet'),
(65, 5, 32, '2025-01-07 12:51:00', 'Mobile'),
(66, 6, 36, '2025-01-07 14:01:00', 'Desktop'),
(67, 7, 40, '2025-01-07 15:11:00', 'Smart Speaker'),
(68, 8, 8, '2025-01-07 16:21:00', 'Tablet'),
(69, 9, 16, '2025-01-07 17:31:00', 'Other'),
(70, 10, 24, '2025-01-07 18:41:00', 'Mobile'),

(71, 1, 26, '2025-01-08 08:07:00', 'Mobile'),
(72, 2, 30, '2025-01-08 09:17:00', 'Desktop'),
(73, 3, 35, '2025-01-08 10:27:00', 'Smart Speaker'),
(74, 4, 38, '2025-01-08 11:37:00', 'Tablet'),
(75, 5, 11, '2025-01-08 12:47:00', 'Mobile'),
(76, 6, 13, '2025-01-08 13:57:00', 'Desktop'),
(77, 7, 20, '2025-01-08 15:07:00', 'Smart Speaker'),
(78, 8, 21, '2025-01-08 16:17:00', 'Tablet'),
(79, 9, 33, '2025-01-08 17:27:00', 'Other'),
(80, 10, 39, '2025-01-08 18:37:00', 'Mobile'),

(81, 1, 4, '2025-01-09 08:09:00', 'Desktop'),
(82, 2, 5, '2025-01-09 09:19:00', 'Mobile'),
(83, 3, 15, '2025-01-09 10:29:00', 'Smart Speaker'),
(84, 4, 24, '2025-01-09 11:39:00', 'Tablet'),
(85, 5, 25, '2025-01-09 12:49:00', 'Mobile'),
(86, 6, 34, '2025-01-09 13:59:00', 'Desktop'),
(87, 7, 37, '2025-01-09 15:09:00', 'Smart Speaker'),
(88, 8, 10, '2025-01-09 16:19:00', 'Tablet'),
(89, 9, 18, '2025-01-09 17:29:00', 'Other'),
(90, 10, 28, '2025-01-09 18:39:00', 'Mobile'),

(91, 1, 31, '2025-01-10 08:03:00', 'Mobile'),
(92, 2, 8, '2025-01-10 09:13:00', 'Desktop'),
(93, 3, 14, '2025-01-10 10:23:00', 'Smart Speaker'),
(94, 4, 26, '2025-01-10 11:33:00', 'Tablet'),
(95, 5, 30, '2025-01-10 12:43:00', 'Mobile'),
(96, 6, 35, '2025-01-10 13:53:00', 'Desktop'),
(97, 7, 38, '2025-01-10 15:03:00', 'Smart Speaker'),
(98, 8, 24, '2025-01-10 16:13:00', 'Tablet'),
(99, 9, 11, '2025-01-10 17:23:00', 'Other'),
(100, 10, 40, '2025-01-10 18:33:00', 'Mobile');


