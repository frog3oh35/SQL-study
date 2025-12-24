/*
📅 Date: 2025-12-24
🧩 Topic: SELECT Subquery
🐰 문제1 요약 :
    - 스칼라 서브쿼리(상관 서브쿼리)를 사용하여 해결하세요.
    - 메인 테이블과 서브쿼리 테이블의 별칭(Alias)을 반드시 다르게 설정하세요.
    - 결과는 카테고리별로 모아서 보고 싶으니 CATEGORY 기준으로 오름차순 정렬해 주세요.
*/

SELECT
	NAME,
	CATEGORY,
	STOCK,
	(SELECT
		AVG(STOCK)
	FROM CLOTHES AS c2
	WHERE c2.CATEGORY = c1.CATEGORY) AS AVG_STOCK_BY_CAT
FROM CLOTHES AS c1
ORDER BY CATEGORY;


/*
📅 Date: 2025-12-24
🧩 Topic: SELECT Subquery
🐰 문제2 요약 :
    - 모든 책의 TITLE과 PUBLISHED_YEAR를 조회하세요.
    - 그리고 세 번째 컬럼으로, 해당 작가(AUTHOR_ID)가 쓴 책들 중 가장 처음(최소 연도)으로 출판한 연도를 DEBUT_YEAR라는 이름으로 옆에 붙여주세요.
*/

SELECT
    TITLE,
    PUBLISHED_YEAR,
    (SELECT
         MIN(PUBLISHED_YEAR)
     FROM BOOKS AS b2
     WHERE b2.AUTHOR_ID = b1.AUTHOR_ID
    ) AS DEBUT_YEAR
FROM BOOKS AS b1
ORDER BY AUTHOR_ID;