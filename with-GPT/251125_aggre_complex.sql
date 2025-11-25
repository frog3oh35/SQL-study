/*
📅 Date: 2025-11-25
🧩 Topic: DISTINCT + 집계 복합
🐰 문제1 요약 : 
    - 게임 전투 로그(MONSTER_LOG)에서 몬스터 종류별로
    1) 해당 몬스터를 공격한 '서로 다른 플레이어 수'
    2) 해당 몬스터가 받은 피해량 총합을 구한다.
    결과는 총 피해량 기준 내림차순.
*/

SELECT
    MONSTER_TYPE,
    COUNT(DISTINCT PLAYER_ID) AS UNIQUE_PLAYER_COUNT,
    SUM(DAMAGE) AS TOTAL_DAMAGE
FROM MONSTER_LOG
GROUP BY MONSTER_TYPE
ORDER BY TOTAL_DAMAGE DESC;


/*
📅 Date: 2025-11-25
🧩 Topic: DISTINCT + 집계 복합
🐰 문제2 요약 : 
    - 병원 방문 기록(HOSPITAL_VISIT)에서 환자별로
    1) 방문한 날짜 기준 '서로 다른 일수'
    2) 모든 방문의 진료비 합계를 구한다.
    결과는 PATIENT_ID 오름차순.
*/

SELECT
    PATIENT_ID,
    COUNT(DISTINCT VISIT_DATE) AS UNIQUE_VISIT_DAYS,
    SUM(COST) AS TOTAL_COST
FROM HOSPITAL_VISIT 
GROUP BY PATIENT_ID
ORDER BY PATIENT_ID ASC;
