SELECT E.NAME, E.ANO
FROM ESTUDANTE E
JOIN AMIZADE A ON A.ID1=E.ID
JOIN ESTUDANTE E2 ON A.ID2 = E2.ID
WHERE E2.ANO=E.ANO