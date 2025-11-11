/*
📅 Date: 2025-11-11
🧩 Topic: JOIN 기본 + 집계 함수
🐰 문제 요약 :
    - MENU / ORDERS 테이블을 JOIN하여 메뉴별로 다음을 구한다
        * 주문 횟수
        * 총 판매 수량
        * 총 매출
    - 결과는 메뉴 이름 기준 ASC 정렬

💡 리팩토링 포인트:
    - SQL 표준 호환성 확보를 위해 GROUP BY에 MENU_ID 포함하기
    - 주문 없는 메뉴 보려면? LEFT JOIN + COALESCE 사용하기
*/
SELECT
    m.MENU_NAME,
    COUNT(*) AS ORDER_COUNT,
    SUM(o.QTY) AS TOTAL_QTY,
    SUM(m.PRICE * o.QTY) AS TOTAL_SALES
FROM MENU AS m
JOIN ORDERS AS o
  ON m.MENU_ID = o.MENU_ID
GROUP BY m.MENU_NAME
ORDER BY m.MENU_NAME ASC;