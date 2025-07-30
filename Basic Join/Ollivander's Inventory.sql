/*
동일한 (power, age) 조합에서 coins_needed가 가장 적은 지팡이만 선택
즉, 예를 들어 (power=10, age=45) 조합이 여러 개 있으면, 그중에서 coins_needed가 가장 적은 한 개만 선택해야 한다는 뜻
*/

SELECT W.id, P.age, W.coins_needed, W.power
FROM Wands W 
    join Wands_Property P on W.code=P.code
    join (
            SELECT A.power, B.age, MIN(A.coins_needed) as min_coins
            FROM Wands A join Wands_Property B on A.code=B.code
            WHERE B.is_evil = 0
            GROUP BY A.power, B.age
            ) as filtered 
        on W.power = filtered.power and P.age = filtered.age and W.coins_needed = filtered.min_coins
WHERE P.is_evil = 0
ORDER BY W.power desc, P.age desc

/*
각 조합별로 MIN값만 뽑으면서 추출까지 하는건 불가능.
각 조합별로 MIN값을 뽑아서 새로 JOIN해서 한 행씩 접근하도록 해야 함.
WHERE 조건을 써야 하는 경우에 서브쿼리에도 같이 써줘야하는건 아닌지 항상 판단하기!
*/

/*
SELECT W.id, P.age, W.coins_needed, W.power
FROM (
    SELECT W.id, P.age, W.coins_needed, W.power
    FROM Wands W left join Wands_Property P on W.code=P.code
    WHERE P.is_evil = 0
    GROUP BY W.power, P.age
    HAVING MIN(W.coins_needed)
)
ORDER BY W.power desc, P.age desc

GROUP BY 해서 묶은 값 중에 id, coins_needed는 없음. 그래서 SELECT절에서 뽑을 수 없고
HAVING 절에 조건을 작성해야 하는데, 그냥 집계함수만 떡하니 써놓으면 뽑는 기준이 되지 않아서 그냥 통과될 것임.
*/