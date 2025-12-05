/*
197. Rising Temperature
출처: leetCode SQL50 
날짜: 2025-12-05
DBMS: PostgreSQL

💦 오답 기록:
💡 리팩토링 포인트:
*/

SELECT
    w1.id AS id
FROM Weather AS w1
JOIN Weather AS w2
  ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature;