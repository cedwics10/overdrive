-- Table user
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table role
CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Table user_role (liaison many-to-many)
CREATE TABLE user_role (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_userrole_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    CONSTRAINT fk_userrole_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE
);

-- Table artist (lié à user)
CREATE TABLE artist (
    id INT PRIMARY KEY,
    bio TEXT,
    image_url VARCHAR(255),
    CONSTRAINT fk_artist_user FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE
);

-- Table album
CREATE TABLE album (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    release_date DATE,
    cover_url VARCHAR(255),
    CONSTRAINT fk_album_artist FOREIGN KEY (artist_id) REFERENCES user(id) ON DELETE CASCADE
);

-- Table song
CREATE TABLE song (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT,
    duration INT,
    audio_url VARCHAR(255),
    CONSTRAINT fk_song_artist FOREIGN KEY (artist_id) REFERENCES user(id) ON DELETE CASCADE,
    CONSTRAINT fk_song_album FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE SET NULL
);
