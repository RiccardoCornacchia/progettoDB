/*MODIFICA LUNGHEZZA nomeAttivita in ATTIVITA COMMERCIALE*/
ALTER TABLE ATTIVITA_COMMERCIALE
MODIFY COLUMN nomeAttivita CHAR(35);

/* MODIFICA DELLE COLONNE data e orario in ACQUISTO FOTO (erano char(1))*/
ALTER TABLE ACQUISTO_FOTO
MODIFY COLUMN data  CHAR(10);

ALTER TABLE ACQUISTO_FOTO
MODIFY COLUMN orario  CHAR(10);

/* QUERY PER MODIFICA NOME Area Tematiche in Area Tematica e rispettivo nome*/
RENAME TABLE AREA_TEMATICHE TO AREA_TEMATICA;

ALTER TABLE AREA_TEMATICA 
RENAME COLUMN nomeAreaTematiche TO nomeAreaTematica;

/* MODIFICA DELLE COLONNA tema in AREA_TEMATICA (erano char(20))*/
ALTER TABLE AREA_TEMATICA
MODIFY COLUMN tema  CHAR(40);

/* MODIFICA DELLE COLONNA nomeEvento in EVENTO (era char(20))*/
ALTER TABLE EVENTO
MODIFY COLUMN  nomeEvento CHAR(40);

/* MODIFICA DELLE COLONNA acquisto in USUFRUIZIONE (era char(20))*/
ALTER TABLE USUFRUIZIONE
MODIFY COLUMN acquisto  CHAR(50);

