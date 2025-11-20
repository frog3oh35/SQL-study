/*
📅 Date: 2025-11-20
🧩 Topic: 쿼리 종합 연습 (기본 쿼리)
🐰 문제 요약:
    - 정비 내역과 차량 정보를 JOIN하여, 월별로 특정 정비 타입의 매출/건수를 집계하는 문제. GROUP BY, HAVING, DATE_FORMAT, INNER JOIN을 활용하는 Phase 1 종합 훈련 문제

💡 리팩토링 포인트:
    1. GROUP BY + alias : MySQL에서만 사용가능
        - 표준 SQL, pgsql, oracle, sql server 모두 GROUP BY + alias 불가, 반드시 원래 표현식 사용 필요
        - SQL 실행 순서는 논리적으로 (FROM -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY 순)
        - WHERE 에서는 어떤 DB든 alias 사용 불가 
*/


SELECT
    DATE_FORMAT(m.MAINT_DATE, '%Y-%m') AS MONTH,
    SUM(m.COST) AS TOTAL_COST,
    COUNT(m.MAINT_ID) AS TOTAL_COUNT,
    COUNT(DISTINCT c.MODEL) AS MODEL_COUNT
FROM CAR AS c
JOIN MAINTENANCE AS m
  ON c.CAR_ID = m.CAR_ID
WHERE TYPE = 'ENGINE'
GROUP BY MONTH
-- MySQL에서만 허용된 방식이고
-- GROUP BY DATE_FORMAT(m.MAINT_DATE, '%Y-%m')... 써야함...
-- 표준 SQL 기준 alias 사용 불가
HAVING TOTAL_COST >= 200000
ORDER BY MONTH ASC;

