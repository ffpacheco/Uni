SELECT DISTINCT M1.NAME
FROM MUNICIPALITIES M1
JOIN PARISHES P1 ON P1.MUNICIPALITY = M1.CODE
JOIN PARISHES P2 ON P2.NAME=P1.NAME
WHERE M1.CODE <> P2.MUNICIPALITY;