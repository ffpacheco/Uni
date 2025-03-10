SELECT PY.DESIGNATION, SUM(V.VOTES) AS TOTAL
FROM VOTINGS V
JOIN PARTY PY ON PY.ACRONYM=V.PARTY
JOIN PARISHES P ON P.CODE=V.PARISH
JOIN MUNICIPALITIES M ON M.CODE=P.MUNICIPALITY
JOIN DISTRICTS D ON D.CODE = M.DISTRICT
WHERE D.NAME='Porto'
GROUP BY PY.DESIGNATION
ORDER BY TOTAL DESC;