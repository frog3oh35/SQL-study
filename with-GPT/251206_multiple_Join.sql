/*
📅 Date: 2025-12-06
🧩 Topic: Multi INNER JOIN (3 tables)
🐰 문제 요약 :
    -  PASSENGER - BOOKING - FLIGHT 연결
    - 조건: TIER(Gold/Platinum), SEAT_CLASS=Business, ORIGIN=Seoul
    - 출력: Passenger name / tier / seat / destination / dept time
    - 정렬: DEPT_TIME ASC, NAME ASC
    - No subquery allowed
    
💡 리팩토링 포인트:
    1. WHERE 절의 순서: 선택도가 높은 조건 우선 배치
        - 가장 좁히는 조건부터 / 테이블 고유 조건 / 날짜-정렬 조건 순으로 WHERE 조건 배치 나누면 좋음
*/

SELECT
    p.NAME AS PASSENGER_NAME,
    p.TIER AS TIER,
    b.SEAT_CLASS AS SEAT_CLASS,
    f.DESTINATION AS DESTINATION,
    f.DEPT_TIME AS DEPT_TIME
FROM PASSENGER AS p
INNER JOIN BOOKING AS b
        ON p.P_ID = b.P_ID
INNER JOIN FLIGHT AS f
        ON b.FLIGHT_ID = f.FLIGHT_ID
WHERE p.TIER IN ('Gold', 'Platinum')
  AND b.SEAT_CLASS = 'Business'        
  AND f.ORIGIN = 'Seoul'
ORDER BY DEPT_TIME, PASSENGER_NAME;