/*
📅 Date: 2025-11-13
🧩 Topic: 서브쿼리 기초, 서브쿼리 WHERE, 서브쿼리 FROM
🐰 문제1 요약 :
    - 가장 최근(최신 날짜)에 대출된 책의 제목을 조회하기.
    - 최신 대출일은 BORROW 테이블에서 구합니다.
    - 그 대출일에 해당하는 책의 TITLE을 BOOK 테이블에서 조회해야 합니다.
    - 결과는 책 제목만 출력하면 됩니다.

💡 리팩토링 포인트:
*/


SELECT TITLE FROM BOOK
WHERE BOOK_ID = (
    SELECT BOOK_ID
    FROM BORROW
    WHERE BORROW_DATE = (SELECT MAX(BORROW_DATE) FROM BORROW)
);

/*
🐰 문제2 요약 :
    - “가장 많이 팔린 수량(QTY)보다 더 많이 팔린 적이 있는 메뉴의 이름(MENU_NAME)”을 조회하세요.
    - 조건 상세:
    - 2025년 1월 기준만 본다.
    - 그 기간 동안의 최대 판매 수량(QTY) 을 구한다.
    - 그 최대 수량보다 더 많이 판매된 기록이 단 한 번이라도 있는 메뉴를 고른다.
    - 결과는 MENU_NAME만 출력한다.
    - 정렬은 없어도 됨.

💡 리팩토링 포인트:
*/

SELECT MENU_NAME FROM CAFE_MENU
WHERE MENU_ID IN (
    SELECT MENU_ID
    FROM SALES
    WHERE QTY > (
        SELECT MAX(QTY)
        FROM SALES
        LIKE '2025-01%'
    )
);

/*
🐰 문제3 요약 : -- 오답
    - 2025년 2월 한 달 동안 의사별 진료 횟수를 구한 뒤,
    - 그 중 가장 많은 진료 횟수를 가진 의사(DOC_ID)를 찾고,
    - 해당 의사의 이름(DOC_NAME)을 DOCTOR 테이블에서 조회하는 문제.
    - GROUP BY + COUNT(*) + 서브쿼리(MAX) 조합을 이용

💦 오답 기록:
    해당 문제에서 '의사별 진료 건수'를 먼저 집계한 후 최댓값을 가진 DOC_ID를 찾아야 함.
    그런데!! FROM 서브쿼리 구조를 떠올리지 못해 풀이에 실패
    FROM 서브쿼리 사용 시 alias 필수 이유도 배워야 함

💡 리팩토링 포인트:
    - 집계 -> 다시 필터링 패턴에서 FROM 서브쿼리 필수
    - 서브쿼리를 '임시 결과 테이블'로 이해하는 사고 훈련하기...
*/

SELECT DOC_NAME
FROM DOCTOR
WHERE DOC_ID = (
    SELECT DOC_ID
    FROM (
        SELECT DOC_ID, COUNT(*) AS CNT
        FROM APPOINTMENT
        WHERE APP_DATE LINE '2025-02%'
        GROUP BY DOC_ID
        ORDER BY CNT DESC
        LIMIT 1
    ) AS t
);