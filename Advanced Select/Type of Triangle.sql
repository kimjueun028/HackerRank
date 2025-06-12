SELECT CASE WHEN A+B<=C or B+C<=A or A+C<=B THEN 'Not A Triangle'
            WHEN A=B and B=C THEN 'Equilateral'
            WHEN A=B or B=C or A=C THEN 'Isosceles'
            ELSE 'Scalene'
        END AS CAT
FROM TRIANGLES

/*
조건에 맞는 새로운 열 생성할 경우, 
'CASE WHEN / ELSE' 구문으로 조건에 맞는 값 구하고
'END AS 변수명'으로 새로운 변수로 지정
*/