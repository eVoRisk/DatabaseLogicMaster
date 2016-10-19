SET TIMING ON;

-- 1. În ce date s-au înregistrat contravenții în zone cu viteză maximă legală de 120 KM/ora?
SELECT DataContr
FROM Contraventii C
INNER JOIN Contraventii_Viteza V ON C.IdContr = V.IdContr
WHERE V.VitMaxLegala = 120; 

-- 2. Care este suma amenzilor plătite de șoferii cu domiciliul în Iași pe luna aprilie 2015?
SELECT SUM(ValoarePlata) AS TicketsValue
FROM Plati_Amenzi P
INNER JOIN Contraventii C ON P.IdContr = C.IdContr 
INNER JOIN Soferi S ON C.IdSofer = S.IdSofer
WHERE S.IdLocSofer = 100 
	AND EXTRACT(MONTH FROM P.DataPlata) = 4;

-- 3. Care este cea mai populară (frecventă) capacitate cilindrică?
SELECT CapCilindr, COUNT(*) AS Frequency
FROM Vehicule
GROUP BY CapCilindr
HAVING COUNT(*) >= ALL (SELECT COUNT (*) FROM VEHICULE GROUP BY CapCilindr );

SELECT CapCilindr, COUNT(*) AS Frequency
FROM Vehicule
GROUP BY CapCilindr
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROWS ONLY;

-- 4. Top 5 - județe cu cei mai mulți șoferi
SELECT Jud, COUNT(*) AS TopCounty
FROM Soferi S
INNER JOIN Localitati L ON S.IdLocSofer = L.IdLoc
GROUP by Jud
ORDER BY COUNT(*) DESC
FETCH FIRST 5 ROWS ONLY;

-- 5. Ce șoferi au fost amendați contraventional și în data de 15/05/2014 și în data de 15/05/2015?
SELECT NumeSofer
FROM Soferi S
INNER JOIN Contraventii C ON S.IdSofer = C.IdSofer
WHERE DataContr IN (TO_DATE('15/May/2014'), TO_DATE('15/May/2015'))
GROUP BY NumeSofer
HAVING COUNT(*) = 2;

-- INTERSECT
SELECT NumeSofer
FROM Soferi S
INNER JOIN Contraventii C ON S.IdSofer = C.IdSofer AND DataContr = TO_DATE('15/May/2014')
INTERSECT
SELECT NumeSofer
FROM Soferi S
INNER JOIN Contraventii C ON S.IdSofer = C.IdSofer AND DataContr = TO_DATE('15/May/2015');

-- 6. Care este suma amenzilor pentru 2015, pe fiecare categorie de permis?
SELECT Categ, SUM(ValAmenda)
FROM Permise P
INNER JOIN Contraventii C ON P.IdSofer = C.IdSofer
WHERE EXTRACT (YEAR FROM DataContr) = 2015
GROUP BY Categ;

-- 7. Care sunt localitățile în care, în tot anul 2014, suma plătită a amenzilor o depășește pe cea din Bacău?
SELECT DenLoc, DataPlata, SUM(ValoarePlata) AS TicketsSum
FROM Localitati L
INNER JOIN Plati_Amenzi P ON L.IdLoc = P.IdLocPlata
GROUP BY DenLoc, DataPlata, ValoarePlata
HAVING EXTRACT (YEAR FROM DataPlata) = 2014
	AND SUM(ValoarePlata) > 
							( SELECT SUM(ValoarePlata)
								FROM Plati_Amenzi
								WHERE IdLocPlata = 200
									AND EXTRACT (YEAR FROM DataPlata) = 2014
							); 

-- 8. Care sunt modelele de autovehicole în care s-au comis toate tipurile de contravenții?
SELECT Model, COUNT( DISTINCT Descriere)
FROM Vehicule V
INNER JOIN Contraventii C ON V.IdVeh = C.IdVehicul
GROUP BY Model
HAVING COUNT(DISTINCT Descriere) = ( SELECT COUNT (DISTINCT Descriere)
							FROM Contraventii
						);

