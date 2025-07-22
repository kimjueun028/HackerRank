SELECT h.hacker_id, h.name
FROM Submissions s
    left join Hackers h on s.hacker_id = h.hacker_id
    left join Challenges c on s.challenge_id = c.challenge_id
    left join Difficulty d on c.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(c.challenge_id) >=2
ORDER BY COUNT(c.challenge_id) desc, h.hacker_id

/*
SQL 작동 순서
: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

행 단위 조건 = WHERE절로
집계 함수 조건 = HAVING절로
*/