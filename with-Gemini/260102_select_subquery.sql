/*
📅 Date: 2026-01-02
🧩 Topic: SELECT Subquery
🐰 문제 요약 :
    - 회원별 닉네임과 그들이 구매한 상품 중 최고가(MAX_PRICE) 조회
    - JOIN 없이 SELECT 절 스칼라 서브쿼리로 구현 (상관 서브쿼리 활용)
    - 포인트: WHERE절로 특정 회원을 특정했으므로 서브쿼리 내 불필요한 GROUP BY는 생략
*/

SELECT
    USER_ID,
    NICKNAME,
    (SELECT MAX(PRICE)
    FROM PRODUCT_ORDERS AS o
    WHERE o.USER_ID = p.USER_ID) AS MAX_PRICE
FROM USER_PROFILE AS p
ORDER BY USER_ID DESC;