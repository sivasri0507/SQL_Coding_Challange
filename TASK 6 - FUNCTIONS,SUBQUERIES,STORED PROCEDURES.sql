-- Challenge 1: User Defined Function
DELIMITER //
CREATE FUNCTION GetUserEngagement(p_user_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_engagement INT;
    SELECT (SELECT COUNT(*) FROM likes WHERE user_id = p_user_id) +
           (SELECT COUNT(*) FROM comments WHERE user_id = p_user_id) 
    INTO total_engagement;
    RETURN total_engagement;
END //
DELIMITER ;

-- Challenge 2: Subquery
SELECT following_id AS user_id, COUNT(follower_id) AS follower_count
FROM followers
GROUP BY following_id
HAVING follower_count > (
    SELECT AVG(f_count) 
    FROM (SELECT COUNT(follower_id) AS f_count FROM followers GROUP BY following_id) AS temp
);

-- Challenge 3: Stored Procedure
DELIMITER //
CREATE PROCEDURE GetUserPosts(IN p_username VARCHAR(50))
BEGIN
    SELECT p.* 
    FROM posts p
    JOIN users u ON p.user_id = u.user_id
    WHERE u.username = p_username;
END //
DELIMITER ;