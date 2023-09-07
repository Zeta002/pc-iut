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

test VARCHAR2(25) DEFAULT 'NOT DEFINED'; -- variable
Nom_Et ETUDIANT.Nom_Et%TYPE DEFAULT ‘RUBINI’; -- type dynamique
uneVariableConstante NUMBER(6,2):= 5000; -- constante
test ETDUIANT%ROWTYPE; -- type composé
test VARCHAR2(25) := Un_Etudiant.Nom_Et; -- accès à la valeur d'une composante

BEGIN
    NULL;
    /*SELECT 
    INTO -- variable repectrice
     FROM WHERE*/
END;

-- Afficher la moyenne des notes de test par matière.
DECLARE
    CURSOR MoyMat IS
    SELECT Code, AVG(Moy_Test) Moy
    FROM NOTATION
    GROUP BY Code;

Une_Ligne MoyMat%ROWTYPE;

BEGIN
    OPEN MoyMat;
    FETCH MoyMat INTO Une_Ligne;

    WHILE MoyMat%FOUND
    LOOP
    DBMS_OUTPUT.PUT_LINE(Une_Ligne.Code || ' ' ||
    Trunc(Une_Ligne.Moy, 2));
    FETCH MoyMat INTO Une_Ligne;
    END LOOP;
    
    CLOSE MoyMat;
END;