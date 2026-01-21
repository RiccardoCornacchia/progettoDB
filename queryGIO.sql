/* 1. Visualizzazione delle giostre, attrazioni, eventi e attività commerciali presenti nel parco */
SELECT nomeGiostra,disponibilita, tipologiaGiostra FROM GIOSTRA;
SELECT nomeRouta, durataRuotaPanoramica, altezzaRuotaPanoramica FROM RUOTA_PANORAMICA;
SELECT nomeAreaTematica, tema, disponibilita FROM AREA_TEMATICA;
SELECT nomeAttrazionePaura,disponibilita, prezzoAggiuntivo FROM ATTRAZIONE_DI_PAURA;
SELECT nomeAttivita, tipologiaAttivita FROM ATTIVITA_COMMERCIALE WHERE tipologiaAttivita != 'NegozioFoto';

/* 2. Aggiunta di lavoratori, giostre, attrazioni o attività commerciali  */
INSERT INTO LAVORATORE(nome, cognome, dataNascita, CF, numeroTelefono, e_mail, mansione, dataInizioContratto, stipendio,
						codiceAttivita_puntoRistoro, codiceAttivita_negozio, nomeGiostra, nomeAreaTematiche, nomeRuota,
                        nomeAttrazionePaura) VALUES ();
INSERT INTO GIOSTRA(nomeGiostra, CF, capienza, disponibilita, etaMinima, durataGiostra, acquatica, etaMassima, velocita, altezzaMaxVisitatore, tipologiaGiostra)
VALUES ();
INSERT INTO ATTRAZIONE_DI_PAURA(nomeAttrazionePaura, CF, disponibilita, prezzoAggiuntivo, dataInizio, dataFine)
VALUES (); 
INSERT INTO AREA_TEMATICA(nomeAreaTematica, CF, disponibilita, tema, dataInizio, dataFine) VALUES ();
INSERT INTO RUOTA_PANORAMICA(nomeRouta, CF, disponibilita, durataRuotaPanoramica, altezzaRuotaPanoramica) VALUES ();
INSERT INTO ATTIVITA_COMMERCIALE(codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita)
VALUES ();
/* 3. Eliminazione di lavoratori, giostre, attrazioni o attività commerciali */
DELETE FROM LAVORATORE WHERE CF = '';
DELETE FROM GIOSTRA WHERE nomeGiostra = '';
DELETE FROM ATTRAZIONE_DI_PAURA WHERE nomeAttrazionePaura = '';
DELETE FROM AREA_TEMATICA WHERE nomeAreaTematica = '';
DELETE FROM RUOTA_PANORAMICA WHERE nomeRuota = '';
DELETE FROM ATTIVITA_COMMERCIALE WHERE codiceAttivita = '';
/* 4. Aggiunta di eventi in determinati periodi */
INSERT INTO EVENTO(codiceEvento, nomeEvento, tematica, oraInizio, oraFine, data) VALUES ();
/* 5. Visualizzare quali sono le 3 giostre che vengono scelte con maggiore frequenza */
SELECT nomeGiostra, COUNT(*) AS frequenzaTotale
FROM SALITA
GROUP BY nomeGiostra
ORDER BY frequenzaTotale
LIMIT 3; 
/* 6. Dato un numero n di anni, visualizzare gli eventi tenuti negli ultimi n anni */
SELECT *
FROM EVENTO e
WHERE e.data >= DATE_SUB(current_date(), INTERVAL 3 YEAR);
/* 7. Quali attività commerciali hanno fatturato di più */
SELECT 
    a.nomeAttivita, 
    a.tipologiaAttivita, 
    SUM(u.prezzoAcquisto) AS fatturatoTotale 
FROM ATTIVITA_COMMERCIALE a
JOIN USUFRUIZIONE u ON a.codiceAttivita = u.codiceAttivita
WHERE a.tipologiaAttivita IN ('puntiRistoro', 'salaGiochi', 'NegozioSouvenirs')
GROUP BY a.nomeAttivita, a.tipologiaAttivita
ORDER BY fatturatoTotale DESC;