SELECT ACRONYM, DESIGNATION
FROM PARTIES
WHERE SUBSTR(ACRONYM,1,1) <> SUBSTR(DESIGNATION,1,1)
ORDER BY ACRONYM;
