/*
문제: 성분으로 구분한 아이스크림 총 주문량
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 2
포인트: JOIN, GROUP BY, Aggregate Func
날짜: 2025-11-30

💡 리팩토링 포인트:
    1. INNER JOIN 명시하는 것이 좋음
*/

SELECT
    i.INGREDIENT_TYPE,
    SUM(h.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF AS h
JOIN ICECREAM_INFO AS i
  ON h.FLAVOR = i.FLAVOR
GROUP BY i.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC;