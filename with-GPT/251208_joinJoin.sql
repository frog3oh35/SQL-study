/*
📅 Date: 2025-12-08
🧩 Topic: Multi JOIN + COALESCE + Aggregation Function
🐰 문제 요약 :
    -온라인 쇼핑몰 데이터를 기반으로 고객별 월간 지출 리포트를 생성하는 문제이다. 지정된 기간(2025-11-01 ~ 2025-12-01) 동안 발생한 주문만 집계하며, 고객 정보 · 주문 정보 · 주문 상품 정보 · 상품 가격 정보를 모두 활용해야 한다.
    - 각 고객에 대해 다음 값을 계산한다:
    - 주문 횟수
    - 총 구매 수량
    - 상품 금액 총합
    - 배송비 총합 (배송비는 NULL 가능)
    - 총 지출액 = 상품 금액 + 배송비

💦 오답 기록:
💡 리팩토링 포인트:
*/


SELECT
    c.NAME AS CUSTOMER_NAME,
    c.GRADE,
    COUNT(DISTINCT info.ORDER_ID) AS ORDER_COUNT,
    SUM(item.QUANTITY) AS TOTAL_QTY,
    SUM(p.PRICE * item.QUANTITY) AS TOTAL_PRODUCT_COST,
    -- 서브쿼리 보충 공부 필요
    SUM(
        IF(
            info.PRODUCT_ID = (
                SELECT MIN(i2.PRODUCT_ID)
                FROM ORDER_ITEM i2
                WHERE i2.ORDER_ID = info.ORDER_ID
            ),
            COALESCE(info.SHIPPING_FEE, 0), 0
        ) AS TOTAL_SHIPPING,
    SUM(
        (p.PRICE * item.QUANTITY)
        +
        IF(
            item.PRODUCT_ID = (
                SELECT MIN(i2.PRODUCT_ID)
                FROM ORDER_ITEM i2
                WHERE i2.ORDER_ID = info.ORDER_ID
            ),
            COALESCE(info.SHIPPINg_FEE, 0),
            0
        )
    ) AS TOTAL_PAID
FROM CUSTOMER AS c 
INNER JOIN ORDER_INFO AS info
        ON c.CUSTOMER_ID = info.CUSTOMER_ID
INNER JOIN ORDER_ITEM AS item
        ON info.ORDER_ID = item.ORDER_ID
INNER JOIN PRODUCT AS p
        ON item.PRODUCT_ID = p.PRODUCT_ID
WHERE info.ORDER_DATE >= '2025-11-01' AND info.ORDER_DATE < '2025-12-01'
GROUP BY c.NAME, c.GRADE
ORDER BY TOTAL_PAID DESC, CUSTOMER_NAME ASC;