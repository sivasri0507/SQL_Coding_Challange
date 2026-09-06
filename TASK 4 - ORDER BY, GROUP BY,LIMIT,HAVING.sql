-- Challenge 1: Top Active Users
SELECT u.username, COUNT(p.post_id) AS total_posts 
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username
ORDER BY total_posts DESC
LIMIT 5;

-- Challenge 2: Group by Posts Per Day
SELECT DATE(posted_at) AS date, COUNT(post_id) AS total_posts
FROM posts
GROUP BY DATE(posted_at)
HAVING COUNT(post_id) > 10;