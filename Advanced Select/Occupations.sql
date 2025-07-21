SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
) AS sub
GROUP BY rn;

/*
GROUP BY를 쓰기 때문에 여러 행을 하나로 묶는 과정에서는 집계함수 필수
MAX()를 쓰는 이유: 한 그룹 안에서 값을 하나만 뽑기 위해 사용됨
의미적으로 MAX()가 다른 집계함수보다 이런 경우에 보편적이고 명확함

rn으로 그룹화하는 이유: 각 Occupation별로 이름을 정렬하고 행 번호를 매겨서, 같은 rn에 해당하는 Occupation의 이름을 하나의 행으로 묶기 위함

MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor
: Doctor에 해당하는 Name만 뽑겠다는 의미. 만약 해당하는 값이 없다면 NULL이 반환됨
*/

WITH 
    Ranked AS (
        SELECT 
            Name,
            Occupation,
            ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
        FROM OCCUPATIONS),
    Doctors AS (
        SELECT Name, rn FROM Ranked WHERE Occupation = 'Doctor'),
    Professors AS (
        SELECT Name, rn FROM Ranked WHERE Occupation = 'Professor'),
    Singers AS (
        SELECT Name, rn FROM Ranked WHERE Occupation = 'Singer'),
    Actors AS (
        SELECT Name, rn FROM Ranked WHERE Occupation = 'Actor')

SELECT 
    D.Name AS Doctor,
    P.Name AS Professor,
    S.Name AS Singer,
    A.Name AS Actor
FROM Doctors D
    FULL OUTER JOIN Professors P ON D.rn = P.rn
    FULL OUTER JOIN Singers S ON COALESCE(D.rn, P.rn) = S.rn
    FULL OUTER JOIN Actors A ON COALESCE(D.rn, P.rn, S.rn) = A.rn
ORDER BY COALESCE(D.rn, P.rn, S.rn, A.rn);

/*
1. 각 Occpution 별로 이름을 정렬하고 행 번호를 매기는 CTE Ranked를 생성 (Occupation별로 개수 맞추기 위함)
2. 각 Occupation별로 이름과 행 번호를 SELECT하는 CTE(Doctors, Professors, Singers, Actors) 생성
3. FULL OUTER JOIN을 사용하여 rn을 매칭 (각 Occupation별로 개수가 다르므로 FULL OUTER JOIN 사용)
4. COALESCE를 사용하여 NULL 값을 처리하고, 최종 결과를 반환

WITH ~ AS : ~라는 이름의 CTE를 생성
ROW_NUMBER() OVER ~ : ~에 따라 행 번호를 매김(고유한 일련번호)
PARTITION BY ~ : ~에 따라 그룹별로 나눈 다음, 각 그룹 안에서 순번을 매기거나 합계를 계산 등
COALESCE(~) : ~ 중 NULL이 아닌 첫 번째 값을 반환
*/
