-- Query sul DB
INSERT INTO turni_lavoro (codice_fiscale, ora_inizio, ora_fine, data_turno) 
SELECT ?, ?, ?, ?
FROM DUAL
WHERE not exists( SELECT * FROM turni_lavoro 
	WHERE codice_fiscale = ? 
	AND data_turno = ? 
	AND (
	(? BETWEEN ora_inizio AND ora_fine) -- Nuova ora inizio cade in turno esistente
	OR 
	(? BETWEEN ora_inizio AND ora_fine))); -- Nuova ora fine cade in turno esistente

SELECT nome, cognome, count(*) as biglietti_comprati
FROM visitatore V, acquisto_b A
WHERE V.CF = A.CF
GROUP BY V.CF
ORDER BY biglietti_comprati DESC
LIMIT 10;

SELECT L.nome, L.cognome, L.mansione,
IF(T.data_turno = '2026-07-28' AND '12:00:00' BETWEEN T.ora_inizio AND T.ora_fine, 'Sì', 'No') AS attualmente_a_lavoro
FROM lavoratore L JOIN turno_di_lavoro T ON L.CF = T.CF
ORDER BY L.dataInizioContratto ASC
LIMIT 10;

SELECT mansione, count(*) AS numero_lavoratori, AVG(stipendio) AS stipendio_medio
FROM lavoratore
GROUP BY mansione
ORDER BY stipendio_medio DESC;

SELECT tipoGuasto, impiantoInManutenzione, nomeRuota, nomeGiostra, nomeAreaTematiche, nomeAttrazionePaura,
	DATEDIFF(IFNULL(dataFine, curdate()), dataInizio) AS giorni_in_manutenzione
FROM Manutenzione
ORDER BY giorni_in_manutenzione DESC
LIMIT 1;
