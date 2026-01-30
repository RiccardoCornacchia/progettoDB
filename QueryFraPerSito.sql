-- GRUPPI SCOLASTICI PIU' NUMEROSI
SELECT g.codiceGruppo, COUNT(a.CF) AS numeroPartecipanti
FROM gruppo g
JOIN appartenenza a ON g.codiceGruppo = a.codiceGruppo 
WHERE g.gruppoScuola = true
GROUP BY g.codiceGruppo
HAVING COUNT(a.CF) = (
    SELECT MAX(conteggio)
    FROM (
        SELECT COUNT(CF) AS conteggio 
        FROM appartenenza a2
        JOIN gruppo g2 ON a2.codiceGruppo = g2.codiceGruppo
        WHERE g2.gruppoScuola = true
        GROUP BY a2.codiceGruppo
    ) AS sottogruppi
);

-- STORICO ABBONAMENTI / BIGLIETTI DATO IL CF
SELECT data, orario, 'Abbonamento' AS prodottoAcquistato, nomeAbbonamento AS tipologia
FROM acquisto_a
JOIN abbonamento ON acquisto_a.codAbbonamento = abbonamento.codAbbonamento
WHERE CF = ?

UNION ALL 

SELECT data, orario, 'Biglietto' AS prodottoAcquistato, b.nomeBiglietto AS tipologia
FROM acquisto_b ab
JOIN biglietto b ON ab.codiceBiglietto = b.codiceBiglietto
WHERE ab.CF = ?;

-- DATO UN ORARIO VEDERE QUALI SPETTACOLI/EVENTI SONO IN CORSO O DEVONO INIZIARE
SELECT 'Spettacolo' AS Tipo, nomeSpettacolo AS Nome, data, oraInizio, oraFine
FROM REPLICA_SPETTACOLO
WHERE data = '2026-07-28' AND oraFine >= CURTIME()

UNION ALL

SELECT 'Evento' AS Tipo, nomeEvento AS Nome, data, oraInizio, oraFine
FROM EVENTO
WHERE data = '2026-07-28' AND oraFine >= CURTIME()

ORDER BY data ASC, oraInizio ASC;

-- OPERAZIONE: ACQUISTO BIGLIETTO (lato client) 
-- Inserimento Visitatore (solo se non esiste)
INSERT INTO visitatore (CF, nome, cognome, dataNascita, numeroTelefono, e_mail, altezzaVisitatore)
SELECT DISTINCT ?, ?, ?, ?, ?, ?, ?
FROM visitatore
WHERE NOT EXISTS (
    SELECT 1 FROM visitatore WHERE CF = ?
);

INSERT INTO biglietto (codiceBiglietto, nomeBiglietto, dataValidita) 
SELECT IFNULL(MAX(codiceBiglietto), 0) + 1, ?, ?
FROM biglietto;

INSERT INTO acquisto_b (CF, codiceBiglietto, data, orario) 
SELECT ?, MAX(codiceBiglietto), ?, CURTIME() 
FROM biglietto;

INSERT INTO vendita_b (codiceBiglietto, data, orario, numeroCassa) 
SELECT MAX(codiceBiglietto), '2026-07-28', CURTIME(), (SELECT numeroCassa FROM cassa WHERE stato = true ORDER BY RAND() LIMIT 1)
FROM biglietto;

-- OPERAZIONE: ACQUISTO ABBONAMENTO (lato client)
-- Inserimento Visitatore (solo se non esiste)
INSERT INTO visitatore (CF, nome, cognome, dataNascita, numeroTelefono, e_mail, altezzaVisitatore)
VALUES (?, ?, ?, ?, ?, ?, ?)
ON DUPLICATE KEY UPDATE 
    numeroTelefono = VALUES(numeroTelefono),
    e_mail = VALUES(e_mail),
    altezzaVisitatore = VALUES(altezzaVisitatore);

INSERT INTO abbonamento (codAbbonamento, nomeAbbonamento, scadenza) 
SELECT IFNULL(MAX(codAbbonamento), 0 ) + 1, ?, ? 
FROM abbonamento;

INSERT INTO acquisto_a (CF, codAbbonamento, data, orario) 
SELECT ?, MAX(codAbbonamento), '2026-07-28', CURTIME() 
FROM abbonamento;

INSERT INTO vendita_a (codAbbonamento, data, orario, numeroCassa) 
SELECT MAX(codAbbonamento), '2026-07-28', CURTIME(), (SELECT numeroCassa FROM cassa WHERE stato = true ORDER BY RAND() LIMIT 1)
FROM abbonamento;

-- OPERAZIONE: ACQUISTO FOTO MEDIANTE CODICE (lato client)

INSERT INTO FOTO (codiceFoto, prezzo)
SELECT IFNULL(MAX(codAbbonamento), 0 ) + 1, ? 
FROM FOTO;

INSERT INTO ACQUISTO_FOTO (codiceFoto, data, orario, CF) 
SELECT MAX(codiceFoto),  '2026-07-28', CURTIME(), ?
FROM FOTO;

INSERT INTO VENDITA_FOTO (codiceFoto, data, orario, codiceAttivita) 
SELECT MAX(codiceFoto),  '2026-07-28', CURTIME(), ?
FROM FOTO;


-- OPERAZIONE: CAMBIO STATO-DISPONIBILITA' (lato amministratore)
UPDATE CASSA
SET stato = NOT stato
WHERE numeroCassa = ?;

UPDATE GIOSTRA
SET disponibilita = 1 - disponibilita
WHERE nomeGiostra = ?;

UPDATE ATTIVITA_COMMERCIALE
SET disponibilita = 1 - disponibilita
WHERE nomeAttivita = ?;

UPDATE BAGNO 
SET disponibilita = 1 - disponibilita 
WHERE codiceBagno = ?;

UPDATE ATTRAZIONE_DI_PAURA 
SET disponibilita = 1 - disponibilita
WHERE nomeAttrazionePaura = ?;
