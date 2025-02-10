SELECT count(id)
FROM players
WHERE (bats='R' AND throws='L') or (bats='L' AND throws ='R')
