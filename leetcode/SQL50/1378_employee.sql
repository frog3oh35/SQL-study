/*
1378. Replace Employee ID With The Unique Identifier
출처: leetCode SQL50 
날짜: 2025-12-04
DBMS: PostgreSQL

💦 오답 기록:
💡 리팩토링 포인트:
*/

-- Write your PostgreSQL query statement below
SELECT
    COALESCE(unique_id, NULL) AS unique_id,
    name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS u
        ON e.id = u.id;