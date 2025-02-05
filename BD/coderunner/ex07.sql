SELECT P.CODE, P.NAME
FROM PARISHES P
JOIN MUNICIPALITIES M ON M.CODE= P.MUNICIPALITY
JOIN DISTRICTS D ON D.CODE = M.DISTRICT
JOIN VOTINGS V ON V.PARISH = P.CODE
WHERE D.REGION='M' AND V.PARTY='PSN' AND V.VOTERS=0
ORDER BY P.CODE ASC;