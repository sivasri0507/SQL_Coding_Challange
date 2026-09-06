-- Challenge 3: Text-to-SQL
SELECT u.user_id, u.username, COUNT(l.like_id) AS total_likes_received
FROM users u
JOIN posts p ON u.user_id = p.user_id
JOIN likes l ON p.post_id = l.post_id
WHERE YEAR(l.liked_at) = YEAR(CURDATE())
GROUP BY u.user_id, u.username
ORDER BY total_likes_received DESC
LIMIT 10;