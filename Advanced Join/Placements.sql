-- i
WITH 
    ME AS (
        SELECT
            S.ID,
            S.Name,
            P.Salary
        FROM Students S 
            LEFT JOIN Packages P on S.ID = P.ID),
    FRIEND AS (
        SELECT
            F.ID,
            F.Friend_ID,
            P.Salary
        FROM Friends F
            LEFT JOIN Packages P on F.Friend_ID = P.ID),
    ME_FRIEND AS (
        SELECT
            M.Name as My_Name,
            M.Salary as My_Salary,
            F.Friend_ID as Friend_ID,
            F.Salary as Friend_Salary
        FROM ME M LEFT JOIN FRIEND F on M.ID = F.ID)

SELECT My_Name
FROM ME_FRIEND
WHERE My_Salary < Friend_Salary
ORDER BY Friend_Salary asc

--ii
SELECT S.Name
FROM Students S
JOIN Friends F ON S.ID = F.ID
JOIN Packages P1 ON S.ID = P1.ID
JOIN Packages P2 ON F.Friend_ID = P2.ID
WHERE P1.Salary < P2.Salary
ORDER BY P2.Salary;