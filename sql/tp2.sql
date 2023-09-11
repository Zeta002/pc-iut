-- Q3 v1
ACCEPT moduleGiven PROMPT 'Donnez la matière dont vous voulez connaître la hiérarchi';
DECLARE
    CURSOR lesModules IS
        SELECT code
        FROM module
        START WITH code = &modulegiven
        CONNECT BY PRIOR codepere = code;
    
    moduleGiven VARCHAR2(25) DEFAULT 'NOT DEFINED';

BEGIN
    DBMS_OUTPUT.PUT_LINE(lesModules);
END;

-- Q3 correction
ACCEPT CodeMat PROMPT 'Donner le code d''une matière'
DECLARE 
    chaineModule VARCHAR2(200);
   
   CURSOR lesModules IS
        SELECT libelle
        FROM module WHERE code IS NOT NULL AND code <> '&CodeMat'
        CONNECT BY code = PRIOR codepere
        START WITH code = ('&CodeMat')
        ORDER BY LEVEL desc;
        
BEGIN
    FOR lo IN lesModules LOOP
        chaineModule := chaineModule || '/' || lo.libelle;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(chaineModule);
END;

-- Q4 v1
ACCEPT nomTable PROMPT 'Donner le nom de la table que vous voulez affiché: '
DECLARE
    chaineAttributs VARCHAR2(200);
    CURSOR nomColonne IS
        SELECT column_name
        FROM USER_TAB_COLUMNS
        WHERE table_name = '&nomTable';
BEGIN
    FOR ligne IN nomColonne LOOP
        chaineAttributs := chaineAttributs || ',' || ligne.column_name;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(nomTable || '(' || nomColonne || ')');
END;

-- Q4 correction
ACCEPT NomTab PROMPT 'Donner le nom d''une table';
DECLARE
    ChaineTable VARCHAR2(1000) := '&NomTab';
    CURSOR LesAttributs IS
        SELECT Column_Name
        FROM USER_TAB_COLUMNS
        WHERE Table_Name = '&NomTab';
BEGIN
    ChaineTable := ChaineTable || '(';
    FOR ligne IN LesAttributs LOOP
        ChaineTable := ChaineTable || ligne.Column_Name || ', ';
    END LOOP;
    ChaineTable := SUBSTR(ChaineTable, 1, LENGTH(ChaineTable)-2);
    ChaineTable := ChaineTable || ')';
    DBMS_OUTPUT.PUT_LINE(ChaineTable);
END;

-- Q5 v1
ACCEPT 
DECLARE

BEGIN
    NULL;
END;

-- Q5 correction
DECLARE
    PasMODULE EXCEPTION;
    NB NUMBER(4);
    
    CURSOR LesMatieres IS
        SELECT code, libelle
        FROM module WHERE code NOT IN (SELECT codepere
                                                                                 FROM module WHERE codepere IS NOT NULL)
                                                     AND code NOT IN (SELECT code FROM matiere);
BEGIN
    SELECT COUNT(*) INTO NB
    FROM module;
    IF NB = 0 THEN RAISE PasModule; END IF;
    
    FOR Lo IN LesMatieres LOOP
        INSERT INTO matiere
        VALUES (Lo.code, Lo.Libelle);
    END LOOP;

EXCEPTION
    WHEN PasModule THEN DBMS_OUTPUT.PUT_LINE('Table MODULE vide');
END;

-- Q1 correction fonction
CREATE OR REPLACE FUNCTION calcul_age(dateDonner DATE)
RETURN NUMBER
IS

age NUMBER(3,0);
nb_mois CONSTANT NUMBER(2,0) := 12;

BEGIN
    age :=floor (months_between (sysdate, dateDonner) / nb_mois);
    RETURN (age);
END;

-- Q1 correction test
SELECT calcul_age( DATE '2003-10-12')
FROM DUAL;

DECLARE
    Date_Naissance Date := '12-10-2003';
    Age NUMBER(3);
BEGIN
    AGE := calcul_age(Date_Naissance);
    DBMS_OUTPUT.PUT_LINE(Age);
END;

-- Q1 test
SELECT (calcul_age(DATE '2005-01-14')) FROM DUAL;

-- Q3 v1
CREATE OR REPLACE FUNCTION ville_etu(num NUMBER)
RETURN VARCHAR2
IS

    foo VARCHAR2(30);
BEGIN
    SELECT ville_et INTO foo
    FROM etudiant WHERE num_et = num;
    
    RETURN foo;
END;

-- Q3 test
SELECT ville_etu(2102) FROM DUAL;
