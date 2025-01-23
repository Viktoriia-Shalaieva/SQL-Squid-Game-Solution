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
	
	
              
              
