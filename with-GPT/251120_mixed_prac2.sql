/*
📅 Date: 2025-11-20
🧩 Topic: 쿼리 종합 연습 (기본 쿼리 + 서브쿼리)
🐰 문제 요약:
    - 최신 출판 연도(서브쿼리로 찾음)에 해당하는 책 3개 조회

💡 리팩토링 포인트:

*/

SELECT
    BOOK_ID,
    TITLE,
    AUTHOR,
    GENRE,
    PUBLISHED_YEAR,
    PAGE_COUNT
FROM BOOK
WHERE PUBLISHED_YEAR IN (
    SELECT MAX(PUBLISHED_YEAR) FROM BOOK
)
ORDER BY
    PAGE_COUNT DESC,
    BOOK_ID ASC
    LIMIT 3;