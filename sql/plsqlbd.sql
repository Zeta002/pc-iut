-- HELLO WORLD
/*
BEGIN
    DBMS_OUTPUT.PUT_LINE('BONJOUR');
END;*/


-- Methode anonyme qui récupère un nom de client

ACCEPT Nom_Et PROMPT 'Donnez le nom d''un étudiant'
BEGIN
    DBMS_OUTPUT.PUT_LINE('BONJOUR' || ' ' || '&Nom_Et' );
END;

-- Variables

DECLARE

test VARCHAR2(25) DEFAULT 'NOT DEFINED';
/* Nom_Et ETUDIANT.Nom_Et%TYPE DEFAULT ‘RUBINI’ ; */ -- type dynamique

BEGIN
    NULL;
END;