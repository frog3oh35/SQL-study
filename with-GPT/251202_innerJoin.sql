/*
📅 Date: 2025-12-02
🧩 Topic: INNER JOIN 
🐰 문제 요약 :
    - 학생-수강신청-강의 테이블을 INNER JOIN으로 연결
    - 조건: OS 강의 + 교수 Kim + 전공 Computer Science
    - 출력: 학생명/전공/강의명/교수
-    No subquery allowed
    
💦 오답 기록:
    - WHERE 에서 alias 못쓴다!! 
💡 리팩토링 포인트:
*/

SELECT
    s.NAME AS STUDENT_NAME,
    s.MAJOR AS MAJOR,
    c.TITLE AS COURSE_TITLE,
    c.PROFESSOR AS PROFESSOR
FROM STUDENT AS s
INNER JOIN ENROLL AS e
        ON s.STUDENT_ID = e.STUDENT_ID
INNER JOIN COURSE AS c
        ON e.COURSE_ID = c.COURSE_ID
WHERE s.MAJOR = 'Computer Science'        
  AND c.TITLE = 'Operating System'
  AND c.PROFESSOR = 'Kim';