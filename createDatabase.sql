--Localities Table
DROP TABLE Localitati CASCADE CONSTRAINTS;

CREATE TABLE Localitati(
	IdLoc number(3) NOT NULL,
	DenLoc varchar(15),
	Jud varchar(2)
);
ALTER TABLE Localitati ADD constraint localitati_PK PRIMARY KEY (IdLoc);

-- Vehicles Table
DROP TABLE Vehicule CASCADE CONSTRAINTS;

CREATE TABLE Vehicule(
	IdVeh number(4) NOT NULL,
	NrInmatr varchar(10) NOT NULL,
	Model varchar(30),
	SerieSasiu varchar(5) NOT NULL UNIQUE,
	AnFabricatie number(4),
	CapCilindr number(4),
	Combustibil varchar(10),
	IdLocInmatriculare number(3) NOT NULL,
	DataInmatriculare date
);
ALTER TABLE Vehicule ADD CONSTRAINT vehicule_PK PRIMARY KEY (IdVeh) ;
ALTER TABLE Vehicule ADD CONSTRAINT FK_vehicule_localitati
		FOREIGN KEY (IdLocInmatriculare) REFERENCES Localitati (IdLoc);

--Drivers table
DROP TABLE Soferi CASCADE CONSTRAINTS;

CREATE TABLE Soferi(
	IdSofer number(3) NOT NULL,
	CNPSofer number(13) NOT NULL UNIQUE,
	NumeSofer varchar(20),
	DataNasterii date,
	IdLocSofer number(3) NOT NULL
);
ALTER TABLE Soferi ADD constraint soferi_PK PRIMARY KEY (IdSofer) ;
ALTER TABLE Soferi ADD constraint FK_soferi_localitati
		FOREIGN KEY (IdLocSofer) REFERENCES Localitati (IdLoc);

--Driving license Table
DROP TABLE Permise CASCADE CONSTRAINTS;

CREATE TABLE Permise(
	IdPermis number(3) NOT NULL,
	DataEmiterii date NOT NULL,
	IdSofer number(3) NOT NULL,
	Categ varchar(2)
);
ALTER TABLE Permise ADD CONSTRAINT permise_PK PRIMARY KEY (IdPermis) ;
ALTER TABLE Permise ADD CONSTRAINT FK_permise_soferi
		FOREIGN KEY (IdSofer) REFERENCES Soferi (IdSofer);

--Contraventions table
DROP TABLE Contraventii CASCADE CONSTRAINTS;

CREATE TABLE Contraventii(
	IdContr number(3) NOT NULL,
	DataContr date,
	Descriere varchar(50),
	IdLocContr number(3) NOT NULL,
	NumarLuniSuspPermis number(2),
	NrPctPenalizare number(2),
	ValAmenda number(5),
	IdSofer number(3) NOT NULL,
	IdVehicul number (4) NOT NULL
);
ALTER TABLE Contraventii ADD constraint contraventii_PK PRIMARY KEY (IdContr) ;
ALTER TABLE Contraventii ADD constraint FK_contraventii_localitati
		FOREIGN KEY (IdLocContr) REFERENCES Localitati (IdLoc);
ALTER TABLE Contraventii ADD constraint FK_contraventii_soferi
		FOREIGN KEY (IdSofer) REFERENCES Soferi (IdSofer);
ALTER TABLE Contraventii ADD constraint FK_contraventii_vehicule
		FOREIGN KEY (IdVehicul) REFERENCES Vehicule (IdVeh);

--Speed Tickets table
DROP TABLE Contraventii_Viteza CASCADE CONSTRAINTS;

CREATE TABLE Contraventii_Viteza(
	IdContr number(3) NOT NULL,
	VitMaxLegala number(3),
	VitezaEfectiva number(3)
);
ALTER TABLE Contraventii_Viteza ADD constraint FK_contraventii_viteza
		FOREIGN KEY (IdContr) REFERENCES Contraventii (IdContr);

--Paid Tickets table
DROP TABLE Plati_Amenzi CASCADE CONSTRAINTS;

CREATE TABLE Plati_Amenzi(
	IdPlata number(4) NOT NULL,
	DataPlata date,
	DocPlata varchar(20),
	IdLocPlata number(3) NOT NULL,
	IdContr number(3) NOT NULL,
	ValoarePlata number(5)
);
ALTER TABLE Plati_Amenzi ADD constraint plati_amenzi_PK PRIMARY KEY (IdPlata) ;
ALTER TABLE Plati_Amenzi ADD constraint FK_plati_amenzi_localitati
		FOREIGN KEY (IdLocPlata) REFERENCES Localitati (IdLoc);
ALTER TABLE Plati_Amenzi ADD constraint FK_plati_amenzi_contraventii
		FOREIGN KEY (IdContr) REFERENCES Contraventii (IdContr);
