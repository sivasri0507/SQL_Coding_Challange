-- 1. Top Influencers
SELECT u.username, 
       (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) AS total_engagement
FROM users u
JOIN posts p ON u.user_id = p.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY u.user_id, u.username
ORDER BY total_engagement DESC
LIMIT 5;

-- 2. Virality Report
SELECT 
    p.post_id, 
    p.caption,
    (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) AS engagement_score
FROM posts p
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.caption
ORDER BY engagement_score DESC;

-- 3. User Activity Timeline
SELECT DATE(posted_at) AS post_date, COUNT(post_id) AS posts_count
FROM posts
GROUP BY DATE(posted_at)
ORDER BY post_date DESC;

-- 4. Follower Growth
SELECT following_id AS user_id, COUNT(follower_id) AS recent_followers
FROM followers
WHERE follow_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY following_id
ORDER BY recent_followers DESC;

-- 5. Trending Hashtags (Assuming hashtags table exists)
/*
SELECT h.hashtag_name, COUNT(ph.post_id) AS usage_count
FROM hashtags h
JOIN post_hashtags ph ON h.hashtag_id = ph.hashtag_id
JOIN posts p ON ph.post_id = p.post_id
WHERE p.posted_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY h.hashtag_name
ORDER BY usage_count DESC;
*/