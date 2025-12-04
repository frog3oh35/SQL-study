/*
1148. Article Views I
출처: leetCode SQL50 
날짜: 2025-12-04

💦 오답 기록:
💡 리팩토링 포인트:
*/

SELECT author_id AS id
FROM Views
WHERE author_id = viewer_id
GROUP BY author_id
ORDER BY id ASC;