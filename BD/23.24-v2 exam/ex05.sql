WITH 
PARISHES_PER_MUNICIPALITY AS (

    SELECT M.CODE AS MUNICIPALITY, M.DISTRICT, M.NAME, COUNT(P.CODE) AS PARISHES
    FROM MUNICIPALITIES M
    JOIN PARISHES P ON P.MUNICIPALITY=M.CODE
    GROUP BY M.CODE,M.DISTRICT, M.NAME
    HAVING COUNT(P.CODE)>20

), 
MUNICIPALITIES_PER_DISTRICT AS (

    SELECT D.CODE, COUNT(M.CODE) AS MUNIS
    FROM MUNICIPALITIES M
    JOIN DISTRICTS D ON D.CODE= M.DISTRICT
    GROUP BY D.CODE
    HAVING COUNT(M.CODE)>20

)

SELECT M.NAME 
FROM PARISHES_PER_MUNICIPALITY M
JOIN MUNICIPALITIES_PER_DISTRICT D ON D.CODE = M.DISTRICT
AND M.PARISHES=D.MUNIS
ORDER BY M.NAME;