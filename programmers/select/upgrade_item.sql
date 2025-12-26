/*
문제: 업그레이드 된 아이템 구하기
출처: [프로그래머스] SQL kit - SELECT
난이도: Level 2
포인트: JOIN, WHERE Subquery
날짜: 2025-12-26

💡 리팩토링 포인트:
    1. SELF JOIN으로도 풀어보기!
*/

SELECT
    i.ITEM_ID,
    i.ITEM_NAME,
    i.RARITY
FROM ITEM_INFO AS i
JOIN ITEM_TREE AS t
  ON i.ITEM_ID = t.ITEM_ID
WHERE t.PARENT_ITEM_ID IN (
    SELECT ITEM_ID
    FROM ITEM_INFO
    WHERE RARITY = 'RARE'
    )
ORDER BY ITEM_ID DESC;