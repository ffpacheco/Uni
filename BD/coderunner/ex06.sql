SELECT D.NAME P.VOTERS, P.ABSTENTIONS
FROM DISTRICTS D
JOIN PARTICIPATIONS P ON P.DISTRICT=D.CODE
WHERE P.ABSTENTIONS> 0.75 * P.VOTERS
ORDER BY D.NAME;