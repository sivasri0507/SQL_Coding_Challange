-- Challenge 1: Posts Table
USE socialmediadb;
CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    caption TEXT,
    posted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Challenge 2: Followers Table
CREATE TABLE followers (
    follower_id INT,
    following_id INT,
    follow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follower_id, following_id),
    FOREIGN KEY (follower_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (following_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Challenge 3: Insert Sample Data
INSERT INTO users (username, full_name, email, bio) VALUES
('alex_g', 'Alex Green', 'alex@gmail.com', 'Developer'),
('anita_r', 'Anita Ray', 'anita@yahoo.com', 'Designer'),
('bharat_k', 'Bharat K', 'bharat@hotmail.com', 'Blogger'),
('charlie_m', 'Charlie M', 'charlie@gmail.com', 'Photographer'),
('divya_p', 'Divya P', 'divya@gmail.com', 'Traveler');

INSERT INTO posts (user_id, caption) VALUES
(1, 'Hello World! First post.'),
(2, 'Beautiful day!'),
(1, 'Learning SQL today.'),
(3, NULL),
(4, 'Loving this weather.');

-- Challenge 4: Update & Delete
UPDATE users SET bio = 'Senior Software Developer' WHERE user_id = 1;
DELETE FROM posts WHERE post_id = 4;