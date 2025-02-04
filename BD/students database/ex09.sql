CREATE TRIGGER FRIENDS
AFTER INSERT ON ESTUDANTE
FOR EACH ROW
BEGIN
    INSERT INTO AMIZADE(ID1,ID2)
    SELECT NEW.ID, E.ID
    FROM ESTUDANTE E
    WHERE E.ID <> NEW.ID

    INSERT INTO AMIZADE(ID1,ID2)
    SELECT E.ID, NEW.ID
    FROM ESTUDANTE E
    WHERE E.ID <> NEW.ID
END; 
