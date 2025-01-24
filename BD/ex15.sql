CREATE VIEW DISTRICTSo AS
SELECT D.CODE
FROM DISTRICTS D
WHERE D.NAME LIKE '%O%' OR D.NAME LIKE '%o%';

CREATE VIEW PARTIESinO AS
SELECT L.PARTY, L.SEATS
FROM LISTS L
WHERE L.DISTRICT IN DISTRICTSo;

CREATE VIEW NoSeats AS
SELECT L.PARTY 
FROM PARTIESinO L
GROUP BY L.PARTY
HAVING SUM(L.SEATS)=0;

SELECT N.PARTY
FROM NoSeats N
ORDER BY N.PARTY ASC 
LIMIT 2;