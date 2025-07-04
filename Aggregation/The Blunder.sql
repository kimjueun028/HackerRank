SELECT CEIL(AVG(Salary) - (SELECT AVG(REPLACE(Salary, '0','')) FROM EMPLOYEES))
FROM EMPLOYEES

/*
REPLACE 함수는 암묵적으로 숫자를 문자열로 변환해서 처리
*/