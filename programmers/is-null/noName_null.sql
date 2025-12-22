/*
문제: NULL 처리하기
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 2
포인트: NULL handling
날짜: 2025-12-22

💡 리팩토링 포인트:
    1. COALESCE 활용 방법
        - COALESCE(NAME, 'No name') AS NAME ...
    2. CASE WHEN 활용 방법
        - CASE WHEN NAME IS NULL THEN 'No name' ELSE NAME ...
*/

SELECT
    ANIMAL_TYPE,
    IFNULL(NAME, 'No name') AS NAME,
    SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;