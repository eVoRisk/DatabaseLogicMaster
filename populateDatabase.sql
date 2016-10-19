-- Insert data into Localities Table
INSERT INTO Localitati VALUES (100, 'Iasi', 'IS');
INSERT INTO Localitati VALUES (200, 'Bacau', 'BC');
INSERT INTO Localitati VALUES (300, 'Vaslui', 'VS');
INSERT INTO Localitati VALUES (400, 'Galati', 'GL');
INSERT INTO Localitati VALUES (500, 'Suceava', 'SV');
INSERT INTO Localitati VALUES (600, 'Piatra-Neamt', 'NT');

-- Insert data into Vehicles Table
INSERT INTO Vehicule VALUES (1000, 'IS-12-AJF', 'Renault', 'K3312', '2002', '2000', 'Diesel', 100, TO_DATE('11/May/2003'));
INSERT INTO Vehicule VALUES (2000, 'IS-45-BGJ', 'Dacia', 'M1282', '2000', '1400', 'Benzina', 100, TO_DATE('08/April/2009'));
INSERT INTO Vehicule VALUES (3000, 'BC-47-SDF', 'Skoda', 'K4919', '2012', '2200', 'Diesel', 200, TO_DATE('29/October/2013'));
INSERT INTO Vehicule VALUES (4000, 'BC-85-KHI', 'BMW', 'K3017', '2015', '2200', 'Benzina', 200, TO_DATE('12/May/2016'));
INSERT INTO Vehicule VALUES (5000, 'IS-23-BJS', 'BMW', 'P3310', '2001', '2800', 'Diesel', 100, TO_DATE('23/July/2003'));
INSERT INTO Vehicule VALUES (6000, 'VS-03-ADG', 'Mazda', 'A8370', '2007', '2000', 'Benzina', 300, TO_DATE('11/May/2008'));
INSERT INTO Vehicule VALUES (7000, 'VS-21-APO', 'Ford', 'L3027', '2002', '2000', 'Diesel', 300, TO_DATE('17/June/2003'));
INSERT INTO Vehicule VALUES (8000, 'SV-60-FGO', 'Opel Astra Estate', 'L3527', '2002', '2000', 'Diesel', 500, TO_DATE('13/July/2003'));
INSERT INTO Vehicule VALUES (9000, 'SV-25-ART', 'Opel Astra Estate', 'K3063', '2002', '2200', 'Diesel', 500, TO_DATE('27/May/2006'));

-- Insert data into Drivers Table
INSERT INTO Soferi VALUES (1, 11802015571, 'Ambriaj Grigore', TO_DATE('13/October/1993'), 100);
INSERT INTO Soferi VALUES (2, 16802047572, 'Pedala Ion', TO_DATE('23/June/1992'), 100);
INSERT INTO Soferi VALUES (3, 34802565573, 'Frana Ionut', TO_DATE('18/July/1986'), 100);
INSERT INTO Soferi VALUES (4, 17802067574, 'Sabot Sebastian', TO_DATE('19/March/1976'), 100);
INSERT INTO Soferi VALUES (5, 56982065575, 'Bujie Marian', TO_DATE('27/May/1986'), 200);
INSERT INTO Soferi VALUES (6, 27802095576, 'Volan Cerasela', TO_DATE('29/August/1976'), 300);
INSERT INTO Soferi VALUES (7, 25807065557, 'Piston Maria', TO_DATE('11/October/1990'), 300);
INSERT INTO Soferi VALUES (8, 16807365678, 'Oglinda Mihai', TO_DATE('14/May/1980'), 400);
INSERT INTO Soferi VALUES (9, 15905065579, 'Scaun Sebastian', TO_DATE('25/August/1993'), 400);
INSERT INTO Soferi VALUES (10, 15307065537, 'Centura Codrin', TO_DATE('18/January/1991'), 500);
INSERT INTO Soferi VALUES (11, 25808065567, 'Claxon Dumitru', TO_DATE('10/July/1992'), 500);
INSERT INTO Soferi VALUES (12, 25408065559, 'Bancheta Mihaela', TO_DATE('02/October/1985'), 600);
INSERT INTO Soferi VALUES (13, 45807063597, 'Pres Paul', TO_DATE('04/December/1987'), 600);
INSERT INTO Soferi VALUES (14, 55887035570, 'Bord Bogdan', TO_DATE('13/May/1983'), 600);