-- 9. Care sunt localitățile in care s-au comis contravenții în toate zilele anului 2014?
SELECT DenLoc
FROM Localitati L
INNER JOIN Contraventii C ON L.IdLoc = C.IdLocContr
GROUP BY DenLoc
HAVING COUNT(DISTINCT(DataContr)) = 365;

-- OR

DROP VIEW year_days;

CREATE VIEW year_days AS
SELECT ADD_MONTHS(TRUNC(sysdate, 'YYYY'), -12*2) + (level - 1) AS the_day
FROM DUAL
CONNECT BY level <= TO_NUMBER(TO_CHAR(LAST_DAY(ADD_MONTHS(ADD_MONTHS(TRUNC(sysdate, 'YYYY'), -12*2), 11)), 'DDD'));

SELECT DenLoc
FROM Localitati L
INNER JOIN Contraventii C ON L.IdLoc = C.IdLocContr
INNER JOIN year_days Y ON C.DataContr = Y.the_day
GROUP BY DenLoc
HAVING COUNT(DISTINCT(DataContr)) = COUNT(DISTINCT(the_day));

SELECT DenLoc, DataContr, the_day,
	CASE
		WHEN COUNT(DISTINCT(DataContr)) = COUNT(DISTINCT(the_day)) THEN 'true'
		ELSE 'false'
	END
FROM Localitati L
INNER JOIN Contraventii C ON L.IdLoc = C.IdLocContr
INNER JOIN year_days Y ON C.DataContr = Y.the_day
GROUP BY DenLoc, DataContr, the_day;

-- 10. Ce modele de autovehicule au măcar capacitățile cilindrile ale Open Astra Estate?
SELECT DISTINCT Model
FROM Vehicule
WHERE CapCilindr IN (
	SELECT DISTINCT CapCilindr
	FROM Vehicule
	WHERE Model = 'Opel Astra Estate'	
) AND Model <> 'Opel Astra Estate';


-- 11. Să se obţină primul raport de pe verso (centralizatorul amenzilor pe anul 2015)
WITH pivot_data AS (
	SELECT DenLoc, IdContr, ValAmenda, DataContr
	FROM Localitati L
	INNER JOIN Contraventii C ON L.IdLoc = C.IdLocContr
	WHERE EXTRACT (YEAR FROM DataContr) = 2015
)
SELECT *
FROM pivot_data
PIVOT (
	SUM(ValAmenda)
	FOR IdContr
	IN (56, 59, 83)
);

-- Raport
-- The sintax for the total isn't good
WITH pivot_data AS (
  SELECT Jud, SUM(ValAmenda) ValAmenda,
         CASE WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-1' THEN 'Trimestrul1'
              WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-2' THEN 'Trimestrul2'
              WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-3' THEN 'Trimestrul3'
              WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-4' THEN 'Trimestrul4' END AS Trimestrul
  FROM Localitati L
  INNER JOIN Contraventii C ON L.IdLoc = C.IdLocContr
  WHERE EXTRACT (YEAR FROM DataContr) = 2015
  GROUP BY Jud, 
         CASE WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-1' THEN 'Trimestrul1'
              WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-2' THEN 'Trimestrul2'
              WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-3' THEN 'Trimestrul3'
              WHEN TO_CHAR(DataContr, 'YYYY-Q') = '2015-4' THEN 'Trimestrul4' END
)
SELECT * -- , pivot_data.Trimestrul1 + pivot_data.Trimestrul2 + pivot_data.Trimestrul3 + pivot_data.Trimestrul4 AS TOTAL
FROM pivot_data 
PIVOT (
 SUM(ValAmenda)
 FOR Trimestrul
 IN ('Trimestrul1', 'Trimestrul2', 'Trimestrul3', 'Trimestrul4')
);

-- 12. Să se obţină al doilea raport de pe verso (lista, pentru fiecare șofer, a tuturor contravențiilor pe anul 2014)
SELECT NumeSofer, LISTAGG(Descriere, ';') WITHIN GROUP (ORDER BY Descriere) AS Contraventions
FROM Soferi S
INNER JOIN Contraventii C ON S.IdSofer = C.IdSofer
WHERE EXTRACT (YEAR FROM DataContr) = 2014
GROUP BY NumeSofer;

SET TIMING OFF;