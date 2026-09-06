-- Challenge 1: Create Comments & Likes Tables
CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    commented_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    liked_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Challenge 2: JOIN Report
SELECT p.post_id, u.username, p.caption, 
       COUNT(DISTINCT l.like_id) AS total_likes, 
       COUNT(DISTINCT c.comment_id) AS total_comments
FROM posts p
JOIN users u ON p.user_id = u.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id, u.username, p.caption;

-- Challenge 3: Built-in Functions
SELECT UPPER(username) AS uppercase_name FROM users;
SELECT post_id, MONTHNAME(posted_at) AS month_name FROM posts;
SELECT caption, LENGTH(caption) AS caption_length FROM posts;

-- Challenge 4: UNION
SELECT user_id FROM comments
UNION
SELECT user_id FROM likes;