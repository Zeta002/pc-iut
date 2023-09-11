-- Q1 correction

DECLARE
    moyenne notation.moy_test%type;
    pas_de_note EXCEPTION;
    
BEGIN
    SELECT TRUNC(AVG(moy_test), 2) INTO moyenne
    FROM notation WHERE code = 'BD';
    
    IF moyenne IS NULL THEN RAISE pas_de_note; END IF;
    DBMS_OUTPUT.PUT_LINE('Moyenne obtenue en BD : ' || moyenne);

EXCEPTION
    WHEN pas_de_note THEN DBMS_OUTPUT.PUT_LINE ('Aucune note en BD');
END;

-- Q1 Moyenne notes test en BD

DECLARE

MoyenneBD notation.moy_test%type;

BEGIN

    SELECT AVG(moy_test) INTO MoyenneBD
    FROM notation WHERE (code = 'BD');
    
    DBMS_OUTPUT.PUT_LINE(MoyenneBD);

END;

-- Q2 numéro, nom, moyenne notes test étudiants
-- v1 correction
DECLARE
    trouver boolean := false;
    pas_de_note EXCEPTION;

     CURSOR Moy_Etud IS
     SELECT etudiant.num_et, etudiant.nom_et, TRUNC(AVG(notation.moy_test)) note
     FROM etudiant, notation
     WHERE etudiant.num_et = notation.num_et
     group by etudiant.num_et, nom_et;

BEGIN
    FOR m IN Moy_Etud LOOP
        trouver := TRUE;
        DBMS_OUTPUT.PUT_LINE(m.num_et || '  ' || m.nom_et || '  ' || m.note);
    END LOOP;
    
    IF NOT trouver THEN RAISE pas_de_note; END IF;
EXCEPTION
    WHEN pas_de_note THEN DBMS_OUTPUT.PUT_LINE ('Aucune note de test');
END;
-- v2 correction (fonctionne pas)
DECLARE
    trouver boolean := false;
    pas_de_note EXCEPTION;
    une_ligne Moy_Etud;
    nb_notes NUMBER(3,0);

     CURSOR Moy_Etud IS
     SELECT etudiant.num_et, etudiant.nom_et, TRUNC(AVG(notation.moy_test)) note
     FROM etudiant, notation
     WHERE etudiant.num_et = notation.num_et
     group by etudiant.num_et, nom_et;
     
BEGIN
    SELECT COUNT(*) INTO nb_notes
    FROM notation WHERE moy_test IS NOT NULL;
    
    IF nb_notes = 0 THEN RAISE pas_de_note; END IF;
    
    OPEN Moy_Etud;
    FETCH Moy_Etud INTO une_moyenne;
    WHILE Moy_Etud%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(une_moyenne.num_et || '  ' || une_moyenne.nom_et || '  ' || une_moyenne.note);
        FETCH moyenne_etud INTO une_moyenne;
    END LOOP;
    CLOSE Moy_Etud;

EXCEPTION
    WHEN pas_de_note THEN DBMS_OUTPUT.PUT_LINE('Aucune note de test');
END;
    