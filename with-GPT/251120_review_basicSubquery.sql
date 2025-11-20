/*
📅 Date: 2025-11-20
🧩 Topic: 서브쿼리 기초 연습 1
🐰 문제1 요약 :
    -가장 나이가 많은 동물을 서브쿼리로 찾아 해당 종(species)의 모든 동물 정보를 조회하는 문제. WHERE 절의 단일 서브쿼리 연습용.

💦 오답 기록:
    (쿼리 다음에 오답 코드 주석처리 되어있음)
    1. SPECIES = MAX(AGE) / 즉 (문자열) = (숫자) 비교
        -절대로 일치할 수 없어서 항상 0건 반환. 논리 오류!
    2. 문제는 SPECIES 를 찾아야하는데 비교 기준을 AGE로 함
        - SPECIES를 찾아오는 단계가 빠져있음
💡 리팩토링 포인트:
    1. 만약 가장 나이가 많은 동물이 여러 종일 때 현재 구조는 에러가 난다! (서브쿼리가 여러 행을 반환, 지금 구조는 단일 종일 때만 쿼리 성립)
        - WHERE SPECIES = (서브쿼리) 는 단일값만 비교 가능함
            - (1) WHERE SPECIES IN (서브쿼리) 를 사용하면 된다!
            - (2) 또는 JOIN을 활용하는 방법도 있음
*/

SELECT 
    ANIMAL_ID,
    NAME,
    SPECIES,
    AGE
FROM ZOO_ANIMAL
WHERE SPECIES = (
    SELECT
        SPECIES
    FROM ZOO_ANIMAL
    WHERE AGE = (
        SELECT MAX(AGE)
        FROM ZOO_ANIMAL
    )
)
ORDER BY ANIMAL_ID ASC;



/* 태초의 오답 코드
SELECT
    ANIMAL_ID, NAME, SPECIES, AGE
FROM ZOO_ANIMAL
WHERE
    SPECIES = (
        SELECT MAX(AGE)
        FROM ZOO_ANIMAL
    )
ORDER BY ANIMAL_ID ASC;
*/


/*
📅 Date: 2025-11-20
🧩 Topic: 서브쿼리 기초 연습 2
🐰 문제 요약 :
    - 가장 진료비가 비싼 환자가 방문한 진료과(department)를 서브쿼리로 찾고, 그 진료과의 모든 환자 정보를 조회하는 문제. WHERE 서브쿼리 + 단일 값 비교 패턴 유지
    
💡 리팩토링 포인트:
*/

SELECT
    PATIENT_ID,
    NAME,
    DEPARTMENT,
    COST
FROM HOSPITAL_PATIENT
WHERE DEPARTMENT IN (
    SELECT
        DEPARTMENT
    FROM HOSPITAL_PATIENT  
    WHERE COST IN (
        SELECT MAX(COST)
        FROM HOSPITAL_PATIENT
    )
)
ORDER BY PATIENT_ID ASC;