/* Attivita Commerciale - Punti Ristoro */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (1, 'Toro InPiedi Saloon', '11.30', '22.30', 1, 4, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (2, 'Paddock Coffee', '11.30', '22.30', 1, 4, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (3, 'Akira Sushi', '11.30', '22.30', 1, 5, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (4, 'Dino''s pizza time', '11.30', '22.30', 1, 3, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (5, 'Katun Grill', '11.30', '22.30', 1, 10, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (6, 'Scrambler BBQ', '11.30', '22.30', 1, 7, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (7, 'Cantina El Tesoro', '11.30', '22.30', 1, 7, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (8, 'McDonald', '11.30', '22.30', 1, 10, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (9, 'Churros & Magia', '11.30', '22.30', 1, 3, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (10, 'Pretzel Planet', '11.30', '22.30', 1, 3, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (11, 'Popcorn Volcano', '11.30', '22.30', 1, 2, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (12, 'Il Saloon dello Sceriffo', '11.30', '22.30', 1, 7, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (13, 'Pizzeria La Piazza Incantata', '11.30', '22.30', 1, 7, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (14, 'Chiosco da Riccardo', '11.30', '22.30', 1, 2, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (15, 'Trattoria d Giovanni', '11.30', '22.30', 1, 5, 'puntiRistoro');

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (16, 'CandyShop by Francesca', '11.30', '22.30', 1, 1, 'puntiRistoro');

/** Attivita Commerciale - Negozi */
/* --- MONTAGNE RUSSE (13 Negozi) --- */

/* Giostra: Katun */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (17, 'Katun Scream Shot', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Desmo Race */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (18, 'Desmo Photo Finish', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Gold Digger */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (19, 'Gold Digger Click', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Master Thai */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (20, 'Master Thai Photo', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Rexplorer */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (21, 'Rexplorer Memories', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Buffalo Bill Rodeo */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (22, 'Buffalo Bill Snaps', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Diavel Ring */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (23, 'Diavel Ring Pic', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Vortex */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (24, 'Vortex Action Photo', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Titan */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (25, 'Titan Sky View', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Sky Piercer */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (26, 'Sky Piercer Shot', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Shadow Racer */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (27, 'Shadow Racer Flash', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Cobra Express */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (28, 'Cobra Photo Point', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Meteorite */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (29, 'Meteorite Space Shot', '11.30', '22.30', 1, 1, 'NegozioFoto');


/* --- AVVENTURA (6 Negozi) --- */

/* Giostra: Reset */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (30, 'Reset Future Cam', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Rio Bravo */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (31, 'Rio Bravo Splash', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Autosplash */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (32, 'Autosplash Wash', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: El Dorado Falls */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (33, 'El Dorado Waterfall', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Raratonga */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (34, 'Raratonga Volcano Pic', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Rubble's Rapids */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (35, 'Rubble Rapids Photo', '11.30', '22.30', 1, 1, 'NegozioFoto');


/* --- BAMBINI (14 Negozi) --- */

/* Giostra: Adventure Bay Carousel */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (36, 'Adventure Bay Smiles', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Aquila Tonante */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (37, 'Aquila Flight Photo', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Torri Geronimo */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (38, 'Geronimo Jump Shot', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Boots' Balloons */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (39, 'Boots Balloon Pic', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Bicisauro */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (40, 'Bicisauro Photo', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Cowabunga Carts */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (41, 'Cowabunga Snap', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Jellyfish Jam */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (42, 'Jellyfish Memories', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Kiddy Monster */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (43, 'Kiddy Monster Pic', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Monosauro */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (44, 'Monosauro Egg Photo', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Raptotana */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (45, 'Raptotana Cave Pic', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: AlgigaWheel */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (46, 'AlgigaWheel View', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Reptilium */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (47, 'Reptilium Photo', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Il Trenino Arcobaleno */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (48, 'Trenino Rainbow Pic', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* Giostra: Le Tazze Magiche */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (49, 'Tazze Magiche Spin', '11.30', '22.30', 1, 1, 'NegozioFoto');

/* --- NEGOZI DI SOUVENIRS (8 Attività) --- */

/* Negozio Principale (Ingresso) */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (50, 'Mirabilia Emporium', '10.00', '23.00', 1, 5, 'NegozioSouvenirs');

/* Area Dinosauri */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (51, 'Dino Market', '11.30', '22.30', 1, 3, 'NegozioSouvenirs');

/* Area Western */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (52, 'Western General Store', '11.30', '22.30', 1, 3, 'NegozioSouvenirs');

/* Area Spazio/Futuro */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (53, 'Galactic Gadgets', '11.30', '22.30', 1, 2, 'NegozioSouvenirs');

/* Area Pirati/Acquatica */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (54, 'Il Tesoro dei Pirati', '11.30', '22.30', 1, 2, 'NegozioSouvenirs');

/* Area Fantasy */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (55, 'La Bottega delle Fate', '11.30', '22.30', 1, 2, 'NegozioSouvenirs');

/* Area Motori (Vicino Desmo Race) */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (56, 'Speed Shop', '11.30', '22.30', 1, 3, 'NegozioSouvenirs');

/* Area Bambini */
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (57, 'Peluche Paradise', '11.30', '22.30', 1, 4, 'NegozioSouvenirs');

/* Attivita Commerciale - SalaGiochi*/
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (58, 'Arcade Kingdom', '10.30', '22.45', 1, 1, 'salaGiochi');

/*Giostre - NON FUNZIONANO MANCA CF*/
/* Montagne Russe */
INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Katun', NULL, 32, 1, 12, 145, FALSE, 80, 110, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Desmo Race', NULL, 24, 1, 10, 120, FALSE, 80, 100, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Gold Digger', NULL, 4, 1, 6, 180, FALSE, 99, 45, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Master Thai', NULL, 20, 1, 6, 110, FALSE, 99, 50, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Rexplorer', NULL, 20, 1, 5, 90, FALSE, 99, 35, 190, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Buffalo Bill Rodeo', NULL, 40, 1, 8, 120, FALSE, 99, 50, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Diavel Ring', NULL, 24, 1, 10, 120, FALSE, 99, 30, 195, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Vortex', NULL, 28, 1, 14, 130, FALSE, 80, 95, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Titan', NULL, 32, 1, 14, 160, FALSE, 80, 120, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Sky Piercer', NULL, 16, 1, 12, 60, FALSE, 80, 130, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Shadow Racer', NULL, 20, 1, 10, 110, FALSE, 80, 70, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Cobra Express', NULL, 24, 1, 8, 100, FALSE, 99, 60, 200, 'Montagne Russe');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Meteorite', NULL, 18, 1, 12, 90, FALSE, 80, 85, 200, 'Montagne Russe');

/* Avventura */
INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Reset', NULL, 10, 1, 4, 240, FALSE, 99, 5, 200, 'Avventura');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Rio Bravo', NULL, 8, 1, 6, 300, TRUE, 99, 20, 200, 'Avventura');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Autosplash', NULL, 4, 1, 5, 240, TRUE, 99, 40, 200, 'Avventura');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('El Dorado Falls', NULL, 20, 1, 8, 180, TRUE, 99, 70, 200, 'Avventura');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Raratonga', NULL, 4, 1, 4, 200, TRUE, 99, 5, 200, 'Avventura');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Rubble''s Rapids', NULL, 6, 1, 4, 240, TRUE, 99, 10, 200, 'Avventura');

/* Bambini */
INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Adventure Bay Carousel', NULL, 30, 1, 3, 180, FALSE, 12, 5, 160, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Aquila Tonante', NULL, 16, 1, 4, 120, FALSE, 14, 10, 170, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Torri Geronimo', NULL, 12, 1, 5, 100, FALSE, 14, 15, 180, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Boots'' Balloons', NULL, 16, 1, 3, 120, FALSE, 12, 5, 160, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Bicisauro', NULL, 12, 1, 4, 150, FALSE, 12, 8, 160, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Cowabunga Carts', NULL, 20, 1, 3, 120, FALSE, 10, 6, 150, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Jellyfish Jam', NULL, 24, 1, 3, 120, FALSE, 12, 5, 160, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Kiddy Monster', NULL, 16, 1, 3, 120, FALSE, 12, 5, 160, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Monosauro', NULL, 4, 1, 3, 300, FALSE, 99, 5, 200, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Raptotana', NULL, 6, 1, 3, 180, FALSE, 99, 5, 200, 'Bambini');
/*Manca Una Giostra*/

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Reptilium', NULL, 40, 1, 4, 150, FALSE, 99, 10, 180, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Il Trenino Arcobaleno', NULL, 20, 1, 2, 240, FALSE, 10, 5, 150, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Le Tazze Magiche', NULL, 30, 1, 3, 120, FALSE, 12, 10, 160, 'Bambini');

/* FOTO */
INSERT INTO FOTO(codiceFoto, prezzo) VALUES
/* Primo terzo: 7.99 */
(1, 7.99), (2, 7.99), (3, 7.99), (4, 7.99), (5, 7.99), (6, 7.99), (7, 7.99), (8, 7.99), (9, 7.99), (10, 7.99),
(11, 7.99), (12, 7.99), (13, 7.99), (14, 7.99), (15, 7.99), (16, 7.99), (17, 7.99), (18, 7.99), (19, 7.99), (20, 7.99),
(21, 7.99), (22, 7.99), (23, 7.99), (24, 7.99), (25, 7.99), (26, 7.99), (27, 7.99), (28, 7.99), (29, 7.99), (30, 7.99),
(31, 7.99), (32, 7.99), (33, 7.99),

/* Secondo terzo: 10.99 */
(34, 10.99), (35, 10.99), (36, 10.99), (37, 10.99), (38, 10.99), (39, 10.99), (40, 10.99), (41, 10.99), (42, 10.99), (43, 10.99),
(44, 10.99), (45, 10.99), (46, 10.99), (47, 10.99), (48, 10.99), (49, 10.99), (50, 10.99), (51, 10.99), (52, 10.99), (53, 10.99),
(54, 10.99), (55, 10.99), (56, 10.99), (57, 10.99), (58, 10.99), (59, 10.99), (60, 10.99), (61, 10.99), (62, 10.99), (63, 10.99),
(64, 10.99), (65, 10.99), (66, 10.99),

/* Terzo terzo: 12.99 */
(67, 12.99), (68, 12.99), (69, 12.99), (70, 12.99), (71, 12.99), (72, 12.99), (73, 12.99), (74, 12.99), (75, 12.99), (76, 12.99),
(77, 12.99), (78, 12.99), (79, 12.99), (80, 12.99), (81, 12.99), (82, 12.99), (83, 12.99), (84, 12.99), (85, 12.99), (86, 12.99),
(87, 12.99), (88, 12.99), (89, 12.99), (90, 12.99), (91, 12.99), (92, 12.99), (93, 12.99), (94, 12.99), (95, 12.99), (96, 12.99),
(97, 12.99), (98, 12.99), (99, 12.99);

/*Acquisto Foto basato sui primi 100 visitatori inseriti dalla FRA (vedi QueryFra.sql)*/
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES
(1, '2026-05-02', '10.30', 'MR12AB'),
(2, '2026-05-15', '14.45', 'LB05CD'),
(3, '2026-06-01', '11.15', 'AV22EF'),
(4, '2026-05-20', '16.20', 'GN09GH'),
(5, '2026-05-05', '12.00', 'MG18IJ'),
(6, '2026-06-10', '15.30', 'SF30KL'),
(7, '2026-05-28', '13.45', 'PR14MN'),
(8, '2026-05-11', '10.15', 'ER03OP'),
(9, '2026-06-05', '17.00', 'DC27QR'),
(10, '2026-05-08', '11.50', 'FM16ST'),
(11, '2026-06-12', '14.10', 'AC11UV'),
(12, '2026-05-22', '12.30', 'CG24WX'),
(13, '2026-05-03', '15.55', 'SR02YZ'),
(14, '2026-06-08', '10.40', 'ML19AA'),
(15, '2026-05-19', '13.20', 'FM08BB'),
(16, '2026-05-30', '16.45', 'VB25CC'),
(17, '2026-05-14', '11.10', 'SF06DD'),
(18, '2026-06-02', '15.15', 'LD13EE'),
(19, '2026-05-25', '12.50', 'MS29FF'),
(20, '2026-05-07', '14.30', 'IG21GG'),
(21, '2026-06-14', '10.20', 'NT17HH'),
(22, '2026-05-17', '16.00', 'BP04II'),
(23, '2026-05-09', '11.45', 'GF28JJ'),
(24, '2026-06-06', '13.30', 'SR10KK'),
(25, '2026-05-21', '15.10', 'AL15LL'),
(26, '2026-05-04', '10.55', 'MP07MM'),
(27, '2026-06-11', '14.05', 'RM23NN'),
(28, '2026-05-27', '12.40', 'CV14OO'),
(29, '2026-05-12', '16.30', 'FL01PP'),
(30, '2026-06-03', '11.25', 'AC18QQ'),
(31, '2026-05-24', '15.40', 'TB09RR'),
(32, '2026-05-06', '13.15', 'SF26SS'),
(33, '2026-06-13', '10.50', 'EP03TT'),
(34, '2026-05-16', '14.25', 'GS20UU'),
(35, '2026-05-31', '12.10', 'DA31VV'),
(36, '2026-05-10', '16.50', 'VC27WW'),
(37, '2026-06-07', '11.35', 'RF06XX'),
(38, '2026-05-23', '15.00', 'EM12YY'),
(39, '2026-05-01', '13.50', 'PC19AZ'),
(40, '2026-06-09', '10.25', 'NV08BA'),
(41, '2026-05-18', '14.55', 'GO24CB'),
(42, '2026-05-29', '12.20', 'FS16DC'),
(43, '2026-05-13', '16.15', 'ED02ED'),
(44, '2026-06-04', '11.05', 'CF11FE'),
(45, '2026-05-26', '15.25', 'SP29GF'),
(46, '2026-05-05', '13.40', 'IG05HG'),
(47, '2026-06-15', '10.45', 'CM14IH'),
(48, '2026-05-20', '14.15', 'AR23JI'),
(49, '2026-05-02', '12.35', 'LB30KJ'),
(50, '2026-06-10', '16.40', 'SP09LK'),
(51, '2026-05-15', '11.55', 'GF10ML'),
(52, '2026-05-30', '15.50', 'RN21NM'),
(53, '2026-06-01', '13.00', 'LM05OP'),
(54, '2026-05-11', '10.30', 'AB15PQ'),
(55, '2026-06-05', '14.45', 'MF22QR'),
(56, '2026-05-22', '12.00', 'EL28RS'),
(57, '2026-05-08', '16.20', 'DP11ST'),
(58, '2026-06-12', '11.15', 'GM07TU'),
(59, '2026-05-19', '15.30', 'FV30UV'),
(60, '2026-05-03', '13.45', 'SL02VW'),
(61, '2026-06-08', '10.15', 'TC18WX'),
(62, '2026-05-25', '14.10', 'MB10XY'),
(63, '2026-05-14', '11.50', 'AF25YZ'),
(64, '2026-06-02', '16.00', 'CP19ZA'),
(65, '2026-05-07', '12.30', 'AS14AB'),
(66, '2026-06-14', '15.15', 'VA23BC'),
(67, '2026-05-28', '11.10', 'SC05CD'),
(68, '2026-05-09', '13.20', 'IF10DE'),
(69, '2026-06-06', '16.45', 'MM01EF'),
(70, '2026-05-21', '10.40', 'EC17FG'),
(71, '2026-05-04', '15.55', 'NV28GH'),
(72, '2026-06-11', '12.50', 'BO13HI'),
(73, '2026-05-27', '11.45', 'GS04IJ'),
(74, '2026-05-12', '14.30', 'SD22JK'),
(75, '2026-06-03', '10.20', 'AF16KL'),
(76, '2026-05-24', '15.10', 'MP09LM'),
(77, '2026-05-06', '13.30', 'RG01MN'),
(78, '2026-06-13', '16.00', 'CM07NO'),
(79, '2026-05-16', '11.25', 'FR19OP'),
(80, '2026-05-31', '14.05', 'AB05PQ'),
(81, '2026-05-10', '12.40', 'TP20QR'),
(82, '2026-06-07', '15.40', 'SF06RS'),
(83, '2026-05-23', '11.00', 'EN13ST'),
(84, '2026-05-01', '13.15', 'GM30TU'),
(85, '2026-06-09', '16.30', 'DB08UV'),
(86, '2026-05-18', '10.50', 'VF01VW'),
(87, '2026-05-29', '14.25', 'RL11WX'),
(88, '2026-05-13', '12.10', 'EP18XY'),
(89, '2026-06-04', '15.00', 'PM02YZ'),
(90, '2026-05-26', '11.35', 'NV24ZA'),
(91, '2026-05-05', '13.50', 'GL12AB'),
(92, '2026-06-15', '16.50', 'FC06BC'),
(93, '2026-05-20', '10.25', 'EB15CD'),
(94, '2026-05-02', '14.55', 'CF21DE'),
(95, '2026-06-10', '12.20', 'SP03EF'),
(96, '2026-05-15', '15.25', 'IS19FG'),
(97, '2026-05-30', '11.05', 'CA28GH'),
(98, '2026-06-01', '13.40', 'AC12HI'),
(99, '2026-05-11', '16.15', 'LF21IJ');

/* VENDITA_FOTO non funzionano perche attivita commerciale non va per questione CF*/
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (1, '2026-05-02', '10.30', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (2, '2026-05-15', '14.45', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (3, '2026-06-01', '11.15', 48);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (4, '2026-05-20', '16.20', 32);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (5, '2026-05-05', '12.00', 25);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (6, '2026-06-10', '15.30', 24);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (7, '2026-05-28', '13.45', 45);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (8, '2026-05-11', '10.15', 36);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (9, '2026-06-05', '17.00', 23);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (10, '2026-05-08', '11.50', 19);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (11, '2026-06-12', '14.10', 18);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (12, '2026-05-22', '12.30', 45);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (13, '2026-05-03', '15.55', 29);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (14, '2026-06-08', '10.40', 33);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (15, '2026-05-19', '13.20', 49);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (16, '2026-05-30', '16.45', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (17, '2026-05-14', '11.10', 40);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (18, '2026-06-02', '15.15', 31);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (19, '2026-05-25', '12.50', 25);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (20, '2026-05-07', '14.30', 20);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (21, '2026-06-14', '10.20', 22);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (22, '2026-05-17', '16.00', 37);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (23, '2026-05-09', '11.45', 24);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (24, '2026-06-06', '13.30', 46);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (25, '2026-05-21', '15.10', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (26, '2026-05-04', '10.55', 30);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (27, '2026-06-11', '14.05', 30);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (28, '2026-05-27', '12.40', 26);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (29, '2026-05-12', '16.30', 28);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (30, '2026-06-03', '11.25', 49);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (31, '2026-05-24', '15.40', 35);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (32, '2026-05-06', '13.15', 18);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (33, '2026-06-13', '10.50', 25);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (34, '2026-05-16', '14.25', 21);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (35, '2026-05-31', '12.10', 23);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (36, '2026-05-10', '16.50', 32);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (37, '2026-06-07', '11.35', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (38, '2026-05-23', '15.00', 44);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (39, '2026-05-01', '13.50', 38);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (40, '2026-06-09', '10.25', 19);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (41, '2026-05-18', '14.55', 27);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (42, '2026-05-29', '12.20', 38);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (43, '2026-05-13', '16.15', 24);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (44, '2026-06-04', '11.05', 47);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (45, '2026-05-26', '15.25', 20);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (46, '2026-05-05', '13.40', 28);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (47, '2026-06-15', '10.45', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (48, '2026-05-20', '14.15', 42);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (49, '2026-05-02', '12.35', 34);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (50, '2026-06-10', '16.40', 25);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (51, '2026-05-15', '11.55', 18);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (52, '2026-05-30', '15.50', 30);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (53, '2026-06-01', '13.00', 21);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (54, '2026-05-11', '10.30', 39);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (55, '2026-06-05', '14.45', 24);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (56, '2026-05-22', '12.00', 43);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (57, '2026-05-08', '16.20', 25);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (58, '2026-06-12', '11.15', 28);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (59, '2026-05-19', '15.30', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (60, '2026-05-03', '13.45', 30);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (61, '2026-06-08', '10.15', 41);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (62, '2026-05-25', '14.10', 22);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (63, '2026-05-14', '11.50', 29);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (64, '2026-06-02', '16.00', 23);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (65, '2026-05-07', '12.30', 48);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (66, '2026-06-14', '15.15', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (67, '2026-05-28', '11.10', 29);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (68, '2026-05-09', '13.20', 36);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (69, '2026-06-06', '16.45', 25);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (70, '2026-05-21', '10.40', 44);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (71, '2026-05-04', '15.55', 24);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (72, '2026-06-11', '12.50', 31);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (73, '2026-05-27', '11.45', 18);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (74, '2026-05-12', '14.30', 45);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (75, '2026-06-03', '10.20', 26);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (76, '2026-05-24', '15.10', 33);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (77, '2026-05-06', '13.30', 35);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (78, '2026-06-13', '16.00', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (79, '2026-05-16', '11.25', 28);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (80, '2026-05-31', '14.05', 40);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (81, '2026-05-10', '12.40', 27);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (82, '2026-06-07', '15.40', 22);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (83, '2026-05-23', '11.00', 37);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (84, '2026-05-01', '13.15', 24);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (85, '2026-06-09', '16.30', 49);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (86, '2026-05-18', '10.50', 35);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (87, '2026-05-29', '14.25', 17);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (88, '2026-05-13', '12.10', 29);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (89, '2026-06-04', '15.00', 25);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (90, '2026-05-26', '11.35', 30);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (91, '2026-05-05', '13.50', 19);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (92, '2026-06-15', '16.50', 46);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (93, '2026-05-20', '10.25', 23);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (94, '2026-05-02', '14.55', 27);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (95, '2026-06-10', '12.20', 32);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (96, '2026-05-15', '15.25', 44);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (97, '2026-05-30', '11.05', 21);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (98, '2026-06-01', '13.40', 18);
INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) VALUES (99, '2026-05-11', '16.15', 19);
/*Ruota Panoramica*/
INSERT INTO RUOTA_PANORAMICA(nomeRouta, CF, disponibilita, durataRuotaPanoramica, altezzaRuotaPanoramica) VALUES ('AlgigaWheel', NULL, 1, 8, 135);

/*Spettacoli*/
INSERT INTO SPETTACOLO(durataSpettacolo, nomeSpettacolo, disponibilita) VALUES (35,'Scuola di Polizia',1);
INSERT INTO SPETTACOLO(durataSpettacolo, nomeSpettacolo, disponibilita) VALUES (25,'Ultimo Pan',1);
INSERT INTO SPETTACOLO(durataSpettacolo, nomeSpettacolo, disponibilita) VALUES (30,'Hot Wheels City',1);
INSERT INTO SPETTACOLO(durataSpettacolo, nomeSpettacolo, disponibilita) VALUES (15,'Otto Party',1);
INSERT INTO SPETTACOLO(durataSpettacolo, nomeSpettacolo, disponibilita) VALUES (25,'Hall of Fame',1);

/**Replica Spettacolo*/
/* --- 1 GIUGNO 2026 (Repliche 1-8) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-01', 1, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-01', 2, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-01', 3, '12.30', '12.45', 'Otto Party'),
('2026-06-01', 4, '17.00', '17.15', 'Otto Party'),
('2026-06-01', 5, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-01', 6, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-01', 7, '16.05', '16.30', 'Hall of Fame'),
('2026-06-01', 8, '15.00', '15.25', 'Ultimo Pan');

/* --- 2 GIUGNO 2026 (Repliche 9-16) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-02', 9, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-02', 10, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-02', 11, '12.30', '12.45', 'Otto Party'),
('2026-06-02', 12, '17.00', '17.15', 'Otto Party'),
('2026-06-02', 13, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-02', 14, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-02', 15, '16.05', '16.30', 'Hall of Fame'),
('2026-06-02', 16, '15.00', '15.25', 'Ultimo Pan');

/* --- 3 GIUGNO 2026 (Repliche 17-24) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-03', 17, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-03', 18, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-03', 19, '12.30', '12.45', 'Otto Party'),
('2026-06-03', 20, '17.00', '17.15', 'Otto Party'),
('2026-06-03', 21, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-03', 22, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-03', 23, '16.05', '16.30', 'Hall of Fame'),
('2026-06-03', 24, '15.00', '15.25', 'Ultimo Pan');

/* --- 4 GIUGNO 2026 (Repliche 25-32) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-04', 25, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-04', 26, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-04', 27, '12.30', '12.45', 'Otto Party'),
('2026-06-04', 28, '17.00', '17.15', 'Otto Party'),
('2026-06-04', 29, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-04', 30, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-04', 31, '16.05', '16.30', 'Hall of Fame'),
('2026-06-04', 32, '15.00', '15.25', 'Ultimo Pan');

/* --- 5 GIUGNO 2026 (Repliche 33-40) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-05', 33, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-05', 34, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-05', 35, '12.30', '12.45', 'Otto Party'),
('2026-06-05', 36, '17.00', '17.15', 'Otto Party'),
('2026-06-05', 37, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-05', 38, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-05', 39, '16.05', '16.30', 'Hall of Fame'),
('2026-06-05', 40, '15.00', '15.25', 'Ultimo Pan');

/* --- 6 GIUGNO 2026 (Repliche 41-48) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-06', 41, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-06', 42, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-06', 43, '12.30', '12.45', 'Otto Party'),
('2026-06-06', 44, '17.00', '17.15', 'Otto Party'),
('2026-06-06', 45, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-06', 46, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-06', 47, '16.05', '16.30', 'Hall of Fame'),
('2026-06-06', 48, '15.00', '15.25', 'Ultimo Pan');

/* --- 7 GIUGNO 2026 (Repliche 49-56) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-07', 49, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-07', 50, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-07', 51, '12.30', '12.45', 'Otto Party'),
('2026-06-07', 52, '17.00', '17.15', 'Otto Party'),
('2026-06-07', 53, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-07', 54, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-07', 55, '16.05', '16.30', 'Hall of Fame'),
('2026-06-07', 56, '15.00', '15.25', 'Ultimo Pan');

/* --- 8 GIUGNO 2026 (Repliche 57-64) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-08', 57, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-08', 58, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-08', 59, '12.30', '12.45', 'Otto Party'),
('2026-06-08', 60, '17.00', '17.15', 'Otto Party'),
('2026-06-08', 61, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-08', 62, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-08', 63, '16.05', '16.30', 'Hall of Fame'),
('2026-06-08', 64, '15.00', '15.25', 'Ultimo Pan');

/* --- 9 GIUGNO 2026 (Repliche 65-72) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-09', 65, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-09', 66, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-09', 67, '12.30', '12.45', 'Otto Party'),
('2026-06-09', 68, '17.00', '17.15', 'Otto Party'),
('2026-06-09', 69, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-09', 70, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-09', 71, '16.05', '16.30', 'Hall of Fame'),
('2026-06-09', 72, '15.00', '15.25', 'Ultimo Pan');

/* --- 10 GIUGNO 2026 (Repliche 73-80) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-10', 73, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-10', 74, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-10', 75, '12.30', '12.45', 'Otto Party'),
('2026-06-10', 76, '17.00', '17.15', 'Otto Party'),
('2026-06-10', 77, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-10', 78, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-10', 79, '16.05', '16.30', 'Hall of Fame'),
('2026-06-10', 80, '15.00', '15.25', 'Ultimo Pan');

/* --- 11 GIUGNO 2026 (Repliche 81-88) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-11', 81, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-11', 82, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-11', 83, '12.30', '12.45', 'Otto Party'),
('2026-06-11', 84, '17.00', '17.15', 'Otto Party'),
('2026-06-11', 85, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-11', 86, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-11', 87, '16.05', '16.30', 'Hall of Fame'),
('2026-06-11', 88, '15.00', '15.25', 'Ultimo Pan');

/* --- 12 GIUGNO 2026 (Repliche 89-96) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-12', 89, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-12', 90, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-12', 91, '12.30', '12.45', 'Otto Party'),
('2026-06-12', 92, '17.00', '17.15', 'Otto Party'),
('2026-06-12', 93, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-12', 94, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-12', 95, '16.05', '16.30', 'Hall of Fame'),
('2026-06-12', 96, '15.00', '15.25', 'Ultimo Pan');

/* --- 13 GIUGNO 2026 (Repliche 97-104) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-13', 97, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-13', 98, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-13', 99, '12.30', '12.45', 'Otto Party'),
('2026-06-13', 100, '17.00', '17.15', 'Otto Party'),
('2026-06-13', 101, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-13', 102, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-13', 103, '16.05', '16.30', 'Hall of Fame'),
('2026-06-13', 104, '15.00', '15.25', 'Ultimo Pan');

/* --- 14 GIUGNO 2026 (Repliche 105-112) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-14', 105, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-14', 106, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-14', 107, '12.30', '12.45', 'Otto Party'),
('2026-06-14', 108, '17.00', '17.15', 'Otto Party'),
('2026-06-14', 109, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-14', 110, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-14', 111, '16.05', '16.30', 'Hall of Fame'),
('2026-06-14', 112, '15.00', '15.25', 'Ultimo Pan');

/* --- 15 GIUGNO 2026 (Repliche 113-120) --- */
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES 
('2026-06-15', 113, '11.30', '12.05', 'Scuola di Polizia'),
('2026-06-15', 114, '14.30', '15.05', 'Scuola di Polizia'),
('2026-06-15', 115, '12.30', '12.45', 'Otto Party'),
('2026-06-15', 116, '17.00', '17.15', 'Otto Party'),
('2026-06-15', 117, '11.00', '11.30', 'Hot Wheels City'),
('2026-06-15', 118, '18.00', '18.30', 'Hot Wheels City'),
('2026-06-15', 119, '16.05', '16.30', 'Hall of Fame'),
('2026-06-15', 120, '15.00', '15.25', 'Ultimo Pan');
/* Area Tematica */
INSERT INTO AREA_TEMATICA(nomeAreaTematica, CF, disponibilita, tema, dataInizio, dataFine) VALUES 
('Adventureland', null, 1, 'avventura e natura', '2026-04-01', '2026-10-31'),
('Nickelodeon Land', null, 1, 'cartoni animati Nickelodeon', '2026-04-01', '2026-10-31'), 
('Ducati World', null, 1, 'Ducati e moto', '2026-04-01', '2026-10-31'),
('FarWest Valley', null, 1, 'farwest', '2026-04-01', '2026-10-31'),
('Route 66', null, 1, 'Viaggio e USA', '2025-04-01', '2025-10-31');

/* Evento */
INSERT INTO EVENTO(codiceEvento, nomeEvento, tematica, oraInizio, oraFine, data) VALUES
(1, 'Summer Beach Party', 'estate e musica', '17.30', '22.30', '2026-06-08'),
(2, 'Schiuma Party', 'schiuma e musica', '16.30', '20.30','2026-05-22' ),
(3, 'Cosplay Wonder', 'travestimento, anime', '11.30', '15.30', '2026-04-27'),
(4, 'La Grande Caccia alle Uova', 'pasqua e uova', '14.00', '18.00', '2026-04-06'),
(5, 'Spring Street Art Festival', 'primavera e arte', '11.00', '16.30', '2026-05-10');

/*Partecipazioni, fatte di conseguenze dei biglietti generati dalla fra (18/01/26)*/
/* --- 1/5 dei visitatori (20) su Attrazioni di Paura --- */
INSERT INTO PARTECIPAZIONE(codicePartecipazione, orario, data, codiceReplica, CF, nomeRuota, nomeAreaTematica, nomeAttrazzionePaura) VALUES
(1, '10:00:00', '2026-06-04', NULL, 'MR12AB', NULL, NULL, 'Phobia'),
(2, '10:04:48', '2026-06-04', NULL, 'AV22EF', NULL, NULL, 'Zombie Tunnel'),
(3, '10:09:36', '2026-06-04', NULL, 'SF30KL', NULL, NULL, 'Acid Rain'),
(4, '10:14:24', '2026-06-04', NULL, 'PR14MN', NULL, NULL, 'Acid Rain'),
(5, '10:19:12', '2026-06-04', NULL, 'ER03OP', NULL, NULL, 'Zombie Tunnel'),
(6, '10:24:00', '2026-06-04', NULL, 'DC27QR', NULL, NULL, 'Zombie Tunnel'),
(7, '10:28:48', '2026-06-04', NULL, 'FM16ST', NULL, NULL, 'Horror Forest'),
(8, '10:33:36', '2026-06-04', NULL, 'AC11UV', NULL, NULL, 'Horror Forest'),
(9, '10:38:24', '2026-06-04', NULL, 'CG24WX', NULL, NULL, 'Phobia'),
(10, '10:43:12', '2026-06-04', NULL, 'SR02YZ', NULL, NULL, 'Phobia'),
(11, '10:48:00', '2026-06-04', NULL, 'ML19AA', NULL, NULL, 'Acid Rain'),
(12, '10:52:48', '2026-06-04', NULL, 'SF06DD', NULL, NULL, 'Phobia'),
(13, '10:57:36', '2026-06-04', NULL, 'LD13EE', NULL, NULL, 'Zombie Tunnel'),
(14, '11:02:24', '2026-06-04', NULL, 'MS29FF', NULL, NULL, 'Zombie Tunnel'),
(15, '11:07:12', '2026-06-04', NULL, 'IG21GG', NULL, NULL, 'Horror Forest'),
(16, '11:12:00', '2026-06-04', NULL, 'GF28JJ', NULL, NULL, 'Acid Rain'),
(17, '11:16:48', '2026-06-04', NULL, 'RM23NN', NULL, NULL, 'Phobia'),
(18, '11:21:36', '2026-06-04', NULL, 'CV14OO', NULL, NULL, 'Phobia'),
(19, '11:26:24', '2026-06-04', NULL, 'FL01PP', NULL, NULL, 'Acid Rain'),
(20, '11:31:12', '2026-06-04', NULL, 'TB09RR', NULL, NULL, 'Acid Rain');

/* --- 6/10 dei visitatori (60) sulla Ruota Panoramica --- */
INSERT INTO PARTECIPAZIONE(codicePartecipazione, orario, data, codiceReplica, CF, nomeRuota, nomeAreaTematica, nomeAttrazzionePaura) VALUES
(21, '11:36:00', '2026-06-04', NULL, 'SF26SS', 'AlgigaWheel', NULL, NULL),
(22, '11:40:48', '2026-06-04', NULL, 'EM12YY', 'AlgigaWheel', NULL, NULL),
(23, '11:45:36', '2026-06-04', NULL, 'PC19AZ', 'AlgigaWheel', NULL, NULL),
(24, '11:50:24', '2026-06-04', NULL, 'NV08BA', 'AlgigaWheel', NULL, NULL),
(25, '11:55:12', '2026-06-04', NULL, 'GO24CB', 'AlgigaWheel', NULL, NULL),
(26, '12:00:00', '2026-06-04', NULL, 'FS16DC', 'AlgigaWheel', NULL, NULL),
(27, '12:04:48', '2026-06-04', NULL, 'ED02ED', 'AlgigaWheel', NULL, NULL),
(28, '12:09:36', '2026-06-04', NULL, 'CF11FE', 'AlgigaWheel', NULL, NULL),
(29, '12:14:24', '2026-06-04', NULL, 'SP29GF', 'AlgigaWheel', NULL, NULL),
(30, '12:19:12', '2026-06-04', NULL, 'IG05HG', 'AlgigaWheel', NULL, NULL),
(31, '12:24:00', '2026-06-04', NULL, 'AR23JI', 'AlgigaWheel', NULL, NULL),
(32, '12:28:48', '2026-06-04', NULL, 'GF10ML', 'AlgigaWheel', NULL, NULL),
(33, '12:33:36', '2026-06-04', NULL, 'RN21NM', 'AlgigaWheel', NULL, NULL),
(34, '12:38:24', '2026-06-04', NULL, 'LM05OP', 'AlgigaWheel', NULL, NULL),
(35, '12:43:12', '2026-06-04', NULL, 'AB15PQ', 'AlgigaWheel', NULL, NULL),
(36, '12:48:00', '2026-06-04', NULL, 'MF22QR', 'AlgigaWheel', NULL, NULL),
(37, '12:52:48', '2026-06-04', NULL, 'EL28RS', 'AlgigaWheel', NULL, NULL),
(38, '12:57:36', '2026-06-04', NULL, 'DP11ST', 'AlgigaWheel', NULL, NULL),
(39, '13:02:24', '2026-06-04', NULL, 'FV30UV', 'AlgigaWheel', NULL, NULL),
(40, '13:07:12', '2026-06-04', NULL, 'MB10XY', 'AlgigaWheel', NULL, NULL),
(41, '13:12:00', '2026-06-04', NULL, 'AF25YZ', 'AlgigaWheel', NULL, NULL),
(42, '13:16:48', '2026-06-04', NULL, 'CP19ZA', 'AlgigaWheel', NULL, NULL),
(43, '13:21:36', '2026-06-04', NULL, 'AS14AB', 'AlgigaWheel', NULL, NULL),
(44, '13:26:24', '2026-06-04', NULL, 'VA23BC', 'AlgigaWheel', NULL, NULL),
(45, '13:31:12', '2026-06-04', NULL, 'IF10DE', 'AlgigaWheel', NULL, NULL),
(46, '13:36:00', '2026-06-04', NULL, 'MM01EF', 'AlgigaWheel', NULL, NULL),
(47, '13:40:48', '2026-06-04', NULL, 'EC17FG', 'AlgigaWheel', NULL, NULL),
(48, '13:45:36', '2026-06-04', NULL, 'NV28GH', 'AlgigaWheel', NULL, NULL),
(49, '13:50:24', '2026-06-04', NULL, 'BO13HI', 'AlgigaWheel', NULL, NULL),
(50, '13:55:12', '2026-06-04', NULL, 'GS04IJ', 'AlgigaWheel', NULL, NULL),
(51, '14:00:00', '2026-06-04', NULL, 'AF16KL', 'AlgigaWheel', NULL, NULL),
(52, '14:04:48', '2026-06-04', NULL, 'CM07NO', 'AlgigaWheel', NULL, NULL),
(53, '14:09:36', '2026-06-04', NULL, 'AB05PQ', 'AlgigaWheel', NULL, NULL),
(54, '14:14:24', '2026-06-04', NULL, 'TP20QR', 'AlgigaWheel', NULL, NULL),
(55, '14:19:12', '2026-06-04', NULL, 'SF06RS', 'AlgigaWheel', NULL, NULL),
(56, '14:24:00', '2026-06-04', NULL, 'EN13ST', 'AlgigaWheel', NULL, NULL),
(57, '14:28:48', '2026-06-04', NULL, 'GM30TU', 'AlgigaWheel', NULL, NULL),
(58, '14:33:36', '2026-06-04', NULL, 'DB08UV', 'AlgigaWheel', NULL, NULL),
(59, '14:38:24', '2026-06-04', NULL, 'VF01VW', 'AlgigaWheel', NULL, NULL),
(60, '14:43:12', '2026-06-04', NULL, 'RL11WX', 'AlgigaWheel', NULL, NULL),
(61, '14:48:00', '2026-06-04', NULL, 'EP18XY', 'AlgigaWheel', NULL, NULL),
(62, '14:52:48', '2026-06-04', NULL, 'PM02YZ', 'AlgigaWheel', NULL, NULL),
(63, '14:57:36', '2026-06-04', NULL, 'GL12AB', 'AlgigaWheel', NULL, NULL),
(64, '15:02:24', '2026-06-04', NULL, 'FC06BC', 'AlgigaWheel', NULL, NULL),
(65, '15:07:12', '2026-06-04', NULL, 'EB15CD', 'AlgigaWheel', NULL, NULL),
(66, '15:12:00', '2026-06-04', NULL, 'IS19FG', 'AlgigaWheel', NULL, NULL),
(67, '15:16:48', '2026-06-04', NULL, 'CA28GH', 'AlgigaWheel', NULL, NULL),
(68, '15:21:36', '2026-06-04', NULL, 'AC12HI', 'AlgigaWheel', NULL, NULL),
(69, '15:26:24', '2026-06-04', NULL, 'LF21IJ', 'AlgigaWheel', NULL, NULL),
(70, '15:31:12', '2026-06-04', NULL, 'CR17LM', 'AlgigaWheel', NULL, NULL),
(71, '15:36:00', '2026-06-04', NULL, 'LP25MN', 'AlgigaWheel', NULL, NULL),
(72, '15:40:48', '2026-06-04', NULL, 'VS04NO', 'AlgigaWheel', NULL, NULL),
(73, '15:45:36', '2026-06-04', NULL, 'FG11PQ', 'AlgigaWheel', NULL, NULL),
(74, '15:50:24', '2026-06-04', NULL, 'GM27ST', 'AlgigaWheel', NULL, NULL),
(75, '15:55:12', '2026-06-04', NULL, 'IP15TU', 'AlgigaWheel', NULL, NULL),
(76, '16:00:00', '2026-06-04', NULL, 'SR03UV', 'AlgigaWheel', NULL, NULL),
(77, '16:04:48', '2026-06-04', NULL, 'RB29WX', 'AlgigaWheel', NULL, NULL),
(78, '16:09:36', '2026-06-04', NULL, 'AL14YZ', 'AlgigaWheel', NULL, NULL),
(79, '16:14:24', '2026-06-04', NULL, 'TP20ZZ', 'AlgigaWheel', NULL, NULL),
(80, '16:19:12', '2026-06-04', NULL, 'LF12CD', 'AlgigaWheel', NULL, NULL);

/* --- 4/10 dei visitatori (40) in Area Tematica --- */
INSERT INTO PARTECIPAZIONE(codicePartecipazione, orario, data, codiceReplica, CF, nomeRuota, nomeAreaTematica, nomeAttrazzionePaura) VALUES
(81, '16:24:00', '2026-06-04', NULL, 'SM06DE', NULL, 'Adventureland', NULL),
(82, '16:28:48', '2026-06-04', NULL, 'GR11EF', NULL, 'Nickelodeon Land', NULL),
(83, '16:33:36', '2026-06-04', NULL, 'ES19GH', NULL, 'Ducati World', NULL),
(84, '16:38:24', '2026-06-04', NULL, 'CM04HI', NULL, 'FarWest Valley', NULL),
(85, '16:43:12', '2026-06-04', NULL, 'SR28IJ', NULL, 'Route 66', NULL),
(86, '16:48:00', '2026-06-04', NULL, 'CV05KL', NULL, 'Adventureland', NULL),
(87, '16:52:48', '2026-06-04', NULL, 'AL17LM', NULL, 'Nickelodeon Land', NULL),
(88, '16:57:36', '2026-06-04', NULL, 'LC29MN', NULL, 'Ducati World', NULL),
(89, '17:02:24', '2026-06-04', NULL, 'SB09NO', NULL, 'FarWest Valley', NULL),
(90, '17:07:12', '2026-06-04', NULL, 'MF06OP', NULL, 'FarWest Valley', NULL),
(91, '17:12:00', '2026-06-04', NULL, 'CN22PQ', NULL, 'Adventureland', NULL),
(92, '17:16:48', '2026-06-04', NULL, 'LM15QR', NULL, 'Nickelodeon Land', NULL),
(93, '17:21:36', '2026-06-04', NULL, 'VB03ST', NULL, 'Ducati World', NULL),
(94, '17:26:24', '2026-06-04', NULL, 'AF11TU', NULL, 'FarWest Valley', NULL),
(95, '17:31:12', '2026-06-04', NULL, 'FR19UV', NULL, 'FarWest Valley', NULL),
(96, '17:36:00', '2026-06-04', NULL, 'DL30VW', NULL, 'Adventureland', NULL),
(97, '17:40:48', '2026-06-04', NULL, 'EP21WX', NULL, 'Nickelodeon Land', NULL),
(98, '17:45:36', '2026-06-04', NULL, 'GM05XY', NULL, 'Ducati World', NULL),
(99, '17:50:24', '2026-06-04', NULL, 'IV14YZ', NULL, 'FarWest Valley', NULL),
(100, '17:55:12', '2026-06-04', NULL, 'SB07ZA', NULL, 'FarWest Valley', NULL),
(101, '10:00:00', '2026-06-04', NULL, 'MR12AB', NULL, 'Adventureland', NULL),
(102, '10:04:48', '2026-06-04', NULL, 'AV22EF', NULL, 'Nickelodeon Land', NULL),
(103, '10:09:36', '2026-06-04', NULL, 'SF30KL', NULL, 'Ducati World', NULL),
(104, '10:14:24', '2026-06-04', NULL, 'PR14MN', NULL, 'FarWest Valley', NULL),
(105, '10:19:12', '2026-06-04', NULL, 'ER03OP', NULL, 'Ducati World', NULL),
(106, '10:24:00', '2026-06-04', NULL, 'DC27QR', NULL, 'Adventureland', NULL),
(107, '10:28:48', '2026-06-04', NULL, 'FM16ST', NULL, 'Nickelodeon Land', NULL),
(108, '10:33:36', '2026-06-04', NULL, 'AC11UV', NULL, 'Ducati World', NULL),
(109, '10:38:24', '2026-06-04', NULL, 'CG24WX', NULL, 'FarWest Valley', NULL),
(110, '10:43:12', '2026-06-04', NULL, 'SR02YZ', NULL, 'Ducati World', NULL),
(111, '10:48:00', '2026-06-04', NULL, 'ML19AA', NULL, 'Adventureland', NULL),
(112, '10:52:48', '2026-06-04', NULL, 'SF06DD', NULL, 'Nickelodeon Land', NULL),
(113, '10:57:36', '2026-06-04', NULL, 'LD13EE', NULL, 'Ducati World', NULL),
(114, '11:02:24', '2026-06-04', NULL, 'MS29FF', NULL, 'FarWest Valley', NULL),
(115, '11:07:12', '2026-06-04', NULL, 'IG21GG', NULL, 'Ducati World', NULL),
(116, '11:12:00', '2026-06-04', NULL, 'GF28JJ', NULL, 'Adventureland', NULL),
(117, '11:16:48', '2026-06-04', NULL, 'RM23NN', NULL, 'Nickelodeon Land', NULL),
(118, '11:21:36', '2026-06-04', NULL, 'CV14OO', NULL, 'Ducati World', NULL),
(119, '11:26:24', '2026-06-04', NULL, 'FL01PP', NULL, 'FarWest Valley', NULL),
(120, '11:31:12', '2026-06-04', NULL, 'TB09RR', NULL, 'Ducati World', NULL);

/* Salita */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('MR12AB', 'Reset', '2026-06-04', '11:10:00'),
('MR12AB', 'Rio Bravo', '2026-06-04', '12:15:00'),
('MR12AB', 'Autosplash', '2026-06-04', '13:20:00'),
('MR12AB', 'El Dorado Falls', '2026-06-04', '14:25:00'),
('MR12AB', 'Raratonga', '2026-06-04', '15:30:00'),
('MR12AB', 'Rubble''s Rapids', '2026-06-04', '16:35:00');

/* 2. AV22EF */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('AV22EF', 'Reset', '2026-06-04', '11:12:00'),
('AV22EF', 'Rio Bravo', '2026-06-04', '12:17:00'),
('AV22EF', 'Autosplash', '2026-06-04', '13:22:00'),
('AV22EF', 'El Dorado Falls', '2026-06-04', '14:27:00'),
('AV22EF', 'Raratonga', '2026-06-04', '15:32:00'),
('AV22EF', 'Rubble''s Rapids', '2026-06-04', '16:37:00');

/* 3. SF30KL */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('SF30KL', 'Reset', '2026-06-04', '11:14:00'),
('SF30KL', 'Rio Bravo', '2026-06-04', '12:19:00'),
('SF30KL', 'Autosplash', '2026-06-04', '13:24:00'),
('SF30KL', 'El Dorado Falls', '2026-06-04', '14:29:00'),
('SF30KL', 'Raratonga', '2026-06-04', '15:34:00'),
('SF30KL', 'Rubble''s Rapids', '2026-06-04', '16:39:00');

/* 4. PR14MN */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('PR14MN', 'Reset', '2026-06-04', '11:16:00'),
('PR14MN', 'Rio Bravo', '2026-06-04', '12:21:00'),
('PR14MN', 'Autosplash', '2026-06-04', '13:26:00'),
('PR14MN', 'El Dorado Falls', '2026-06-04', '14:31:00'),
('PR14MN', 'Raratonga', '2026-06-04', '15:36:00'),
('PR14MN', 'Rubble''s Rapids', '2026-06-04', '16:41:00');

/* 5. ER03OP */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('ER03OP', 'Reset', '2026-06-04', '11:18:00'),
('ER03OP', 'Rio Bravo', '2026-06-04', '12:23:00'),
('ER03OP', 'Autosplash', '2026-06-04', '13:28:00'),
('ER03OP', 'El Dorado Falls', '2026-06-04', '14:33:00'),
('ER03OP', 'Raratonga', '2026-06-04', '15:38:00'),
('ER03OP', 'Rubble''s Rapids', '2026-06-04', '16:43:00');

/* 6. DC27QR */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('DC27QR', 'Reset', '2026-06-04', '11:20:00'),
('DC27QR', 'Rio Bravo', '2026-06-04', '12:25:00'),
('DC27QR', 'Autosplash', '2026-06-04', '13:30:00'),
('DC27QR', 'El Dorado Falls', '2026-06-04', '14:35:00'),
('DC27QR', 'Raratonga', '2026-06-04', '15:40:00'),
('DC27QR', 'Rubble''s Rapids', '2026-06-04', '16:45:00');

/* 7. FM16ST */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('FM16ST', 'Reset', '2026-06-04', '11:22:00'),
('FM16ST', 'Rio Bravo', '2026-06-04', '12:27:00'),
('FM16ST', 'Autosplash', '2026-06-04', '13:32:00'),
('FM16ST', 'El Dorado Falls', '2026-06-04', '14:37:00'),
('FM16ST', 'Raratonga', '2026-06-04', '15:42:00'),
('FM16ST', 'Rubble''s Rapids', '2026-06-04', '16:47:00');

/* 8. AC11UV */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('AC11UV', 'Reset', '2026-06-04', '11:24:00'),
('AC11UV', 'Rio Bravo', '2026-06-04', '12:29:00'),
('AC11UV', 'Autosplash', '2026-06-04', '13:34:00'),
('AC11UV', 'El Dorado Falls', '2026-06-04', '14:39:00'),
('AC11UV', 'Raratonga', '2026-06-04', '15:44:00'),
('AC11UV', 'Rubble''s Rapids', '2026-06-04', '16:49:00');

/* 9. CG24WX */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('CG24WX', 'Reset', '2026-06-04', '11:26:00'),
('CG24WX', 'Rio Bravo', '2026-06-04', '12:31:00'),
('CG24WX', 'Autosplash', '2026-06-04', '13:36:00'),
('CG24WX', 'El Dorado Falls', '2026-06-04', '14:41:00'),
('CG24WX', 'Raratonga', '2026-06-04', '15:46:00'),
('CG24WX', 'Rubble''s Rapids', '2026-06-04', '16:51:00');

/* 10. SR02YZ */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('SR02YZ', 'Reset', '2026-06-04', '11:28:00'),
('SR02YZ', 'Rio Bravo', '2026-06-04', '12:33:00'),
('SR02YZ', 'Autosplash', '2026-06-04', '13:38:00'),
('SR02YZ', 'El Dorado Falls', '2026-06-04', '14:43:00'),
('SR02YZ', 'Raratonga', '2026-06-04', '15:48:00'),
('SR02YZ', 'Rubble''s Rapids', '2026-06-04', '16:53:00');

/* 11. ML19AA */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('ML19AA', 'Reset', '2026-06-04', '11:30:00'),
('ML19AA', 'Rio Bravo', '2026-06-04', '12:35:00'),
('ML19AA', 'Autosplash', '2026-06-04', '13:40:00'),
('ML19AA', 'El Dorado Falls', '2026-06-04', '14:45:00'),
('ML19AA', 'Raratonga', '2026-06-04', '15:50:00'),
('ML19AA', 'Rubble''s Rapids', '2026-06-04', '16:55:00');

/* 12. SF06DD */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('SF06DD', 'Reset', '2026-06-04', '11:32:00'),
('SF06DD', 'Rio Bravo', '2026-06-04', '12:37:00'),
('SF06DD', 'Autosplash', '2026-06-04', '13:42:00'),
('SF06DD', 'El Dorado Falls', '2026-06-04', '14:47:00'),
('SF06DD', 'Raratonga', '2026-06-04', '15:52:00'),
('SF06DD', 'Rubble''s Rapids', '2026-06-04', '16:57:00');

/* 13. LD13EE */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('LD13EE', 'Reset', '2026-06-04', '11:34:00'),
('LD13EE', 'Rio Bravo', '2026-06-04', '12:39:00'),
('LD13EE', 'Autosplash', '2026-06-04', '13:44:00'),
('LD13EE', 'El Dorado Falls', '2026-06-04', '14:49:00'),
('LD13EE', 'Raratonga', '2026-06-04', '15:54:00'),
('LD13EE', 'Rubble''s Rapids', '2026-06-04', '16:59:00');

/* 14. MS29FF */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('MS29FF', 'Reset', '2026-06-04', '11:36:00'),
('MS29FF', 'Rio Bravo', '2026-06-04', '12:41:00'),
('MS29FF', 'Autosplash', '2026-06-04', '13:46:00'),
('MS29FF', 'El Dorado Falls', '2026-06-04', '14:51:00'),
('MS29FF', 'Raratonga', '2026-06-04', '15:56:00'),
('MS29FF', 'Rubble''s Rapids', '2026-06-04', '17:01:00');

/* 15. IG21GG */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('IG21GG', 'Reset', '2026-06-04', '11:38:00'),
('IG21GG', 'Rio Bravo', '2026-06-04', '12:43:00'),
('IG21GG', 'Autosplash', '2026-06-04', '13:48:00'),
('IG21GG', 'El Dorado Falls', '2026-06-04', '14:53:00'),
('IG21GG', 'Raratonga', '2026-06-04', '15:58:00'),
('IG21GG', 'Rubble''s Rapids', '2026-06-04', '17:03:00');

/* 16. GF28JJ */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('GF28JJ', 'Reset', '2026-06-04', '11:40:00'),
('GF28JJ', 'Rio Bravo', '2026-06-04', '12:45:00'),
('GF28JJ', 'Autosplash', '2026-06-04', '13:50:00'),
('GF28JJ', 'El Dorado Falls', '2026-06-04', '14:55:00'),
('GF28JJ', 'Raratonga', '2026-06-04', '16:00:00'),
('GF28JJ', 'Rubble''s Rapids', '2026-06-04', '17:05:00');

/* 17. RM23NN */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('RM23NN', 'Reset', '2026-06-04', '11:42:00'),
('RM23NN', 'Rio Bravo', '2026-06-04', '12:47:00'),
('RM23NN', 'Autosplash', '2026-06-04', '13:52:00'),
('RM23NN', 'El Dorado Falls', '2026-06-04', '14:57:00'),
('RM23NN', 'Raratonga', '2026-06-04', '16:02:00'),
('RM23NN', 'Rubble''s Rapids', '2026-06-04', '17:07:00');

/* 18. CV14OO */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('CV14OO', 'Reset', '2026-06-04', '11:44:00'),
('CV14OO', 'Rio Bravo', '2026-06-04', '12:49:00'),
('CV14OO', 'Autosplash', '2026-06-04', '13:54:00'),
('CV14OO', 'El Dorado Falls', '2026-06-04', '14:59:00'),
('CV14OO', 'Raratonga', '2026-06-04', '16:04:00'),
('CV14OO', 'Rubble''s Rapids', '2026-06-04', '17:09:00');

/* 19. FL01PP */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('FL01PP', 'Reset', '2026-06-04', '11:46:00'),
('FL01PP', 'Rio Bravo', '2026-06-04', '12:51:00'),
('FL01PP', 'Autosplash', '2026-06-04', '13:56:00'),
('FL01PP', 'El Dorado Falls', '2026-06-04', '15:01:00'),
('FL01PP', 'Raratonga', '2026-06-04', '16:06:00'),
('FL01PP', 'Rubble''s Rapids', '2026-06-04', '17:11:00');

/* 20. TB09RR */
INSERT INTO SALITA(CF, nomeGiostra, data, orario) VALUES
('TB09RR', 'Reset', '2026-06-04', '11:48:00'),
('TB09RR', 'Rio Bravo', '2026-06-04', '12:53:00'),
('TB09RR', 'Autosplash', '2026-06-04', '13:58:00'),
('TB09RR', 'El Dorado Falls', '2026-06-04', '15:03:00'),
('TB09RR', 'Raratonga', '2026-06-04', '16:08:00'),
('TB09RR', 'Rubble''s Rapids', '2026-06-04', '17:13:00');

/* --- COLAZIONI E ACQUISTI MATTUTINI (10:00 - 11:50) --- */
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (2, 'MR12AB', 'Colazione Cappuccino e Brioche', 5.50, '2026-06-04', '10:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'LB05CD', 'Mappa del Parco e Magnete', 8.00, '2026-06-04', '10:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (2, 'AV22EF', 'Caffè Espresso', 1.50, '2026-06-04', '10:25:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (57, 'GN09GH', 'Peluche Orso Gigante', 29.99, '2026-06-04', '10:40:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'MG18IJ', 'T-Shirt Mirabilandia', 19.90, '2026-06-04', '10:50:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (9, 'SF30KL', 'Porzione Churros Cioccolato', 6.50, '2026-06-04', '11:05:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (2, 'PR14MN', 'Succo di Frutta e Muffin', 6.00, '2026-06-04', '11:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (56, 'ER03OP', 'Cappellino Ducati', 25.00, '2026-06-04', '11:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (53, 'DC27QR', 'Spada Laser Giocattolo', 15.90, '2026-06-04', '11:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (16, 'FM16ST', 'Sacchetto Caramelle Miste 200g', 5.90, '2026-06-04', '11:50:00');

/* --- PRANZO (12:00 - 14:30) --- */
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (8, 'AC11UV', 'Menu Big Mac Large', 11.90, '2026-06-04', '12:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (8, 'CG24WX', 'Happy Meal', 7.50, '2026-06-04', '12:12:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (5, 'SR02YZ', 'Katun Burger Menu', 14.50, '2026-06-04', '12:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (5, 'ML19AA', 'Cheeseburger e Patatine', 12.00, '2026-06-04', '12:18:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (4, 'FM08BB', 'Trancio Pizza Margherita e Coca', 8.50, '2026-06-04', '12:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (4, 'VB25CC', 'Trancio Pizza Diavola', 5.50, '2026-06-04', '12:22:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (13, 'SF06DD', 'Pizza Tonda 4 Stagioni', 13.00, '2026-06-04', '12:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (13, 'LD13EE', 'Pizza Tonda Wurstel', 11.50, '2026-06-04', '12:35:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (15, 'MS29FF', 'Lasagna alla Bolognese', 14.00, '2026-06-04', '12:40:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (15, 'IG21GG', 'Tortellini Panna e Prosciutto', 13.50, '2026-06-04', '12:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (3, 'NT17HH', 'Sushi Box Mix 12pz', 18.90, '2026-06-04', '12:50:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (3, 'BP04II', 'Ramen Tonkotsu', 15.00, '2026-06-04', '12:55:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (6, 'GF28JJ', 'Costine BBQ con Pannocchia', 19.90, '2026-06-04', '13:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (6, 'SR10KK', 'Pollo Arrosto e Patate', 16.50, '2026-06-04', '13:05:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (7, 'AL15LL', 'Tacos di Manzo x3', 12.50, '2026-06-04', '13:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (7, 'MP07MM', 'Nachos con Formaggio e Jalapenos', 8.50, '2026-06-04', '13:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (1, 'RM23NN', 'Bistecca Fiorentina 500g', 28.00, '2026-06-04', '13:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (1, 'CV14OO', 'Grigliata Mista Carne', 24.00, '2026-06-04', '13:25:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (12, 'FL01PP', 'Spaghetti Carbonara', 12.00, '2026-06-04', '13:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (12, 'AC18QQ', 'Cotoletta e Patatine', 14.00, '2026-06-04', '13:35:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (8, 'TB09RR', 'McChicken Menu', 10.50, '2026-06-04', '13:40:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (5, 'SF26SS', 'Insalata Caesar con Pollo', 11.00, '2026-06-04', '13:50:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (4, 'EP03TT', 'Focaccia Ripiena', 7.00, '2026-06-04', '14:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (8, 'GS20UU', 'Chicken McNuggets 9pz', 6.50, '2026-06-04', '14:10:00');

/* --- POMERIGGIO: SNACK, GELATI E SOUVENIR (14:30 - 18:30) --- */
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (14, 'DA31VV', 'Gelato Artigianale 3 Gusti', 4.50, '2026-06-04', '14:40:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (14, 'VC27WW', 'Granita Limone', 3.50, '2026-06-04', '14:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (51, 'RF06XX', 'Dinosauro T-Rex Snodabile', 18.00, '2026-06-04', '15:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (51, 'EM12YY', 'Uovo di Dinosauro Magico', 5.00, '2026-06-04', '15:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (10, 'PC19AZ', 'Pretzel Salato Classico', 4.50, '2026-06-04', '15:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (10, 'NV08BA', 'Pretzel al Formaggio', 5.50, '2026-06-04', '15:25:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (54, 'GO24CB', 'Bandana Pirata', 7.00, '2026-06-04', '15:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (54, 'FS16DC', 'Monete d''Oro Cioccolato', 4.00, '2026-06-04', '15:35:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (55, 'ED02ED', 'Ali da Fata Glitter', 12.90, '2026-06-04', '15:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (55, 'CF11FE', 'Bacchetta Magica Luminosa', 10.00, '2026-06-04', '15:50:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (11, 'SP29GF', 'Popcorn Maxibag', 6.00, '2026-06-04', '16:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (11, 'IG05HG', 'Bibita XL Refill', 5.00, '2026-06-04', '16:05:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (52, 'CM14IH', 'Cappello da Cowboy', 14.90, '2026-06-04', '16:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (52, 'AR23JI', 'Pistola Giocattolo West', 9.90, '2026-06-04', '16:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (16, 'LB30KJ', 'Lecca Lecca Gigante', 4.50, '2026-06-04', '16:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (14, 'SP09LK', 'Coppa Gelato Mista', 5.50, '2026-06-04', '16:40:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (56, 'GF10ML', 'Modellino Moto Ducati', 22.00, '2026-06-04', '16:50:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (56, 'RN21NM', 'Portachiavi Casco', 6.50, '2026-06-04', '16:55:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (53, 'LM05OP', 'Maschera Alieno', 8.90, '2026-06-04', '17:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (53, 'AB15PQ', 'Robot Giocattolo', 19.90, '2026-06-04', '17:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (57, 'MF22QR', 'Cuscino Morbido', 15.00, '2026-06-04', '17:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (9, 'EL28RS', 'Churros Semplici', 5.00, '2026-06-04', '17:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'DP11ST', 'Felpa con Cappuccio', 35.00, '2026-06-04', '18:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'GM07TU', 'Tazza Mug Personalizzata', 9.90, '2026-06-04', '18:15:00');

/* --- CENA E SERATA (19:00 - 22:00) --- */
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (13, 'FV30UV', 'Pizza Bufala e Pomodorini', 14.00, '2026-06-04', '19:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (13, 'SL02VW', 'Calzone Farcito', 12.50, '2026-06-04', '19:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (8, 'TC18WX', 'Crispy McBacon Menu', 11.50, '2026-06-04', '19:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (8, 'MB10XY', 'Chicken Salad', 9.00, '2026-06-04', '19:25:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (6, 'AF25YZ', 'Galletto alla Brace', 15.00, '2026-06-04', '19:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (6, 'CP19ZA', 'Panino Pulled Pork', 13.50, '2026-06-04', '19:35:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (7, 'AS14AB', 'Burrito di Pollo', 11.00, '2026-06-04', '19:40:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (7, 'VA23BC', 'Fajitas Miste', 16.00, '2026-06-04', '19:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (5, 'SC05CD', 'Double Burger Menu', 16.50, '2026-06-04', '19:50:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (5, 'IF10DE', 'Veggie Burger Menu', 13.50, '2026-06-04', '19:55:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (1, 'MM01EF', 'Filetto al Pepe Verde', 26.00, '2026-06-04', '20:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (1, 'EC17FG', 'Birra Media alla Spina', 6.00, '2026-06-04', '20:05:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (3, 'NV28GH', 'Barca Sushi 24pz', 35.00, '2026-06-04', '20:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (3, 'BO13HI', 'Edamame e Gyoza', 9.00, '2026-06-04', '20:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (12, 'GS04IJ', 'Gnocchi al Ragù', 11.00, '2026-06-04', '20:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (12, 'SD22JK', 'Tagliere Salumi e Formaggi', 14.00, '2026-06-04', '20:25:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (15, 'AF16KL', 'Melanzane alla Parmigiana', 10.00, '2026-06-04', '20:30:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (15, 'MP09LM', 'Tiramisù della Casa', 6.00, '2026-06-04', '20:35:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (4, 'RG01MN', 'Trancio Pizza Farcito', 6.00, '2026-06-04', '20:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (11, 'CM07NO', 'Popcorn e Bibita Combo', 8.00, '2026-06-04', '21:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (9, 'FR19OP', 'Churros Caramello', 6.50, '2026-06-04', '21:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (14, 'AB05PQ', 'Frappè alla Fragola', 5.00, '2026-06-04', '21:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (10, 'TP20QR', 'Pretzel Dolce Cannella', 4.50, '2026-06-04', '21:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (16, 'SF06RS', 'Barretta di Cioccolato', 3.50, '2026-06-04', '21:30:00');

/* --- ACQUISTI LAST MINUTE (21:40 - 22:20) --- */
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'EN13ST', 'Cartolina Notturna', 2.00, '2026-06-04', '21:40:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'GM30TU', 'Portachiavi Logo', 5.00, '2026-06-04', '21:45:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'DB08UV', 'Magneti Set x3', 12.00, '2026-06-04', '21:50:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (57, 'VF01VW', 'Peluche Mascotte Otto', 22.00, '2026-06-04', '21:55:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (56, 'RL11WX', 'Poster Ducati', 8.00, '2026-06-04', '22:00:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (53, 'EP18XY', 'Portachiavi Alieno', 4.50, '2026-06-04', '22:05:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (54, 'PM02YZ', 'Benda Pirata', 3.00, '2026-06-04', '22:10:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (52, 'NV24ZA', 'Stella da Sceriffo', 5.50, '2026-06-04', '22:15:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (2, 'GL12AB', 'Caffè Decaffeinato', 1.60, '2026-06-04', '22:18:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (11, 'FC06BC', 'Acqua Naturale 50cl', 2.00, '2026-06-04', '22:20:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (50, 'EB15CD', 'Felpa Mirabilandia', 39.90, '2026-06-04', '22:25:00');
INSERT INTO USUFRUIZIONE(codiceAttivita, CF, acquisto, prezzoAcquisto, data, orario) VALUES (57, 'CF21DE', 'Cuscino a cuore', 18.00, '2026-06-04', '22:28:00');