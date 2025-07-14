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