-- Insert data into Driving License Table
INSERT INTO Permise VALUES (11, TO_DATE('13/January/2012'), 1, 'A');
INSERT INTO Permise VALUES (12, TO_DATE('01/July/2012'), 2, 'B');
INSERT INTO Permise VALUES (13, TO_DATE('19/August/2009'), 3, 'B');
INSERT INTO Permise VALUES (14, TO_DATE('02/January/2000'), 4, 'B');
INSERT INTO Permise VALUES (15, TO_DATE('27/May/2004'), 5, 'B');
INSERT INTO Permise VALUES (16, TO_DATE('29/January/2007'), 6, 'C');
INSERT INTO Permise VALUES (17, TO_DATE('11/October/2010'), 7, 'B');
INSERT INTO Permise VALUES (18, TO_DATE('24/January/2006'), 8, 'A');
INSERT INTO Permise VALUES (19, TO_DATE('29/July/2012'), 9, 'B');
INSERT INTO Permise VALUES (20, TO_DATE('19/August/2009'), 10, 'A');
INSERT INTO Permise VALUES (21, TO_DATE('05/January/2012'), 11, 'D');
INSERT INTO Permise VALUES (22, TO_DATE('29/May/2006'), 12, 'B');
INSERT INTO Permise VALUES (23, TO_DATE('09/January/2007'), 13, 'B');
INSERT INTO Permise VALUES (24, TO_DATE('21/October/2010'), 14, 'B');


-- Insert data into Contraventions Table
INSERT INTO Contraventii VALUES (23, TO_DATE('31/October/2013'), 'Descriere bla bla', 100, 1, 5, 400, 1, 1000);
INSERT INTO Contraventii VALUES (123, TO_DATE('23/May/2013'), 'Descriere bla bla', 100, 1, 4, 300, 2, 2000);
INSERT INTO Contraventii VALUES (56, TO_DATE('14/May/2015'), 'Descriere bla bla', 200, 1, 3, 200, 4, 4000);
INSERT INTO Contraventii VALUES (78, TO_DATE('28/July/2014'), 'Depasire viteza', 200, 1, 5, 500, 5, 1000);
INSERT INTO Contraventii VALUES (731, TO_DATE('11/December/2016'), 'Descriere bla bla', 300, 1, 6, 400, 7, 7000);
INSERT INTO Contraventii VALUES (18, TO_DATE('15/May/2014'), 'Descriere bla bla', 400, 1, 4, 600, 8, 3000);
INSERT INTO Contraventii VALUES (100, TO_DATE('15/December/2014'), 'Accidentare pieton', 500, 1, 5, 450, 5, 1000);
INSERT INTO Contraventii VALUES (98, TO_DATE('15/May/2014'), 'Descriere bla bla', 500, 1, 5, 450, 9, 5000);
INSERT INTO Contraventii VALUES (83, TO_DATE('15/May/2015'), 'Descriere bla bla', 600, 1, 4, 120, 9, 3000);
INSERT INTO Contraventii VALUES (59, TO_DATE('15/May/2015'), 'Descriere bla bla', 600, 1, 6, 240, 11, 1000);
INSERT INTO Contraventii VALUES (19, TO_DATE('15/January/2015'), 'Descriere bla bla', 600, 1, 6, 240, 11, 1000);

-- Insert data into Tickets Table
INSERT INTO Contraventii_Viteza VALUES (23, 120, 143);
INSERT INTO Contraventii_Viteza VALUES (56, 60, 87);
INSERT INTO Contraventii_Viteza VALUES (731, 50, 75); 

-- Insert data into Paid Tickets Table
INSERT INTO Plati_Amenzi VALUES (1234, TO_DATE('15/April/2015'), 'OP - AH2334', 100, 23, 400);
INSERT INTO Plati_Amenzi VALUES (1523, TO_DATE('28/May/2015'), 'KL - AH2334', 100, 123, 240);
INSERT INTO Plati_Amenzi VALUES (1323, TO_DATE('15/April/2015'), 'SO - AH2334', 100, 56, 140);
INSERT INTO Plati_Amenzi VALUES (1226, TO_DATE('01/August/2014'), 'MK - AH2334', 200, 78, 500);
INSERT INTO Plati_Amenzi VALUES (1953, TO_DATE('11/December/2016'), 'HU - AH2334', 300, 731, 340);
INSERT INTO Plati_Amenzi VALUES (7276, TO_DATE('01/April/2014'), 'MK - AH2334', 400, 18, 550);