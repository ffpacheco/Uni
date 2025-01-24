SELECT M.CODE, M.NAME, V.PARTY, SUM(V.VOTES) AS 'VOTES'
FROM VOTINGS V
JOIN PARISHES P ON P.CODE= V.PARISH
JOIN MUNICIPALITIES M ON M.CODE= P.MUNICIPALITY
GROUP BY M.CODE, M.NAME, V.PARTY
ORDER BY M.CODE ASC, V.PARTY ASC
LIMIT 40