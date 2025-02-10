SELECT first_name,last_name
FROM players
WHERE height >= (SELECT avg(height) FROM players) 
ORDER BY height DESC ,first_name ASC,last_name
