/*
문제: 주문량이 많은 아이스크림들 조회하기
출처: [프로그래머스] SQL kit - JOIN
난이도: Level 4
포인트: Subquery, JOIN in Subquery
날짜: 2025-12-02

오답 기록:
    - 집계한 결과를 보여주고 싶지 않을 땐 서브쿼리 사용해야 함
리팩토링 포인트:
    - CTE 적용, 사전 집계, COALESCE 등 리팩토링 다시 적용해보기!
*/


SELECT
    FLAVOR
FROM (
    SELECT
        F.FLAVOR,
        SUM(F.TOTAL_ORDER + J.TOTAL_ORDER) AS TOTAL
    FROM FIRST_HALF AS F
    JOIN JULY AS J
      ON F.FLAVOR = J.FLAVOR
    GROUP BY FLAVOR
) AS T
ORDER BY TOTAL DESC 
LIMIT 3;