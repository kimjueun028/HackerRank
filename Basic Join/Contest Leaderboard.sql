SELECT s.hacker_id, h.name, SUM(max_score) AS total_score
FROM (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) AS s
JOIN Hackers h ON s.hacker_id = h.hacker_id
GROUP BY s.hacker_id, h.name
HAVING SUM(max_score) > 0
ORDER BY total_score DESC, s.hacker_id;

/*
FROM절에서 서브쿼리를 사용하여 각 해커의 챌린지별 최고 점수를 구하고, 그 결과를 Hackers 테이블과 조인합니다.
그 후, 해커별로 최고 점수를 합산하여 총 점수를 계산합니다.

여기서 주의할 점
1. 서브쿼리에서 어떤 컬럼을 내보내야 하는지 고민하기. join할 때 필요한 컬럼을 모두 내보내야 함
2. SELECT절에 있는 컬럼은 GROUP BY에 포함하거나 집계 함수로 묶여야 함
*/