SPOOL E:\_MASTER\DatabaseLogicinBusinessApplications\Homework\whereOutput.txt

EXPLAIN PLAN FOR
	SELECT DataContr
	FROM Contraventii C
	INNER JOIN Contraventii_Viteza V ON C.IdContr = V.IdContr
	WHERE V.VitMaxLegala = 120;

SELECT plan_table_output
FROM table(dbms_xplan.display('plan_table', null, 'typical'));

SPOOL OFF;


SPOOL E:\_MASTER\DatabaseLogicinBusinessApplications\Homework\innerOutput.txt

EXPLAIN PLAN FOR
	SELECT DataContr
	FROM Contraventii C
	INNER JOIN Contraventii_Viteza V ON C.IdContr = V.IdContr
		AND V.VitMaxLegala = 120;

SELECT plan_table_output
FROM table(dbms_xplan.display('plan_table', null, 'typical'));

SPOOL OFF;