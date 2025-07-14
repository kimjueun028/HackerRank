SELECT
    C.company_code, 
    C.founder, 
    COUNT(DISTINCT(L.lead_manager_code)),
    COUNT(DISTINCT(S.senior_manager_code)),
    COUNT(DISTINCT(M.manager_code)),
    COUNT(DISTINCT(E.employee_code))
FROM Company C 
LEFT JOIN Lead_Manager L on C.company_code = L.company_code
LEFT JOIN Senior_Manager S on C.company_code = S.company_code
LEFT JOIN Manager M on C.company_code = M.company_code
LEFT JOIN Employee E on C.company_code = E.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code

/*
DISTINCT : 고유한 값을 반환
SELECT절에 있는 컬럼은 GROUP BY에 포함하거나 집계 함수로 묶여야 함 -- C.founder
*/