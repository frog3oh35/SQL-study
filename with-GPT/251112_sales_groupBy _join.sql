/*
📅 Date: 2025-11-12
🧩 Topic: GROUP BY, JOIN
🐰 문제 요약 :
    - 2025-11-09 ~ 2025-11-11 기간 동안 카테고리별로 주문건수(DISTINCT ORDER_ID), 총 수량, 총 매출(PRICE*QTY)을 산출한다. 
    - PRODUCT-ORDER_ITEM-ORDERS를 JOIN 후 GROUP BY CATEGORY, CATEGORY 오름차순 정렬.

💡 리팩토링 포인트:
    1. 긴가민가해서 썼는데 정답
        - COUNT(DISTINCT i.ORDER_ID):
        동일한 주문 내에 같은 카테고리 상품이 여러 개 포함될 수 있다. 단순 COUNT(*) 사용 시 과집계 발생 가능. DISTINCT 를 사용해 '주문건수'를 정확히 계산한다
    2. WHERE 조건과 인덱스 우호:
        - BETWEEN은 양쪽 조건 포함, 내부적으로 DATE >= '%Y-%m-%d' AND DATE <= '%Y-%m-%d'와 같음
        - 그런데! <= 부분이 DB 입장에선 '2025-11-11'이후 값이 존재하는지 확인해야 해서 정확히 '다음 값 경계'를 알 수 없다. 반개방 구간은 끝 경계과 명확하다
        - 예를 들어
        - WHERE DATE >= '2025-11-09' AND DATE < '2025-11-12'
        - 이건 DB에게 "11일 23:59:59"까지는 포함. 그 이후는 딱 끊어라"라는 명확한 경계를 준다
        - 한마디로 절단점이 애매해서! 반개방 구간으로 해야함 11-11 00:00:00이 될수도 있음...

*/

SELECT 
    p.CATEGORY,
    COUNT(DISTINCT i.ORDER_ID) AS ORDER_CNT,
    SUM(i.QTY) AS TOTAL_QTY,
    SUM(p.PRICE * i.QTY) AS TOTAL_SALES
FROM PRODUCT AS p
JOIN ORDER_ITEM AS i 
  ON p.PRODUCT_ID = i.PRODUCT_ID
JOIN ORDERS AS o
  ON i.ORDER_ID = o.ORDER_ID
WHERE o.ORDER_DATE >= '2025-11-09' AND o.ORDER_DATE <= '2025-11-11'
GROUP BY p.CATEGORY
ORDER BY p.CATEGORY ASC;