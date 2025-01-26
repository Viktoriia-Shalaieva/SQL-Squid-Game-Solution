/*
LEVEL 1
The organizers want to identify vulnerable living players who might be easily manipulated for the next game. Find all players who are alive, in severe debt (debt > 400,000,000 won), and are either elderly (age > 65) OR have a vice of Gambling with no family connections.

Show us how you handle our data, and remember – in this game, there's no room for error.

https://datalemur.com/sql-game/level1.html
*/

SELECT *
FROM player
WHERE 
	status = 'alive'
    AND debt > 400000000
    AND (
        age > 65
        OR (vice = 'Gambling' AND has_close_family = FALSE)
      );

/*
LEVEL 2
The organizers need to calculate how many food portions to withhold to create the right amount of tension. In a table, calculate how many rations would feed 90% of the remaining(alive) non-insider players (rounded down), and in another column, indicate if the current rations supply is sufficient. (True or False)
https://datalemur.com/sql-game/level2.html
*/

SELECT 
    FLOOR(COUNT(*) * 0.9) AS rations_needed, 
    CASE 
        WHEN (SELECT amount FROM rations) >= FLOOR(COUNT(*) * 0.9) THEN TRUE
        ELSE FALSE
    END AS is_sufficient
FROM player
WHERE status = 'alive' AND isInsider = FALSE;
              
