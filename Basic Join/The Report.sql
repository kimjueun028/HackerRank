SELECT CASE
        WHEN G.grade < 8 THEN 'NULL'
        ELSE S.name
        END AS name,
        G.grade,
        S.marks
FROM Students S left join Grades g on S.marks between G.Min_Mark and G.Max_Mark
ORDER BY G.grade desc,
        CASE WHEN G.grade < 8 THEN S.marks END ASC,
        CASE WHEN G.grade >= 8 THEN S.name END ASC


/*
문제에서 조건에 따라 처리해야 하는 경우가 두 가지임. 따라서 SELECT절과 ORDER BY절 모두 CASE로 나눠서 접근해야함.
1. 출력 조건 : grade >= 8 -> 이름, grade < 8 -> NULL
2. 정렬 조건 : grade desc는 공통 / grade >= 8 -> 이름 asc, grade < 8 -> 점수 asc

WHERE절에서 CASE WHEN 쓰지 않은 이유 : 이름을 보여줄지 말지 '출력'에 대한 조건이지 필터링을 할 목적이 아님.

CASE는 조건과 일치할때 값을 반환하는 문법. 출력 데이터 타입이 같아야 안전하니까 CASE문 따로 작성
*/