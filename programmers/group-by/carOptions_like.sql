/*
문제: 자동차 종류 별 옵션이 포함된 자동차 수 구하기
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 2
포인트: GROUP BY, LIKE
날짜: 2025-12-02

오답 기록:
    - OPTIONS의 컬럼 형태가 '한 칸에 여러 값이 콤마로 들어간 ★문자열★'
    - 그래서 LIKE 사용해야 함!
리팩토링 포인트:
    1. WHERE OPTIONS LIKE ... 중복 부분을
        - WHERE OPTIONS REGEXP '열선시트|가죽시트|통풍시트'
        - 한 줄로 축약가능
*/

SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%통풍시트%'
   OR OPTIONS LIKE '%열선시트%'
   OR OPTIONS LIKE '%가죽시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;


/* 오답 코드
SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE  OPTIONS = '통풍시트'
    OR OPTIONS = '열선시트'
    OR OPTIONS = '가죽시트'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;

*/