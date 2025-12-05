/*
1581. Customer Who Visited but Did Not Make Any Transactions
출처: leetCode SQL50 
날짜: 2025-12-05
DBMS: PostgreSQL

💦 오답 기록:
💡 리팩토링 포인트:
*/

SELECT
    customer_id,
    COUNT(*) AS count_no_trans
FROM Visits AS v
LEFT JOIN Transactions AS t
       ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id;