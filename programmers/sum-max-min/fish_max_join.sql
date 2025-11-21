/*
문제: 물고기 종류 별 대어 찾기
출처: [프로그래머스] SQL kit - SUM, MAX, MIN
난이도: Level 3
포인트: Aggregate Function, 서브쿼리, SELF JOIN, 다중 JOIN
날짜: 2025-11-21

💦 오답 기록:
    (오답 코드 하단에 있음)
    - 처음에 JOIN을 두 번 해야하는 지 몰라서 버벅였다... 그리고 JOIN + 서브쿼리 조합도 처음해보느라 삽질을 꽤 했다.ㅠㅠ
    - Self Join이랑 다중 JOIN 연습 들어가야겠다...
💡 리팩토링 포인트:
    1. alias 이름을 더 의미있게!
        - 문제 푸느라 너무 대충 지었다.
    2. SELECT는 원본 테이블 기준으로 prefix 붙이기
*/

SELECT
    f.ID,
    n.FISH_NAME,
    f.LENGTH
FROM FISH_INFO as f
JOIN (
    SELECT
        FISH_TYPE,
        MAX(LENGTH) AS MAX_LEN
    FROM FISH_INFO
    GROUP BY FISH_TYPE
) ff
  ON f.FISH_TYPE = ff.FISH_TYPE
  AND f.LENGTH = ff.MAX_LEN
JOIN FISH_NAME_INFO as n
  ON f.FISH_TYPE = n.FISH_TYPE
ORDER BY ID ASC;

/* 태초의 오답 코드
SELECT
    ID,
    FISH_NAME,
    LENGTH
FROM FISH_INFO as f
JOIN (
    SELECT
        FISH_TYPE,
        MAX(LENGTH) AS MAX_LEN
    FROM FISH_INFO
    GROUP BY FISH_TYPE
) ff
  ON f.FISH_TYPE = ff.FISH_TYPE
  AND f.LENGTH = ff.MAX_LEN
ORDER BY ID ASC;

*/