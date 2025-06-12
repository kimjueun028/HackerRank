SELECT a.Name
FROM CITY a left join COUNTRY b on a.CountryCode = b.Code
WHERE b.CONTINENT = 'Africa'

/*
From절에 join 쓰기
*/