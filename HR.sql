SET SERVEROUTPUT ON
DECLARE
nbLignes NUMBER := 0;
BEGIN
FOR C1 IN (
select TABLE_NAME from user_tables
) LOOP
EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || C1.TABLE_NAME INTO nbLignes;
DBMS_OUTPUT.PUT_LINE(C1.TABLE_NAME || ': ' || nbLignes);
END LOOP;
END;
/*QUESTION   2*/
SET SERVEROUTPUT ON
DECLARE
nbLignes NUMBER := 0;
BEGIN

SELECT
count(*) into nbLignes
FROM
hr.employees
INNER JOIN hr.jobs ON hr.jobs.job_id = hr.employees.job_id
WHERE
hr.jobs.job_title like '%Manager%';
DBMS_OUTPUT.PUT_LINE('NOMBRE EMPLOYE MANAGER: ' || nbLignes);

END;

/*CALCUL DE LAšPROPORTION*/
SET SERVEROUTPUT ON
DECLARE
nbLignes NUMBER := 0;
prop NUMBER :=0;
nbEmployee NUMBER :=0;

BEGIN
SELECT
count(*) into nbLignes
FROM
hr.employees
INNER JOIN hr.jobs ON hr.jobs.job_id = hr.employees.job_id
WHERE
hr.jobs.job_title like '%Manager%';
DBMS_OUTPUT.PUT_LINE('NOMBRE EMPLOYE MANAGER: ' || nbLignes);

SELECT 
COUNT (*)
INTO nbEmployee
FROM hr.employees;
DBMS_OUTPUT.PUT_LINE('NOMBRE EMPLOYE : ' || nbEmployee);

prop:= (nbLignes / nbEmployee)*100;
DBMS_OUTPUT.PUT_LINE('LA POPORTION DE MANAGER EST DE  : ' || prop);

END;
/

/*EXERCICE 2*/

SELECT OBJECT_NAME, OBJECT_TYPE
FROM USER_OBJECTS
where OBJECT_TYPE in('TABLE','VIEW');

/* EXERCICE 3*/

CREATE TABLE VOL(
IdVol NUMBER GENERATED BY DEFAULT AS IDENTITY,
Date_heure_depart DATE,
Date_heure_arrivee DATE,
Ville_depart VARCHAR(70),
Ville_arrivee VARCHAR(70),
PRIMARY KEY(IdVol));

BEGIN
INSERT INTO VOL VALUES ( TO_DATE('10:15:00', 'HH24:MI:SS'), TO_DATE('12:15:00:SS', 'HH24:MI'), 'Rome','Paris');
END;
/

