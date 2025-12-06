/*
문제: 고양이와 개는 몇 마리 있을까
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 2
포인트: GROUP BY
날짜: 2025-12-06
DBMS: MySQL

💡 리팩토링 포인트:
    1. REGEXP 대신 IN 사용하기
        - 권장 답안: WHERE ANIMAL_TYPE IN ('Cat', 'Dog')
        - REGEXP는 부분 일치를 기준으로 함
            - 정확히 값 비교를 하기에는 부적절
        - DBMS별로 정규식을 사용하지 않는 경우가 있음
            - 문제 풀이는 MySQL 기준이라서 정답처리 O
    2. ORDER BY에서 Cat -> Dog을 못 박고 싶을때
        - ORDER BY FILED(ANIMAL_TYPE, 'Cat', 'Dog') 사용하기
*/

SELECT
    ANIMAL_TYPE,
    COUNT(*) AS count
FROM ANIMAL_INS
WHERE ANIMAL_TYPE REGEXP 'Cat|Dog'
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE ASC;