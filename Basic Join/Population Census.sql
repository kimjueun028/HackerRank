SELECT SUM(a.population)
FROM CITY a LEFT JOIN COUNTRY b on a.CountryCode = b.Code
WHERE b.CONTINENT = 'Asia'