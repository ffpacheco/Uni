CREATE VIEW VOTE_TOTAL AS 
    SELECT PARTY, SUM(VOTES) AS TOTAL_VOTES
    FROM VOTINGS
    GROUP BY PARTY;
    
CREATE VIEW SEAT_TOTAL AS 
    SELECT PARTY, SUM(SEATS) AS TOTAL_SEATS
    FROM LISTS
    GROUP BY PARTY;

SELECT V.PARTY AS 'party', ((S.TOTAL_SEATS * 1.0 / (SELECT SUM(SEATS) FROM LISTS)) - (V.TOTAL_VOTES * 1.0 / (SELECT SUM(VOTERS) FROM PARTICIPATIONS))) * 100 AS DIFFERENCE
FROM VOTE_TOTAL V
JOIN SEAT_TOTAL S ON V.PARTY = S.PARTY
ORDER BY DIFFERENCE DESC;