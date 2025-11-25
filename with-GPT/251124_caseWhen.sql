/*
📅 Date: 2025-11-24
🧩 Topic: CASE WHEN basic 
🐰 문제1 요약 : 
    - 동물원 동물들의 몸무게(WEIGHT)에 따라 '소형', '중형', '대형'으로 등급을 분류하는 SIZE_LABEL 컬럼을 생성하시오.
        - 10kg 미만 → '소형'
        - 10kg 이상 ~ 100kg 미만 → '중형'
        - 100kg 이상 → '대형'
💦 오답 기록:
💡 리팩토링 포인트:
*/

SELECT
    ANIMAL_NAME,
    SPECIES,
    WEIGHT,
    CASE
        WHEN WEIGHT < 10 THEN '소형'
        WHEN WEIGHT >= 10 AND WEIGHT < 100 THEN '중형'
        WHEN WEIGHT >= 100 THEN '대형'
    END AS SIZE_LABEL
FROM ANIMAL_INFO;


/*
📅 Date: 2025-11-24
🧩 Topic: CASE WHEN basic 
🐰 문제2 요약 : 
    - 게임 아이템의 공격력(POWER)에 따라 희귀도(RARITY)를 분류하는 컬럼을 생성하시오. ELSE는 사용하지 않는다.
        - 20 미만 → '일반'
        - 20 이상 ~ 50 미만 → '희귀'
        - 50 이상은 라벨 없음(NULL)
💦 오답 기록:
💡 리팩토링 포인트:
*/

SELECT 
    ITEM_NAME,
    PRICE,
    POWER,
    CASE
        WHEN POWER < 20 THEN '일반'
        WHEN POWER >= 20 AND POWER < 50 THEN '희귀'
    END AS RARITY
FROM GAME_ITEM;