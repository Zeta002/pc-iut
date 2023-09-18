-- Exercice 1
-- Q1

CREATE OR REPLACE TRIGGER def_controle
BEFORE INSERT OR UPDATE OF TypeC, DateDeb, DateFin, NoteMax
ON CONTROLE
FOR EACH ROW
BEGIN
    IF :NEW.DateFin IS NULL OR :NEW.TypeC IN ('TEST', 'RATTRAPAGE', 'INTEROGATIONS')
    THEN :NEW.DateFin := :NewDateDeb; END IF;
    
    IF :New.NoteMax IS NULL
    THEN :NEW.NoteMax := 20; END IF;
END;

-- Q2

CREATE OR REPLACE TRIGGER def_note_def
AFTER INSERT OR UPDATE
ON NOTATION
FOR EACH ROW
DECLARE
    nt_max CONTROL.noteMax%Type
BEGIN
    SELECT noteMax INTO nt_max
    FROM CONTROLE
    WHERE idc = :NEW.idc;
UPDATE NOTATION
    SET noteDef = (:NEW.note / nt_Max) * 20
    WHERE (idc, num_et) = (:NEW.idc, NEW.num_et);
END;

-- Exercice 2
-- Q1

CREATE OR REPLACE TRIGGER nb_emprunt_trop_eleve
BEFORE INSERT OR UPDATE
ON EMPRUNT
FOR EACH ROW
DECLARE
    nb_e ABONNE.nbEmprunt%TYPE;
BEGIN
    SELECT nbEmprunt INTO nb_e
    FROM ABONNE
    WHERE EMPRUNT.ida = ABONNE.ida
    
    IF nb_e > 5
    THEN RAISE_APPLICATION_ERROR(-20001, 'Vous avez atteint le nombre maximum d\'emprunt');
    END IF;
END;

-- Q2

CREATE OR REPLACE TRIGGER date_retour_retrait
AFTER INSERT OR UPDATE
ON EMPRUNT
FOR EACH ROW
BEGIN
    UPDATE ABONNE
        SET nbEmprunt := nbEmprunt - 1
        WHERE ABONNE.ida = :NEW.ida;
END;

CREATE OR OR REPLACE TRIGGER date_retour_ajout
BEFORE INSERT OR UPDATE
ON EMPRUNT
FOR EACH ROW
BEGIN
    UPDATE ABONNE
        SET nbEmprunt := nbEmprunt + 1
        WHERE ABONNE.ida = :NEW.ida;
END;

-- Q3 (pas terminé, version pas corrigé)

CREATE OR REPLACE TRIGGER emprunt
AFTER INSERT OR UPDATE
ON EMPRUNT
FOR EACH ROW
DECLARE
    contact RESERV.contact%TYPE;
    ida RESERV.ida%TYPE;
BEGIN
    SELECT idl INTO idl
    FROM EXEMPLAIRE
    WHERE EMPRUNT.codebar = EXEMPLAIRE.codebar
    
    SELECT contact INTO contact
    FROM RESERV
    WHERE EXEMPLAIRE.ida = RESERV.ida
    
    SELECT nom INTO nom
    FROM ABONNE
    WHERE EMPRUNT.ida = ABONNE.ida
    
    SELECT prenom INTO prenom
    FROM ABONNE
    WHERE EMPRUNT.ida = ABONNE.ida
    
    avertir()
