/*
문제: 동명 동물 수 찾기
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 2
포인트: GROUP BY
날짜: 2025-12-06
DBMS: MySQL

💡 리팩토링 포인트:
    1. GROUP BY를 이미 사용하고 있기 때문에 DISTINCT 불필요
    2. COUNT >=2 를 COUNT(*) >= 2로 명시 추천
        - MySQL의 경우 alias 사용 가능이지만 일부 DBMS에서는 alias를 HAVING에서 사용 불가능한 경우가 있음
*/

SELECT
    DISTINCT(NAME) AS NAME,
    COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME
HAVING COUNT >= 2
ORDER BY NAME ASC;