/*
문제: 조건에 맞는 개발자 찾기
출처: [프로그래머스] SQL kit - SELECT
난이도: Level 2
포인트: subquery, BITWISE
날짜: 2025-11-14

리팩토링 포인트:
    1. 비트연산자... SQL에서...?
        - SKILL_CODE & X
        - SKILL_CODE가 X라는 플래그를 가지고 있나? 라는 의미
    2. WHERE 조건을 더 명확하게 쓰기
        - WHERE SKILL_CODE & (서브쿼리) 보다는
        - WHERE (SKILL_CODE & (서브쿼리)) > 0
*/

SELECT
    ID,
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (
    SELECT SUM(CODE)
    FROM SKILLCODES
    WHERE NAME IN ('Python', 'C#')
)
ORDER BY ID ASC;