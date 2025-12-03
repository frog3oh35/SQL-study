/*
문제: 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 3
포인트: JOIN, GROUP BY
날짜: 2025-12-03

💦 오답 기록:
    - EXISTS 공부이후 한 번 더 풀어보기!!
💡 리팩토링 포인트:
*/

SELECT
    CAR_ID,
    CASE
        WHEN SUM(
            CASE
                WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN 1 ELSE 0
            END
        ) > 0 THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;