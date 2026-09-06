-- Challenge 1: Create Database
CREATE DATABASE SocialMediaDB;
USE SocialMediaDB;

-- Challenge 2: Create Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Challenge 3: Alter Table
ALTER TABLE users ADD COLUMN bio VARCHAR(255);

-- Challenge 4: Rename & Drop
RENAME TABLE users TO app_users;
RENAME TABLE app_users TO users;

CREATE TABLE temp_table (id INT);
DROP TABLE IF EXISTS temp_table;