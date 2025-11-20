/*
문제: 가격이 제일 비싼 식품의 정보 출력하기
출처: [프로그래머스] SQL kit - SUM, MAX, MIN
난이도: Level 2
포인트: Aggregate Function
날짜: 2025-11-20
*/


SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_CD,
    CATEGORY,
    PRICE
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT);

-- 집계함수 안 쓰고 아주 간단하게 쓰려면
-- ORDER BY PRICE DESC LIMIT 1