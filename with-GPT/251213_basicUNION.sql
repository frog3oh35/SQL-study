/*
📅 Date: 2025-12-13
🧩 Topic: basic UNION
🐰 문제1 요약 :
    - 두 테이블의 동일한 구조 데이터를 합쳐 하나의 목록으로 조회한다

*/

SELECT
    EMP_ID, NAME, DEPT
FROM EMPLOYEE
UNION ALL
SELECT
    EMP_ID, NAME, DEPT
FROM CONTRACTOR
ORDER BY EMP_ID ASC;


/*
📅 Date: 2025-12-13
🧩 Topic: basic UNION
🐰 문제2 요약 :
    - 서로 다른 두 판매 채널의 주문 데이터를 하나로 합치되, 일부 컬럼이 없는 경우 NULL을 맞춰 통합 조회한다.

💡 리팩토링 포인트:
*/

SELECT
    ORDER_ID,
    USER_ID,
    PRODUCT_ID,
    QUANTITY,
    ORDER_DATE
FROM ONLINE_ORDER
UNION ALL
SELECT
    ORDER_ID,
    NULL AS USER_ID,
    PRODUCT_ID,
    QUANTITY,
    ORDER_DATE
FROM OFFLINE_ORDER
ORDER BY ORDER_DATE ASC, ORDER_ID ASC;