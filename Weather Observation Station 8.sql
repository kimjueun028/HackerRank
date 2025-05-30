SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) in ('a','e','i','o','u') and RIGHT(CITY,1) in ('a','e','i','o','u')