/*MODIFICA LUNGHEZZA nomeAttivita in ATTIVITA COMMERCIALE*/
ALTER TABLE ATTIVITA_COMMERCIALE
MODIFY COLUMN nomeAttivita CHAR(35);

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

/* Attivita Commerciale - SalaGiochi*/

INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES (17, 'Arcade Kingdom', '10.30', '22.45', 1, 1, 'salaGiochi');
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

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('AlgigaWheel', NULL, 100, 1, 0, 600, FALSE, 99, 2, 210, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Reptilium', NULL, 40, 1, 4, 150, FALSE, 99, 10, 180, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Il Trenino Arcobaleno', NULL, 20, 1, 2, 240, FALSE, 10, 5, 150, 'Bambini');

INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ('Le Tazze Magiche', NULL, 30, 1, 3, 120, FALSE, 12, 10, 160, 'Bambini');