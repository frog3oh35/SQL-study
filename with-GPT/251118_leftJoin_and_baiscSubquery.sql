/*
📅 Date: 2025-11-18
🧩 Topic: LEFT JOIN 연습
🐰 문제1 요약:
    - USER_PROFILE, 모든 사용자 기준으로 LEFT JOIN하여 각 사용자별 로그인 횟수를 COUNT로 집계한다.
    - 로그인 기록이 없는 사용자 필터링.

💡 리팩토링 포인트:
    1. 여기에서도 COUNT(l.LOG_ID) -> COUNT(*) 
        - 어쨌든 row 개수만 세는거니까!
        - COUNT(col)하면 그 컬럼이 NULL이 아닌것만 셈..;; 그래서 구분해서 공부하기로 했다 
            - COUNT(*) : 장부에 찍힌 줄 개수 세기
            - COUNT(col) : 장부의 특정 칸이 비어있지 않은 줄만 세는 거!
        
    2. 
*/

SELECT
    p.USER_ID,
    p.NAME,
    COUNT(*) AS LOGIN_COUNT
FROM USER_PROFILE AS p
LEFT JOIN USER_LOGIN AS l
  ON p.USER_ID = l.USER_ID
GROUP BY p.USER_ID, p.NAME
HAVING LOGIN_COUNT = 0
ORDER BY p.USER_ID ASC;

/* 태초의 오답 코드! : LEFT JOIN 안하고 JOIN 해서 LOGIN 기록 없는 사람 (NULL) 날려 버림;;;

SELECT
    p.USER_ID,
    p.NAME,
    COUNT(l.LOG_ID) AS LOGIN_COUNT
FROM USER_PROFILE AS p
LEFT JOIN USER_LOGIN AS l
  ON p.USER_ID = l.USER_ID
GROUP BY p.USER_ID, p.NAME
HAVING LOGIN_COUNT = 0
ORDER BY p.USER_ID ASC;

*/



/*
📅 Date: 2025-11-18
🧩 Topic: Subquery 기초 복습
🐰 문제요약:
    - PRODUCT 테이블에서 최고가격을 서브쿼리로 구한 뒤 해당 상품을 주문한 ORDER_ITEM 레코드를 조회
*/

SELECT
    ORDER_ID,
    PRODUCT_ID,
    QTY
FROM ORDER_ITEM
WHERE PRODUCT_ID = (
    SELECT
        PRODUCT_ID,
    FROM PRODUCT
    -- 여기 이하를 구현을 못했음.ㅠㅠ
    WHERE PRICE = (
        SELECT MAX(PRICE)
        FROM PRODUCT
    )
)
ORDER BY ORDER_ID;