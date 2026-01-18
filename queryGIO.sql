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

/* MODIFICA DELLE COLONNA nomeEvento in EVENTO (erano char(20))*/
ALTER TABLE EVENTO
MODIFY COLUMN  nomeEvento CHAR(40);
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
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (1, '2026-05-02', '10.30', 'MR12IL');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (2, '2026-05-15', '14.45', 'LB05QP');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (3, '2026-06-01', '11.15', 'AV22TR');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (4, '2026-05-20', '16.20', 'GN09ZX');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (5, '2026-05-05', '12.00', 'MG18AB');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (6, '2026-06-10', '15.30', 'SF30KL');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (7, '2026-05-28', '13.45', 'PR14MN');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (8, '2026-05-11', '10.15', 'ER03UV');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (9, '2026-06-05', '17.00', 'DC27HJ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (10, '2026-05-08', '11.50', 'FM16OP');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (11, '2026-06-12', '14.10', 'AC11RS');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (12, '2026-05-22', '12.30', 'CG24EE');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (13, '2026-05-03', '15.55', 'SR02WW');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (14, '2026-06-08', '10.40', 'ML19TY');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (15, '2026-05-19', '13.20', 'FM08QA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (16, '2026-05-30', '16.45', 'VB25LO');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (17, '2026-05-14', '11.10', 'SF06XZ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (18, '2026-06-02', '15.15', 'LD13NB');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (19, '2026-05-25', '12.50', 'MS29IK');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (20, '2026-05-07', '14.30', 'IG21PA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (21, '2026-06-14', '10.20', 'NT17ME');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (22, '2026-05-17', '16.00', 'BP04YU');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (23, '2026-05-09', '11.45', 'GF28ER');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (24, '2026-06-06', '13.30', 'SR10CZ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (25, '2026-05-21', '15.10', 'AL15TX');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (26, '2026-05-04', '10.55', 'MP07QQ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (27, '2026-06-11', '14.05', 'RM23VA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (28, '2026-05-27', '12.40', 'CV14BN');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (29, '2026-05-12', '16.30', 'FL01HJ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (30, '2026-06-03', '11.25', 'AC18PS');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (31, '2026-05-24', '15.40', 'TB09RR');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (32, '2026-05-06', '13.15', 'SF26ZZ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (33, '2026-06-13', '10.50', 'EP03KD');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (34, '2026-05-16', '14.25', 'GS20LM');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (35, '2026-05-31', '12.10', 'DA31XY');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (36, '2026-05-10', '16.50', 'VC27TT');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (37, '2026-06-07', '11.35', 'RF06MN');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (38, '2026-05-23', '15.00', 'EM12OP');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (39, '2026-05-01', '13.50', 'PC19AA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (40, '2026-06-09', '10.25', 'NV08SS');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (41, '2026-05-18', '14.55', 'GO24QE');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (42, '2026-05-29', '12.20', 'FS16UV');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (43, '2026-05-13', '16.15', 'ED02KL');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (44, '2026-06-04', '11.05', 'CF11HJ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (45, '2026-05-26', '15.25', 'SP29ZX');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (46, '2026-05-05', '13.40', 'IG05RR');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (47, '2026-06-15', '10.45', 'CM14PP');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (48, '2026-05-20', '14.15', 'AR23NB');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (49, '2026-05-02', '12.35', 'LB30TY');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (50, '2026-06-10', '16.40', 'SP09QA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (51, '2026-05-15', '11.55', 'GF10MN');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (52, '2026-05-30', '15.50', 'RN21OP');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (53, '2026-06-01', '13.00', 'LM05RS');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (54, '2026-05-11', '10.30', 'AB15UV');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (55, '2026-06-05', '14.45', 'MF22KL');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (56, '2026-05-22', '12.00', 'EL28TY');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (57, '2026-05-08', '16.20', 'DP11QA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (58, '2026-06-12', '11.15', 'GM07SS');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (59, '2026-05-19', '15.30', 'FV30RR');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (60, '2026-05-03', '13.45', 'SL02PP');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (61, '2026-06-08', '10.15', 'TC18AA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (62, '2026-05-25', '14.10', 'MB10BB');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (63, '2026-05-14', '11.50', 'AF25CC');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (64, '2026-06-02', '16.00', 'CP19DD');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (65, '2026-05-07', '12.30', 'AS14EE');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (66, '2026-06-14', '15.15', 'VA23FF');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (67, '2026-05-28', '11.10', 'SC05GG');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (68, '2026-05-09', '13.20', 'IF10HH');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (69, '2026-06-06', '16.45', 'MM01II');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (70, '2026-05-21', '10.40', 'EC17JJ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (71, '2026-05-04', '15.55', 'NV28KK');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (72, '2026-06-11', '12.50', 'BO13LL');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (73, '2026-05-27', '11.45', 'GS04MM');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (74, '2026-05-12', '14.30', 'SD22NN');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (75, '2026-06-03', '10.20', 'AF16OO');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (76, '2026-05-24', '15.10', 'MP09PP');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (77, '2026-05-06', '13.30', 'RG01QQ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (78, '2026-06-13', '16.00', 'CM07RR');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (79, '2026-05-16', '11.25', 'FR19SS');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (80, '2026-05-31', '14.05', 'AB05TT');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (81, '2026-05-10', '12.40', 'TP20UU');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (82, '2026-06-07', '15.40', 'SF06VV');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (83, '2026-05-23', '11.00', 'EN13WW');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (84, '2026-05-01', '13.15', 'GM30XX');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (85, '2026-06-09', '16.30', 'DB08YY');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (86, '2026-05-18', '10.50', 'VF01ZZ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (87, '2026-05-29', '14.25', 'RL11AA');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (88, '2026-05-13', '12.10', 'EP18BB');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (89, '2026-06-04', '15.00', 'PM02CC');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (90, '2026-05-26', '11.35', 'NV24DD');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (91, '2026-05-05', '13.50', 'GL12EE');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (92, '2026-06-15', '16.50', 'FC06FF');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (93, '2026-05-20', '10.25', 'EB15GG');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (94, '2026-05-02', '14.55', 'CF21HH');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (95, '2026-06-10', '12.20', 'SP03II');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (96, '2026-05-15', '15.25', 'IS19JJ');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (97, '2026-05-30', '11.05', 'CA28KK');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (98, '2026-06-01', '13.40', 'AC12LL');
INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) VALUES (99, '2026-05-11', '16.15', 'LF21MM');

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