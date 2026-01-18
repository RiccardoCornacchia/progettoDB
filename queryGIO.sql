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
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES ('2026-06-15', 1, '14.30', '15.05', 'Scuola di Polizia');
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES ('2026-06-14', 2, '14.30', '15.05', 'Scuola di Polizia');
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES ('2026-06-16', 3, '14.30', '15.05', 'Scuola di Polizia');
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES ('2026-06-17', 4, '14.30', '15.05', 'Scuola di Polizia');
INSERT INTO REPLICA_SPETTACOLO(data, codiceReplica, oraInizio, oraFine, nomeSpettacolo) VALUES ('2026-06-18', 5, '14.30', '15.05', 'Scuola di Polizia');

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