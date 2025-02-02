WITH 
MCOUNT AS (
    SELECT M.DISTRICT,M.NAME, COUNT(P.CODE) AS COUNT
    FROM MUNICIPALITIES M 
    JOIN PARISHES P ON P.MUNICIPALITY=M.CODE
    GROUP BY M.DISTRICT, M.NAME
)
SELECT M1.DISTRICT AS code, M1.NAME AS namea, M2.NAME AS nameb, M1.COUNT as c
FROM MCOUNT M1
JOIN MCOUNT M2 ON M1.DISTRICT=M2.DISTRICT 
AND M1.COUNT=M2.COUNT
AND M1.NAME<M2.NAME;