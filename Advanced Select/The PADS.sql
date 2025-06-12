SELECT concat(Name, '(', left(Occupation,1), ')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT concat('There are a total of ', count(*), ' ', lower(Occupation),'s.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY count(*), Occupation;

/*
문자열 형식으로 출력해야 한다면, concat으로 문자 합치기
*/
