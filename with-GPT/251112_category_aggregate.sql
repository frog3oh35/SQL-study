/*
📅 Date: 2025-11-12
🧩 Topic: JOIN 기본 + 집계함수 + GROUP BY
🐰 문제 요약 :
  - PRODUCT ⋈ ORDER_ITEM (PRODUCT_ID)로 조인
  - 카테고리별로 아래 지표 집계:
    * ORDER_LINE_COUNT = 행 수
    * TOTAL_QTY = Σ QTY
    * TOTAL_SALES = Σ PRICE * QTY
  - 결과는 CATEGORY ASC

💡 리팩토링 포인트:
  - "주문 건수"기준이 필요하면: COUNT(DISTINCT o.ORDER_ID)
  - 주문 0건 카테고리까지 보려면: LEFT JOIN + COALESCE (집계, 0)
  - 인덱스 팁(데이터가 많을 때): ORDER_ITEM(PRODUCT_ID)

*/

SELECT
    p.CATEGORY,
    COUNT(*) AS ORDER_LINE_COUNT,
    SUM(o.QTY) AS TOTAL_QTY,
    SUM(p.PRICE * o.QTY) AS TOTAL_SALES
FROM PRODUCT AS p
JOIN ORDER_ITEM AS o
  ON p.PRODUCT_ID = o.PRODUCT_ID
GROUP BY p.CATEGORY
ORDER BY p.CATEGORY ASC;