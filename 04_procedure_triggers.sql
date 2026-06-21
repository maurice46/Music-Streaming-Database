/*
Stored procedures
record_stream(user_id, song_id, device_type) 
— inserts a new streaming event with the current timestamp.
add_song_to_playlist(playlist_id, song_id) 
— adds a song to the end of a playlist, handling position/order correctly.
get_user_top_songs(user_id, n) 
— returns the top n songs for a given user by stream count.

Triggers
prevent_duplicate_liked_song 
— BEFORE INSERT on the liked-songs table; raises an error if the user has already liked that song.
enforce_explicit_age_gate 
— BEFORE INSERT on streaming events; raises an error if the song is explicit and the user is under 18 (calculate age from date_of_birth).
*/
create procedure record_stream(IN user_id INT, IN song_id INT, IN device_type VARCHAR(20))
BEGIN
    INSERT INTO streaming_event(stream_id, user_id, song_id, stream_timestamp, device_type)
    VALUES (NULL, user_id, song_id, NOW(), device_type);
END;

create procedure add_song_to_playlist(IN playlist_id INT, IN song_id INT)
BEGIN
    INSERT INTO playlist_song(playlist_song_id, playlist_id, song_id, position_number)
    VALUES (
        NULL, 
        playlist_id, 
        song_id,
        (SELECT IFNULL(MAX(position_number), 0) + 1 
        FROM playlist_song 
        WHERE playlist_id = playlist_id));
END;

create procedure get_user_top_songs(IN user_id INT, IN n INT)
BEGIN
    SELECT song_id, COUNT(*) AS stream_count
    FROM streaming_event
    WHERE user_id = user_id
    GROUP BY song_id
    ORDER BY stream_count DESC
    LIMIT n;
END;

create trigger prevent_duplicate_liked_song
BEFORE INSERT ON liked_song
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT *
        FROM liked_song
        WHERE user_id = NEW.user_id AND song_id = NEW.song_id
    ) THEN
        SET MESSAGE_TEXT = 'User has already liked this song'
    END IF;
END;

create trigger enforce_explicit_age_gate
BEFORE INSERT ON streaming_event    
FOR EACH ROW
BEGIN
    IF (
        (SELECT explicit_content_flag FROM song WHERE song_id = NEW.song_id) = TRUE
        AND
        (SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) FROM users WHERE user_id = NEW.user_id) < 18
        ) THEN
            SET MESSAGE_TEXT = 'User is under 18 and cannot stream explicit content'
    END IF;
END;

