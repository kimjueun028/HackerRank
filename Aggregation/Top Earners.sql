/*
i) 해커랭크 버전 때문에 CTE 실패
*/
WITH
    TOTAL AS (SELECT 
                    employee_id,
                    name,
                    (months*salary) as total_salary
                FROM Employee)

SELECT MAX(total_salary), COUNT(*)
FROM TOTAL
WHERE total_salary = (SELECT MAX(total_salary) FROM TOTAL)

/*
WHERE절은 행 단위로 작동하기 때문에 집계 함수를 직접 사용할 수 없음
-> 서브쿼리로 바꿔야 함
*/


/*
ii) 정답
*/
SELECT MAX(months*salary), COUNT(*)
FROM Employee
WHERE months*salary = (SELECT MAX(months*salary) FROM Employee)