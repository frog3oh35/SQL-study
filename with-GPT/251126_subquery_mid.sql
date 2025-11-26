/*
📅 Date: 2025-11-26
🧩 Topic: 서브쿼리 WHERE 만으로 어렵게!
🐰 문제 요약 :
    - 현재 포화상태(capacity 초과)인 보호소의 동물 중
    - 아직 입양되지 않은(N) 동물만 조회한다.
    - 또한 "전체 도시 중 capacity 최대값을 가진 도시"에 속한 보호소만 포함.
    출력: ANIMAL_NAME, SPECIES, AGE, SHELTER_ID
    
💦 오답 기록:
*/

SELECT
    ANIMAL_NAME,
    SPECIES,
    AGE,
    SHELTER_ID
FROM ANIMAL
WHERE
    SHELTER_ID IN (
        -- 1) 포화 상태 보호소: 현재 동물 수 > CAPACITY
        SELECT
            SHELTER_ID
        FROM ANIMAL
        GROUP BY SHELTER_ID
        HAVING COUNT(*) > (
            SELECT CAPACITY
            FROM SHELTER
            WHERE SHELTER.SHELTER_ID = ANIMAL.SHELTER_ID
        )
    -- HAVING에서 서브쿼리 연습하기.ㅠㅠ
    )
    AND SHELTER_ID IN (
        -- 2) CAPACITY가 전체에서 가장 큰 도시의 보호소들
        SELECT
            SHELTER_ID
        FROM SHELTER
        WHERE CITY = (
            SELECT CITY
            FROM SHELTER_ID
            ORDER BY CAPACITY DESC
            LIMIT 1
        )
    )
    AND ADOPTED = 'N'
ORDER BY AGE DESC, ANIMAL_NAME ASC;