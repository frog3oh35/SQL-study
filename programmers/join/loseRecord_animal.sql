/*
문제: 없어진 기록 찾기
출처: [프로그래머스] SQL kit - JOIN
난이도: Level 3
포인트: LEFT JOIN, NULL 처리
날짜: 2025-12-17

리팩토링 포인트: -
*/

SELECT
    o.ANIMAL_ID,
    o.NAME
FROM ANIMAL_OUTS AS o
LEFT JOIN ANIMAL_INS AS i
       ON o.ANIMAL_ID = i.ANIMAL_ID
WHERE i.ANIMAL_ID IS NULL
ORDER BY o.ANIMAL_ID;