/*
📅 Date: 2025-11-18
🧩 Topic: GROUP BY + HAVING + JOIN Review
🐰 문제요약:
    - CUSTOMER와 ORDERS를 INNER JOIN하여 Silver 등급 고객 중 주문 횟수가 2회 이상인 고객만 조회한다.
    - 고객별 주문 횟수와 주문 금액 합계를 집계하고, HAVING으로 최소 주문 횟수 조건을 필터링한다.

💡 리팩토링 포인트:
    1. 오답 포인트 - GROUP BY c.CUSTOMER_ID만 한 것!
        1-1. NAME도 추가해야 함!
            - SQL에서 SELECT에서 "그룹화되지 않은 컬럼 = 집계함수로 묶이지 않은 일반 컬럼"은 GROUP BY에 포함되어야 한다
            - SQL딴에는 "CUSTOMER_ID로 그룹을 만들었는데, 같은 CUSTOMER_ID에 NAME이 여러개면 어떤 NAME을 보여줘야하지?
        1-2. MySQL은 비교적 느슨한 편이라서 ㄱㅊ한데...
            - Oracle, PostgreSQL등은 에러남...
            - MySQL은 NAME이 여러 개인데도 첫 번째 값 하나 가져다 보여준다.
    2. COUNT(o.ORDER_ID) 보다 COUNT(*)가 더 논리적
        - 동일한 결과는 나오지만, 주문 행 개수를 세는 것 = COUNT(*)가 더 자연스러움
*/

SELECT
    c.CUSTOMER_ID,
    c.NAME,
    COUNT(o.ORDER_ID) AS ORDER_COUNT,
    SUM(o.AMOUNT) AS TOTAL_AMOUNT
FROM CUSTOMER AS c
JOIN ORDERS AS o
  ON c.CUSTOMER_ID = o.CUSTOMER_ID
WHERE c.GRADE = 'Silver'
GROUP BY c.CUSTOMER_ID, c.NAME
HAVING ORDER_COUNT >= 2
ORDER BY TOTAL_AMOUNT DESC;

/* 태초의 틀린 코드! GROUP BY에 NAME도 추가하기
SELECT
    c.CUSTOMER_ID,
    c.NAME,
    COUNT(o.ORDER_ID) AS ORDER_COUNT,
    SUM(o.AMOUNT) AS TOTAL_AMOUNT
FROM CUSTOMER AS c
JOIN ORDERS AS o
  ON c.CUSTOMER_ID = o.CUSTOMER_ID
WHERE c.GRADE = 'Silver'
GROUP BY c.CUSTOMER_ID
HAVING ORDER_COUNT >= 2
ORDER BY TOTAL_AMOUNT DESC;
*/