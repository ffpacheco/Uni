SELECT V.PARTY, SUM(V.VOTES) AS 'VOTES'
FROM VOTINGS V
GROUP BY V.PARTY
ORDER BY V.PARTY ASC;