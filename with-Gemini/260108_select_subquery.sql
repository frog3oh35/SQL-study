/*
📅 Date: 2026-01-08
🧩 Topic: SELECT Subquery
🐰 문제1 요약 :
    - 서버별 최신 장애 메시지를 ORDER BY와 LIMIT 1을 사용한 상관 서브쿼리로 추출 (1:1 매핑)
*/

SELECT
    s.SERVER_NAME,
    (SELECT
         MESSAGE
    FROM ERROR_LOGS AS l
    WHERE s.SERVER_ID = l.SERVER_ID
    ORDER BY l.CREATED_AT DESC
    LIMIT 1) AS RECENT_ERROR
FROM SERVERS AS s;


/*
📅 Date: 2026-01-08
🧩 Topic: SELECT Subquery
🐰 문제2 요약 :
    - 프로젝트별 최고 기여 멤버(MVP) 추출: SCORE 내림차순 및 M_ID 오름차순 정렬 후 LIMIT 1을 적용한 상관 서브쿼리 활용
*/

SELECT
    P_NAME,
    (SELECT
        NAME
    FROM PROJECT_MEMBERS AS m
    WHERE m.P_ID = p.P_ID
    ORDER BY SCORE DESC, M_ID ASC LIMIT 1) AS MVP
FROM PROJECTS AS p
ORDER BY P_NAME;