/*
문제: 가격대 별 상품 개수 구하기
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 2
포인트: GROUP BY, Aggregate Func
날짜: 2025-12-22

💡 리팩토링 포인트:
    1. TRUNCATE 함수 활용하는 방법도 있음
*/

SELECT
    (PRICE - (PRICE % 10000)) AS PRICE_GROUP,
    COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP ASC;