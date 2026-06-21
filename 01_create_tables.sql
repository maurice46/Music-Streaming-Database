CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    display_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    country VARCHAR(50) NOT NULL,
    account_created DATE NOT NULL,
    subscription_tier VARCHAR(10) NOT NULL,
    CHECK (subscription_tier IN ('Free', 'Premium', 'Family'))
);

CREATE TABLE artist (
    artist_id INT PRIMARY KEY,
    user_id INT UNIQUE,
    artist_name VARCHAR(100) NOT NULL UNIQUE,
    biography TEXT NOT NULL,
    country VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE album (
    album_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    album_type VARCHAR(20) NOT NULL,
    primary_artist_id INT NOT NULL,
    FOREIGN KEY (primary_artist_id) REFERENCES artist(artist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CHECK (album_type IN ('Single', 'EP', 'Album', 'Compilation'))
);

create table album_featured_artist (
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES album(album_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE song (
    song_id INT PRIMARY KEY,
    album_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    track_number INT NOT NULL,
    duration_seconds INT NOT NULL,
    explicit_content_flag BOOLEAN NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CHECK (track_number > 0),
    CHECK (duration_seconds > 0)
);

CREATE TABLE playlist (
    playlist_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    is_public BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE playlist_song (
    playlist_song_id INT PRIMARY KEY,
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    position_number INT NOT NULL,
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (song_id) REFERENCES song(song_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CHECK (position_number > 0)
);

CREATE TABLE liked_song (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    liked_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (song_id) REFERENCES song(song_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE user_follows_user (
    follower_user_id INT NOT NULL,
    following_user_id INT NOT NULL,
    PRIMARY KEY (follower_user_id, following_user_id),
    FOREIGN KEY (follower_user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (following_user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table user_follows_artist (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE streaming_event (
    stream_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    stream_timestamp DATETIME NOT NULL,
    device_type VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (song_id) REFERENCES song(song_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CHECK (device_type IN ('Mobile', 'Desktop', 'Smart Speaker', 'Tablet', 'Other'))
);

create table genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

create table song_genre (
    song_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (song_id, genre_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table artist_genre (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE INDEX idx_song_album ON song(album_id);
CREATE INDEX idx_stream_user ON streaming_event(user_id);
CREATE INDEX idx_stream_song ON streaming_event(song_id);




