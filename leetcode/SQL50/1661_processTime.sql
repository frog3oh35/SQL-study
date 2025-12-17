/*
1661. Average Time of Process per Machine
출처: leetCode SQL50
날짜: 2025-12-17
DBMS: PostgreSQL

*/

SELECT
    s.machine_id,
    ROUND(AVG(e.timestamp - s.timestamp)::numeric, 3) AS processing_time
FROM Activity s
JOIN Activity e
  ON s.machine_id = e.machine_id
 AND s.process_id = e.process_id
 AND s.activity_type = 'start'
 AND e.activity_type = 'end'
GROUP BY s.machine_id;