-- 1. List all songs in a specific album, ordered by track number.
SELECT song.title
FROM song 
JOIN album ON song.album_id = album.album_id
WHERE album.title = 'Album Title Here'
ORDER BY song.track_number;

-- 2. Find all playlists owned by a specific user.
SELECT playlist.title
FROM playlist
JOIN users ON playlist.user_id = users.user_id
WHERE users.username = '[Username Here]';

-- 3. Show all users who are following a given artist.
SELECT users.username
FROM users
JOIN user_follows_artist ON users.user_id = user_follows_artist.user_id
JOIN artist ON user_follows_artist.artist_id = artist.artist_id
WHERE artist.artist_name = '[Artist Name]';

-- 4. Retrieve all streaming events for a specific user in the past 30 days.
SELECT *
FROM streaming_event
JOIN users ON streaming_event.user_id = users.user_id
WHERE users.username = '[Username Here]'
AND streaming_event.stream_time >= CURRENT_DATE - INTERVAL 30 DAY;
   
-- 5. List all songs that have been marked explicit. 
SELECT title
FROM song
WHERE explicit_content_flag = TRUE;

-- 6. Find the top 10 most-played songs of all time (by total stream count).
SELECT song.title, COUNT(*) AS total_streams
FROM streaming_event
JOIN song ON streaming_event.song_id = song.song_id
GROUP BY song.title
ORDER BY total_streams DESC
LIMIT 10;

-- 7. List every artist and the total number of streams across all their songs.
SELECT artist.artist_name, COUNT(*) AS total_streams
FROM streaming_event
JOIN song ON streaming_event.song_id = song.song_id
JOIN album ON song.album_id = album.album_id
JOIN artist ON album.primary_artist_id = artist.artist_id
GROUP BY artist.artist_name;

-- 8. For each user, show how many unique songs they have listened to.
SELECT users.username, COUNT(DISTINCT streaming_event.song_id) AS unique_songs_listened
FROM users
JOIN streaming_event ON users.user_id = streaming_event.user_id
GROUP BY users.username;

-- 9. Find all songs that appear in more than one playlist.
SELECT song.title
FROM playlist_song
JOIN song ON playlist_song.song_id = song.song_id
GROUP BY song.title
HAVING COUNT(DISTINCT playlist_song.playlist_id) > 1;

-- 10. List users who have never streamed a song (no listening history).
SELECT users.username
FROM users
LEFT JOIN streaming_event ON users.user_id = streaming_event.user_id
WHERE streaming_event.stream_id IS NULL
AND streaming_event.song_id IS NULL;

-- 11. For each user, find their single most-listened-to artist (by stream count). Display the user and artist name.
SELECT users.username, artist.artist_name 
FROM users
JOIN streaming_event ON users.user_id = streaming_event.user_id
JOIN song ON streaming_event.song_id = song.song_id
JOIN album ON song.album_id = album.album_id
JOIN artist ON album.primary_artist_id = artist.artist_id
GROUP BY users.username, artist.artist_name
HAVING COUNT(*) = (
    SELECT MAX(stream_count)
    FROM (
        SELECT COUNT(*) AS stream_count
        FROM streaming_event
        JOIN song ON streaming_event.song_id = song.song_id
        JOIN album ON song.album_id = album.album_id
        JOIN artist ON album.primary_artist_id = artist.artist_id
        WHERE streaming_event.user_id = users.user_id
        GROUP BY artist.artist_name
    ) AS most_listened_artist
);

-- 12. List all pairs of users who mutually follow each other.
SELECT f1.follower_user_id AS user1_id, f1.following_user_id AS user2_id
FROM user_follows_user AS f1
JOIN user_follows_user AS f2 
ON f1.follower_user_id = f2.following_user_id 
AND f1.following_user_id = f2.follower_user_id;

-- 13. Find albums where every song has been streamed at least once.
SELECT album.title
FROM album
JOIN song ON album.album_id = song.album_id
LEFT JOIN streaming_event ON song.song_id = streaming_event.song_id
GROUP BY album.title;

-- 14. Calculate the average song duration per genre, ordered by average duration descending.
SELECT genre.genre_name, AVG(song.duration_seconds) AS average_duration
FROM song
JOIN song_genre ON song.song_id = song_genre.song_id
JOIN genre ON song_genre.genre_id = genre.genre_id
GROUP BY genre.genre_name
ORDER BY average_duration DESC;

-- View 1. song_stats — for each song: title, artist name, album name, total stream count, total unique listeners.
CREATE VIEW song_stats AS
SELECT song.title, artist.artist_name, album.title, COUNT(streaming_event.stream_id) AS total_streams,
COUNT(DISTINCT streaming_event.user_id) AS unique_listeners
FROM song
JOIN album ON song.album_id = album.album_id
JOIN artist ON album.primary_artist_id = artist.artist_id
LEFT JOIN streaming_event ON song.song_id = streaming_event.song_id
GROUP BY song.song_id, song.title, artist.artist_name, album.title; 

-- View 2. user_library — for each user: all liked songs with artist and album.
CREATE VIEW user_library AS
SELECT users.username, song.title, artist.artist_name, album.title
FROM users
JOIN liked_song ON users.user_id = liked_song.user_id
JOIN song ON liked_song.song_id = song.song_id
JOIN album ON song.album_id = album.album_id
JOIN artist ON album.primary_artist_id = artist.artist_id;

-- View 3. artist_popularity — for each artist: total streams, total followers, total songs released.
CREATE VIEW artist_popularity AS
SELECT 
    artist.artist_name, 
    COUNT(DISTINCT streaming_event.stream_id) AS total_streams,
    COUNT(DISTINCT user_follows_artist.user_id) AS total_followers,
    COUNT(DISTINCT song.song_id) AS total_songs
FROM artist
LEFT JOIN album ON artist.artist_id = album.primary_artist_id
LEFT JOIN song ON album.album_id = song.album_id
LEFT JOIN streaming_event ON song.song_id = streaming_event.song_id
LEFT JOIN user_follows_artist ON artist.artist_id = user_follows_artist.artist_id
GROUP BY artist.artist_id, artist.artist_name;

