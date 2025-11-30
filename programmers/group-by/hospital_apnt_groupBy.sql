/*
문제: 성분으로 구분한 아이스크림 총 주문량
출처: [프로그래머스] SQL kit - GROUP BY
난이도: Level 2
포인트: JOIN, GROUP BY
날짜: 2025-11-30

💦 오답 기록:
    - ORDER BY에서 "alias"를 해서 오답...;
        - MySQL, MariaDB의 ORDER BY에서 "한글" 사용 X
        - SELECT에서 "한글"은 식별자 취급
        - ORDER/GROUP BY, HAVING에서 "한글"은 문자열로 취급
    - 표준/실무 DBMS 별 SELECT "한글별칭" = O
    - 표준/실무 DBMS 별 ORDER BY, GROUP BY, HAVING 에서
        - MySQL, MariaDB: "한글" X, 무조건 `한글`
        - 타 DBMS: "한글" O
💡 리팩토링 포인트:
*/

SELECT
    MCDP_CD AS "진료과코드",
    COUNT(*) AS "5월예약건수"
FROM APPOINTMENT
WHERE APNT_YMD >= '2022-05-01'
  AND APNT_YMD < '2022-06-01'
GROUP BY MCDP_CD
ORDER BY `5월예약건수` ASC, MCDP_CD ASC;


/* 오답 코드
SELECT
    MCDP_CD AS "진료과코드",
    COUNT(*) AS "5월예약건수"
FROM APPOINTMENT
WHERE APNT_YMD >= '2022-05-01'
  AND APNT_YMD < '2022-06-01'
GROUP BY MCDP_CD
ORDER BY "5월예약건수" ASC, MCDP_CD ASC;

*/