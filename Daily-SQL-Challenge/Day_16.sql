CREATE TABLE user_activity (
    user_id INT,
    login_date DATE
);

INSERT INTO user_activity (user_id, login_date) VALUES
(1, '2024-08-01'),
(1, '2024-08-02'),
(1, '2024-08-05'),
(1, '2024-08-07'),
(2, '2024-08-01'),
(2, '2024-08-02'),
(2, '2024-08-03'),
(2, '2024-08-04'),
(2, '2024-08-06'),
(3, '2024-08-01'),
(3, '2024-08-02'),
(3, '2024-08-03'),
(3, '2024-08-07'),
(4, '2024-08-02'),
(4, '2024-08-05'),
(4, '2024-08-07');

-- Given a user_activity table, write a SQL query to find all users who have logged in on at least 3 consecutive days.
WITH streak_table AS (
    SELECT 
        user_id,
        login_date,
        CASE
            WHEN login_date = DATE_ADD(LAG(login_date) OVER(PARTITION BY user_id ORDER BY login_date), INTERVAL 1 DAY) THEN 1
            ELSE 0
        END as streaks
    FROM user_activity
),
streak2 AS (
    SELECT 
        user_id,
        login_date,
        SUM(streaks) OVER(PARTITION BY user_id ORDER BY login_date) as consecutive_login
    FROM streak_table
)
SELECT DISTINCT 
    user_id
FROM streak2
WHERE consecutive_login >= 2;
