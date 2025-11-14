/*
📅 Date: 2025-11-14
🧩 Topic: HAVING
🐰 문제1 요약:
    - 각 사용자(USER_ID) 별로 총 주문 수량(SUM(QTY))이 5 이상인 사용자만 조회하기.
*/

SELECT
    USER_ID,
    SUM(QTY) AS TOTAL_QTY
FROM ORDER_ITEM
GROUP BY USER_ID
HAVING SUM(QTY) > 4
ORDER BY USER_ID ASC;


/*
🐰 문제2 요약:
    - SALES 테이블에서 PRODUCT별 총 매출액(SUM(QTY * PRICE))을 계산하고 합계가 5000 이상인 제품만 HAVING으로 필터링하는 문제
*/

SELECT
    PRODUCT,
    SUM(QTY * PRICE) AS TOTAL_SALES
FROM SALES
GROUP BY PRODUCT
HAVING SUM(QTY * PRICE) >= 5000
ORDER BY TOTAL_SALES DESC;


/*
🐰 문제3 요약:
    - STORE_ID별 주문 건수와 판매 수량을 계산하고
HAVING 절에서 두 집계 조건(수량 5 이상 + 주문수 2건 이상)을 동시에 필터링하는 문제
💡 리팩토링 포인트:
*/

SELECT
    STORE_ID,
    COUNT(*) AS ORDER_COUNT,
    SUM(QTY) AS TOTAL_QTY
FROM STORE_ORDER
GROUP BY STORE_ID
HAVING TOTAL_QTY >= 5 AND ORDER_COUNT >= 2
ORDER BY STORE_ID ASC;