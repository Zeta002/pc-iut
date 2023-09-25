-- Q1
-- v1
CREATE OR REPLACE TRIGGER NoDeleteMat
BEFORE DELETE OR UPDATE ON module
FOR EACH ROW
DECLARE
    c_libelle NUMBER(10,0);
BEGIN
    SELECT COUNT(e.code)
    INTO c_libelle
    FROM enseignt e
    WHERE :OLD.code = e.code;
    
    IF c_libelle < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Vous ne pouvez pas suprimmer cette matière car elle est déjà enseigné');
    END IF;
END;

/

DELETE FROM module
WHERE code = 'C++';

SELECT * FROM enseignt;

SELECT * FROM module;

-- Q2
-- v1
CREATE OR REPLACE TRIGGER NoInsertMat
BEFORE INSERT OR UPDATE ON enseignt
FOR EACH ROW
DECLARE
    c_libelle NUMBER(10,0);
BEGIN
    SELECT COUNT(e.code)
    INTO c_libelle
    FROM enseignt e
    WHERE :OLD.code = e.code;
    
    IF c_libelle < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Vous ne pouvez pas insérez cette matière car elle est déjà enseigné');
    END IF;
END;

INSERT INTO enseignt VALUES ('SYS2', 9, 10);

-- Q3
-- v1
CREATE OR REPLACE TRIGGER ReplaceNullTo0
BEFORE INSERT OR UPDATE OF moy_cc, moy_test ON notation
FOR EACH ROW
BEGIN
    IF :NEW.moy_cc IS NULL THEN :NEW.moy_cc := 0;
    END IF;
    IF :NEW.moy_test IS NULL THEN :NEW.moy_test := 0;
    END IF;
END;

-- Q4
-- v1(Quentin)
CREATE OR REPLACE TRIGGER notMyMat
BEFORE INSERT OR UPDATE ON NOTATION
FOR EACH ROW
DECLARE
    doTheMat NUMBER(2,0);
BEGIN
    SELECT COUNT(*) INTO doTheMat
    FROM ENSEIGNT WHERE :NEW.CODE = CODE AND :NEW.NUM_ET = NUM_ET;
    IF doTheMat <= 0
    THEN RAISE_APPLICATION_ERROR(-20001, 'Don''t do the mat');END IF;
END;

-- Q5
-- v1
CREATE OR REPLACE TRIGGER verif_coeff
BEFORE INSERT OR UPDATE OF coeff_test, coeff_cc ON MODULE
FOR EACH ROW
BEGIN
    IF :NEW.coeff_cc + :NEW.coeff_test <> 100 THEN 
        RAISE_APPLICATION_ERROR(-20001, 'WAT R U DOIN DUMBASS ?! R U BLIND ?'); 
    END IF;
END;

INSERT INTO module (code, libelle, coeff_cc, coeff_test) VALUES ('ligmnut', 'ligma nut', 40, 50);

-- Q6
-- v1
CREATE OR REPLACE TRIGGER log_nb_enseignant
AFTER INSERT OR UPDATE ON prof
DECLARE
    nbProf NUMBER(2,0);
BEGIN
    SELECT COUNT(*)
    INTO nbProf
    FROM prof;
    DBMS_OUTPUT.PUT_LINE(nbProf);
END;

INSERT INTO prof (num_prof, nom_prof, prenom_prof, adr_prof, cp_prof, ville_prof, mat_spec) VALUES (22, 'BEAUQUIER', 'QUENTIN', 'quelquepart', 13530, 'TRETS', 'MATH1');

-- Q7
-- v1
