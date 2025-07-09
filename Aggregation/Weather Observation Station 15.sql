SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

/*
1번째 경우: WHERE 절에서 서브쿼리를 사용하여 조건에 해당하는 LAT_N의 최대값을 찾고 -> 외부쿼리에서 해당 LAT_N의 LONG_W 값을 반환

2번째 경우: 서브쿼리 없이 WHERE 절에서 직접 조건을 적용하고, ORDER BY 절로 LAT_N을 내림차순 정렬한 후 LIMIT 1로 가장 첫 번째 값을 반환

https://jueuniiiju.tistory.com/49
*/