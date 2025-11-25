/*
📅 Date: 2025-11-25
🧩 Topic: Phase 1 복합 실습 + COALESCE (NULL 처리)
🐰 문제 요약 :
    - 영화관 회원(MOVIE_CUSTOMER)과 결제 내역(MOVIE_PAYMENT)을 JOIN하여,
    2025-11-11 날짜에 회원별로 실제 지불한 금액을 집계하시오.
    할인 금액(DISCOUNT)이 NULL인 경우에는 0원으로 간주해야 하며,
    이때 NULL 처리에는 COALESCE를 사용한다.
    회원별로 결제 건수(PAYMENT_COUNT)와 실제 지불 총액(TOTAL_PAID)을 구하고,
    결과는 TOTAL_PAID 기준 내림차순으로 정렬한다.

💦 오답 기록:
💡 리팩토링 포인트:
    1. 비집계 컬럼 제발제발 포함 시키기!!!
        - 처음에 GROUP BY c.CUSTOMER_ID만 씀
    2. LEFT JOIN을 쓸지 고민해 볼 수 있는 패턴
        - 그날 결제가 없었던 회원도 보고 싶다인 경우
            - LEFT JOIN MOVIE_PAYMENT p ON ... AND p.PAY_DATE = '2025-11-11'
            - WHERE 에서 p.PAY_DATE를 빼는 등의 처리방법
*/

SELECT
    c.NAME,
    c.GRADE,
    COUNT(p.PAYMENT_ID) AS PAYMENT_COUNT,
    SUM(p.TICKET_PRICE - COALESCE(p.DISCOUNT, 0)) AS TOTAL_PAID
FROM MOVIE_CUSTOMER AS c
JOIN MOVIE_PAYMENT AS p
  ON c.CUSTOMER_ID = p.CUSTOMER_ID
WHERE p.PAY_DATE = '2025-11-11'
GROUP BY p.CUSTOMER_ID, c.NAME, c.GRADE
ORDER BY TOTAL_PAID DESC;