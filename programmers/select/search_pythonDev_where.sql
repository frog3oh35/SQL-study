/*
-- 문제: Python 개발자 찾기
-- 출처: [프로그래머스] SQL kit - SELECT
-- 난이도: Level 1
-- 포인트: WHERE
-- 날짜: 2025-11-14

-- 리팩토링 포인트:
-- OR 반복 줄이기
--  - OR를 많이 쓸 수록 가독성이 떨어짐
--  - WHERE 'Python' IN (col1, col2, col3)
--  - 이런식으로 쓰기!
-- 공백/NULL 대비해서 COALESCE 처리도 괜찮음
    - WHERE 'Python' IN (
        COALESCE(col1, ''),
        COALESCE(col2, ''),,,
    ) 이런식으로...
*/


SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPER_INFOS
WHERE SKILL_1 = 'Python' OR SKILL_2 = 'Python' OR SKILL_3 = 'Python'
ORDER BY ID ASC;