/*
📅 Date: 2025-11-25
🧩 Topic: CASE WHEN basic 
🐰 문제1 요약 : 
    - 병원의 환자 체온(TEMP)에 따라 상태 라벨(STATUS)을 분류하시오.
    조건:
        - TEMP < 37 → '정상'
        - TEMP ≥ 37 AND TEMP < 38 → '주의'
        - TEMP ≥ 38 → '고열'
        - TEMP = NULL → 라벨 없음(NULL)
        또한 CHECK_DATE = '2025-11-11'인 환자만 조회하고,
        결과는 TEMP 오름차순으로 정렬한다.

💡 리팩토링 포인트:
    1. ORDER BY TEMP ASC -> NULL 처리 고려
        - MySQL은 ASC -> NULL이 먼저
        - MySQL은 DESC -> NULL이 마지막
        - NULL이 앞에 오는 것이 거슬릴 수 있음
        - ORDER BY TEMP IS NULL, TEMP ASC;
*/

SELECT
    NAME,
    CHECK_DATE,
    TEMP,
    CASE
        WHEN TEMP < 37 THEN '정상'
        WHEN TEMP >= 37 AND TEMP < 38 THEN '주의'
        WHEN TEMP >= 38 THEN '고열'
    END AS STATUS
FROM PATIENT_CHECK
WHERE CHECK_DATE = '2025-11-11'
ORDER BY TEMP ASC;

/*
📅 Date: 2025-11-25
🧩 Topic: CASE WHEN basic 
🐰 문제2 요약 : 
    - 도서관 대출 기록의 연체 일수(DAYS_OVERDUE)에 따라 연체 등급(OVERDUE_LEVEL)을 분류하시오.
        조건:
        - DAYS_OVERDUE ≤ 1 → '정상'
        - 2 ≤ DAYS_OVERDUE < 7 → '경미'
        - 7 ≤ DAYS_OVERDUE < 14 → '중간'
        - DAYS_OVERDUE ≥ 14 → '심각'
        결과는 USER_NAME 기준 오름차순 정렬.

💡 리팩토링 포인트:
    1. CASE WHEN 절 중간에 주석 처리!
        - 앞 조건 다시 반복하는 방식 = 중복이 많음
        - 범위 조건을 앞 조건을 이용해 축약할 수 있음
*/

SELECT
    USER_NAME,
    BOOK_TITLE,
    DAYS_OVERDUE,
    CASE
        WHEN DAYS_OVERDUE <= 1 THEN '정상'
        WHEN DAYS_OVERDUE >= 2 AND DAYS_OVERDUE < 7 THEN '경미'
        WHEN DAYS_OVERDUE >= 7 AND DAYS_OVERDUE < 14 THEN '중간'
        WHEN DAYS_OVERDUE >= 14 THEN '심각'
        -- 더 SQL 스럽게 하려면!
        -- WHEN DAYS_OVERDUE <= 1 THEN '정상'
        -- WHEN DAYS_OVERDUE < 7 THEN '경미'
        -- WHEN DAYS_OVERDUE < 14 THEN '중간'
        -- ELSE '심각'
    END AS OVERDUE_LEVEL
FROM BOOK_RENTAL
ORDER BY USER_NAME ASC;