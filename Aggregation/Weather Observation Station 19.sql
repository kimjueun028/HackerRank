SELECT ROUND(SQRT(POW((MIN(LAT_N)-MAX(LAT_N)),2)+POW((MIN(LONG_W)-MAX(LONG_W)),2)),4)
FROM STATION

/*
SQL에서의 문법:
제곱 : POW(x, y) - x의 y제곱을 계산
제곱근 : SQRT(x) - x의 제곱근을 계산
*/