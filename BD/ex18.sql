WITH WIN_MUNICIPALITIES AS (
    SELECT P.MUNICIPALITY, V.PARTY, SUM(V.VOTES) AS 'VOTES'
    FROM VOTINGS V
    JOIN PARISHES P ON V.PARISH = P.CODE
    GROUP BY P.MUNICIPALITY, V.PARTY
    HAVING (P.MUNICIPALITY, SUM(V.VOTES)) IN (
        SELECT X.MUNICIPALITY, MAX(X.VOTES)
        FROM (
            SELECT PX.MUNICIPALITY, VX.PARTY, SUM(VX.VOTES) AS 'VOTES'
            FROM VOTINGS VX
            JOIN PARISHES PX ON VX.PARISH = PX.CODE
            GROUP BY PX.MUNICIPALITY, VX.PARTY
        ) X
        GROUP BY X.MUNICIPALITY
    )
)
SELECT D.CODE, D.NAME, V.PARTY
FROM WIN_MUNICIPALITIES V
JOIN MUNICIPALITIES M ON V.MUNICIPALITY = M.CODE
JOIN DISTRICTS D ON M.DISTRICT = D.CODE
GROUP BY D.CODE, D.NAME, V.PARTY
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM MUNICIPALITIES X
    WHERE X.DISTRICT = D.CODE
)
ORDER BY D.CODE;