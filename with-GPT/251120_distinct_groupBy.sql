/*
📅 Date: 2025-11-20
🧩 Topic: DISTINCT + GROUP BY
🐰 문제 요약 :
    - ITEM_TYPE(아이템 종류)별로 다음 정보를 조회하기
        -해당 종류의 전체 거래 횟수
        -해당 종류에서 서로 다른 아이템이 몇 종류나 거래되었는지 (DISTINCT 사용)
        -해당 종류의 평균 거래가격

💦 오답 기록:
💡 리팩토링 포인트:
*/

SELECT
    ITEM_TYPE,
    COUNT(TRADE_ID) AS TRADE_COUNT,
    COUNT(DISTINCT ITEM_NAME) AS ITEM_VARIETY,
    AVG(PRICE) AS AVG_PRICE
FROM ITEM_TRADE
GROUP BY ITEM_TYPE
ORDER BY
    TRADE_COUNT DESC,
    ITEM_TYPE ASC;