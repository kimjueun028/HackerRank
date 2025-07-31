WITH Challenge_counts AS (
    SELECT C.hacker_id, H.name, COUNT(DISTINCT C.challenge_id) as challenges_created
    FROM Challenges C 
        left join Hackers H on C.hacker_id=H.hacker_id
    GROUP BY C.hacker_id, H.name)

SELECT hacker_id, name, challenges_created
FROM Challenge_counts
WHERE challenges_created not in (
    SELECT challenges_created
    FROM Challenge_counts
    GROUP BY challenges_created
    HAVING COUNT(challenges_created) >=2 
        and challenges_created != (
            SELECT MAX(challenges_created)
            FROM Challenge_counts
            )
)
ORDER BY challenges_created desc, hacker_id asc

/*
포함
- 최댓값 아닌 애들 중 1개
- 최댓값 (2개 이상 여부 상관 없음)


포함 X
- 최댓값 아닌 애들 중 2개이상

포함하지 않는 것을 조건으로 두는 편이 더 수월함.
*/