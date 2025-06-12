SELECT b.Continent, FLOOR(AVG(a.Population))
FROM CITY a join COUNTRY b on a.CountryCode = b.Code
GROUP BY b.Continent

/*
LEFT JOIN : CITY에만 존재하고 COUNTRY에 없는 값도 포함될 수 있어 부정확할 수 있음
JOIN (INNER JOIN) : CITY와 COUNTRY가 정확히 매칭되는 경우만 포함됨 — 이 문제의 요구 조건에 맞음
** 항상 join하기 전에 두 테이블 관계 생각해보고 적절한 join하기
*/