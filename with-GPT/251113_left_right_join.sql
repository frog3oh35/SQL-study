/*
📅 Date: 2025-11-13
🧩 Topic: LEFT JOIN 기초
🐰 문제 요약 :
    - ANIMAL 테이블을 기준으로 모든 동물의 이름과 담당 사육사의 이름을 조회하는 문제
    - 사육사가 없는 경우도 있음 (LEFT JOIN)

💡 리팩토링 포인트:
    1. SELECT 절에서 IFNULL 사용하지 않아도 괜찮음...
    2. LEFT / RIGHT JOIN 구분
        - LEFT JOIN -> 오른쪽이 NULL
        - RIGHT JOIN -> 왼쪽이 NULL
*/
SELECT 
    a.ANIMAL_NAME,
    IFNULL(k.KEEPER_NAME, 'NULL')
    -- 'NULL'이 아닌, 진짜 NULL을 유지하기
    -- IFNULL을 굳이 사용하지 않고 k.KEEPER_NAME 그대로 사용하기
FROM ANIMAL AS a
LEFT JOIN ZOO_KEEPER AS k
       ON a.KEEPER_ID = k.KEEPER_ID
ORDER BY a.ANIMAL_NAME ASC;