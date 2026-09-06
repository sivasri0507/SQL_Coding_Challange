-- Challenge 1: Filter Users starting with 'a'
SELECT * FROM users WHERE username LIKE 'a%';

-- Challenge 2: Posts Filter
SELECT * FROM posts WHERE posted_at BETWEEN '2024-01-01' AND '2024-12-31';

-- Challenge 3: NULL checks
SELECT * FROM posts WHERE caption IS NULL;

-- Challenge 4: IN Clause
SELECT * FROM users 
WHERE email LIKE '%@gmail.com' 
   OR email LIKE '%@hotmail.com' 
   OR email LIKE '%@yahoo.com';