<?php
class DatabaseHelper {
    private $db;
    //copia delnevo
    public function __construct($servername, $username, $password, $dbname, $port){
        $this->db = new mysqli($servername, $username, $password, $dbname, $port);
        if ($this->db->connect_error) {
            die("Connection failed: " . $this->db->connect_error);
        }        
    }
    
    /*Giostre*/
    public function getGiostre() {
        $stmt = $this->db->prepare("SELECT * FROM GIOSTRA");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    /* GET Evento*/
   public function getEventi() {
    $stmt = $this->db->prepare("SELECT * FROM EVENTO WHERE data >= CURDATE() ORDER BY data ASC, oraInizio ASC");
    $stmt->execute();
    $result = $stmt->get_result();
    return $result->fetch_all(MYSQLI_ASSOC);
    }

    /* GET Spettacolo*/
    public function getSpettacoli() {
        $stmt = $this->db->prepare("SELECT * FROM SPETTACOLO");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    /*/* GET Attrazzioni di Paura*/ 
    public function getAttrazioniPaura() {
        $stmt = $this->db->prepare("SELECT * FROM ATTRAZIONE_DI_PAURA WHERE dataInizio >= CURDATE() ORDER BY dataInizio ASC");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    /*GET Ruota Panoramica*/ 
    public function getRuotaPanoramica() {
        $stmt = $this->db->prepare("SELECT * FROM RUOTA_PANORAMICA");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    /* GET Biglietti*/
    public function getTipologieBiglietti() {
        $stmt = $this->db->prepare("SELECT * FROM TIPOLOGIA_BIGLIETTO");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    /* GET Attività Commerciali*/
    public function getAttivitaCommerciali() {
        $stmt = $this->db->prepare("SELECT * FROM ATTIVITA_COMMERCIALE");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    /*GET AREA TEMATICA */
    public function getAreeTematiche() {
        $stmt = $this->db->prepare("SELECT * FROM AREA_TEMATICA");
        $stmt->execute();
        return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    /*POST acquisto*/
    public function insertAcquistoBiglietto($cf, $codiceBiglietto, $data, $orario) {
        $stmt = $this->db->prepare("INSERT INTO ACQUISTO_B (CF, codiceBiglietto, data, orario) VALUES (?, ?, ?, ?)");
        $stmt->bind_param('siss', $cf, $codiceBiglietto, $data, $orario);
        $stmt->execute();
        return $stmt->affected_rows > 0;
    }
    
    public function countLavoratori() {
        $stmt = $this->db->prepare("SELECT COUNT(*) as totale FROM LAVORATORE");
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row['totale'];
    }

   
    // Statistica: Conta i visitatori totali
    public function countVisitatori() {
        $stmt = $this->db->prepare("SELECT COUNT(*) as totale FROM VISITATORE");
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row['totale'];
    }

    /* INSERT nuova Giostra*/
    public function insertGiostra($nome, $capienza, $disp, $eta, $durata, $acqua, $vel, $tipo) {
        $query = "INSERT INTO GIOSTRA (nomeGiostra, capienza, disponibilita, etaMinima, durataGiostra, acquatica, velocita, tipologiaGiostra) 
                  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('sisiisds', $nome, $capienza, $disp, $eta, $durata, $acqua, $vel, $tipo);
        return $stmt->execute();
    }

    /* INSERT nuovO BIGLIETTO*/
    public function insertTipologiaBiglietto($nome, $prezzo) {
        $query = "INSERT INTO TIPOLOGIA_BIGLIETTO (nomeBiglietto, prezzo) VALUES (?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('sd', $nome, $prezzo);
        return $stmt->execute();
    }

    /*INsert nuova Attrazione */
    public function insertAttrazionePaura($nome, $disp, $prezzo, $inizio, $fine) {
        $query = "INSERT INTO ATTRAZIONE_DI_PAURA (nomeAttrazionePaura, disponibilita, prezzoAggiuntivo, dataInizio, dataFine) 
                    VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('ssdss', $nome, $disp, $prezzo, $inizio, $fine);
        return $stmt->execute();
    }

    /*Insert Attivita Commerciale */ 
    public function insertAttivitaCommerciale($codice, $nome, $apertura, $chiusura, $disp, $dipendenti, $tipo) {
        $query = "INSERT INTO ATTIVITA_COMMERCIALE (codiceAttivita, nomeAttivita, orarioApertura, orarioChiusura, disponibilita, numeroDipendenti, tipologiaAttivita) 
                  VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('issssis', $codice, $nome, $apertura, $chiusura, $disp, $dipendenti, $tipo);
        return $stmt->execute();
    }
    /*Insert Area Tematica */ 
    public function insertAreaTematica($nome, $tema, $disp, $inizio, $fine) {
        $query = "INSERT INTO AREA_TEMATICA (nomeAreaTematica, tema, disponibilita, dataInizio, dataFine) 
                  VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('sssss', $nome, $tema, $disp, $inizio, $fine);
        return $stmt->execute();
    }
    /*Insert Ruota Panoramica */
    public function insertRuotaPanoramica($nome, $disp, $durata, $altezza) {
        $query = "INSERT INTO RUOTA_PANORAMICA (nomeRuota, disponibilita, durataRuotaPanoramica, altezzaRuotaPanoramica) 
                  VALUES (?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('ssid', $nome, $disp, $durata, $altezza);
        return $stmt->execute();
    }

    /*DELETE GIOSTRA */
    public function deleteGiostra($nomeGiostra) {
        $stmt = $this->db->prepare("DELETE FROM GIOSTRA WHERE nomeGiostra = ?");
        $stmt->bind_param('s', $nomeGiostra);
        return $stmt->execute();
    }

    /*DELETE Biglietto*/
    public function deleteTipologiaBiglietto($nomeBiglietto) {
        $stmt = $this->db->prepare("DELETE FROM TIPOLOGIA_BIGLIETTO WHERE nomeBiglietto = ?");
        $stmt->bind_param('s', $nomeBiglietto);
        return $stmt->execute();
    }

    public function getNomeAttivita($codiceAttivita) {
        $stmt = $this->db->prepare("SELECT nomeAttivita FROM ATTIVITA_COMMERCIALE WHERE codiceAttivita = ?");
        $stmt->bind_param("s", $codiceAttivita);
        $stmt->execute();
        $res = $stmt->get_result()->fetch_assoc();
        return $res['nomeAttivita'] ?? $codiceAttivita;
    }

    public function getLavoratori() {
        $query = "SELECT * FROM LAVORATORE";
        $result = $this->db->query($query);
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function addLavoratore($nome, $cognome, $dataNascita, $CF, $numeroTelefono, $e_mail, $mansione, $dataInizioContratto, $stipendio,
						$codiceAttivita_puntoRistoro, $codiceAttivita_negozio, $nomeGiostra, $nomeAreaTematica, $nomeRuota,
                        $nomeAttrazionePaura) {
        $query = "INSERT INTO lavoratore (nome, cognome, dataNascita, CF, numeroTelefono, e_mail, mansione, dataInizioContratto, stipendio,
						codiceAttivita_puntoRistoro, codiceAttivita_negozio, nomeGiostra, nomeAreaTematica, nomeRuota,
                        nomeAttrazionePaura) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ssssssssdssssss", $nome, $cognome, $dataNascita, $CF, $numeroTelefono, $e_mail, $mansione, $dataInizioContratto, $stipendio,
						$codiceAttivita_puntoRistoro, $codiceAttivita_negozio, $nomeGiostra, $nomeAreaTematica, $nomeRuota,
                        $nomeAttrazionePaura);
        return $stmt->execute();
    }

    public function deleteLavoratore($CF) {
        $query = "DELETE FROM lavoratore WHERE CF = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $CF);
        return $stmt->execute();
    }

    public function getMansioni() {
        $query = "SELECT DISTINCT mansione FROM LAVORATORE";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function top3giostre(){
        $query = "SELECT nomeGiostra, COUNT(*) AS frequenzaTotale
            FROM SALITA
            GROUP BY nomeGiostra
            ORDER BY frequenzaTotale
            LIMIT 3";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function spettacoliEventiDatoOrario(){
        $query = "SELECT 'Spettacolo' AS Tipo, nomeSpettacolo AS Nome, data, oraInizio, oraFine
                FROM REPLICA_SPETTACOLO
                WHERE data = '2026-07-28' AND oraFine >= CURTIME()

                UNION ALL

                SELECT 'Evento' AS Tipo, nomeEvento AS Nome, data, oraInizio, oraFine
                FROM EVENTO
                WHERE data = '2026-07-28' AND oraFine >= CURTIME()

                ORDER BY data ASC, oraInizio ASC";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function eventiDatiUltimiAnni($numeroAnni){
        $query = "SELECT * FROM EVENTO WHERE data >= DATE_SUB('2026-07-28', INTERVAL ? YEAR)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('i', $numeroAnni); // 'i' sta per integer
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    
    public function getTopFatturato() {
        $query = "SELECT a.nomeAttivita, a.tipologiaAttivita, SUM(u.prezzoAcquisto) AS fatturatoTotale 
                  FROM ATTIVITA_COMMERCIALE a
                  JOIN USUFRUIZIONE u ON a.codiceAttivita = u.codiceAttivita
                  WHERE a.tipologiaAttivita IN ('puntiRistoro', 'salaGiochi', 'NegozioSouvenirs')
                  GROUP BY a.nomeAttivita, a.tipologiaAttivita
                  ORDER BY fatturatoTotale DESC";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function storicoBigliettiAbbonamenti($CF){
        $query= "SELECT data, orario, 'Abbonamento' AS prodottoAcquistato, nomeAbbonamento AS tipologia
                    FROM acquisto_a
                    JOIN abbonamento ON acquisto_a.codAbbonamento = abbonamento.codAbbonamento
                    WHERE CF = ?

                    UNION ALL 

                    SELECT data, orario, 'Biglietto' AS prodottoAcquistato, b.nomeBiglietto AS tipologia
                    FROM acquisto_b ab
                    JOIN biglietto b ON ab.codiceBiglietto = b.codiceBiglietto
                    WHERE ab.CF = ?";
        $stmt = $this->db->prepare($query);
        // Passiamo il CF due volte: una per la prima SELECT e una per la seconda
        $stmt->bind_param("ss", $CF, $CF);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function top10visitatori(){
        $query = "SELECT nome, cognome, count(*) as biglietti_comprati
                 FROM visitatore V, acquisto_b A
                 WHERE V.CF = A.CF
                 GROUP BY V.CF
                 ORDER BY biglietti_comprati DESC
                 LIMIT 10";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function lavoratoriPiuLongevi(){
        $query = "SELECT L.nome, L.cognome, L.mansione, L.dataInizioContratto,
                 IF(T.data = '2026-07-28' AND CURTIME() BETWEEN T.oraInizio AND T.oraFine, 'Sì', 'No') AS attualmente_a_lavoro
                 FROM lavoratore L JOIN turno_di_lavoro T ON L.CF = T.CF
                 WHERE T.data = '2026-07-28'
                 ORDER BY L.dataInizioContratto ASC
                 LIMIT 10";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function lavoratoriPerMansione(){
        $query = "SELECT mansione, count(*) AS numero_lavoratori, ROUND(AVG(Stipendio), 2) AS stipendio_medio
                 FROM lavoratore
                 GROUP BY mansione
                 ORDER BY stipendio_medio DESC";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function GuastoPiuLungo(){
        $query = "SELECT tipoGuasto, impiantoInManutenzione, nomeRuota, nomeGiostra, nomeAreaTematica, nomeAttrazionePaura,
                    DATEDIFF(IFNULL(dataFine, '2026-07-28'), dataInizio) AS giorni_in_manutenzione
                FROM MANUTENZIONE
                ORDER BY giorni_in_manutenzione DESC
                LIMIT 1";
        $result = $this->db->query($query);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    
    /*DELETE Attrazione*/
    public function deleteAttrazionePaura($nome) {
        $stmt = $this->db->prepare("DELETE FROM ATTRAZIONE_DI_PAURA WHERE nomeAttrazionePaura = ?");
        $stmt->bind_param('s', $nome);
        return $stmt->execute();
    }

    /*DELETE Attività*/
    public function deleteAttivitaCommerciale($codice) {
        $stmt = $this->db->prepare("DELETE FROM ATTIVITA_COMMERCIALE WHERE codiceAttivita = ?");
        $stmt->bind_param('i', $codice);
        return $stmt->execute();
    }

    /*DELETE  Area Tematica*/
    public function deleteAreaTematica($nome) {
        $stmt = $this->db->prepare("DELETE FROM AREA_TEMATICA WHERE nomeAreaTematica = ?");
        $stmt->bind_param('s', $nome);
        return $stmt->execute();
    }

    /*DELETE Ruota Panoramica */
    public function deleteRuotaPanoramica($nome) {
        $stmt = $this->db->prepare("DELETE FROM RUOTA_PANORAMICA WHERE nomeRuota = ?");
        $stmt->bind_param('s', $nome);
        return $stmt->execute();
    }

    public function updateStatoGiostra($nome) {
        $sql = "UPDATE GIOSTRA SET disponibilita = 1 - disponibilita WHERE nomeGiostra = ?";
        return $this->db->prepare($sql)->execute([$nome]);
    }

    public function updateStatoAttivita($nome) {
        $sql = "UPDATE ATTIVITA_COMMERCIALE SET disponibilita = 1 - disponibilita WHERE nomeAttivita = ?";
        return $this->db->prepare($sql)->execute([$nome]);
    }

    public function updateStatoAttrazionePaura($nome) {
        $sql = "UPDATE ATTRAZIONE_DI_PAURA SET disponibilita = 1 - disponibilita WHERE nomeAttrazionePaura = ?";
        return $this->db->prepare($sql)->execute([$nome]);
    }

    public function updateStatoCassa($id) {
        // Nota: 'i' se numeroCassa è un numero, 's' se è una stringa
        $stmt = $this->db->prepare("UPDATE CASSA SET stato = NOT stato WHERE numeroCassa = ?");
        $stmt->bind_param("i", $id); 
        return $stmt->execute();
    }

    public function updateStatoBagno($id) {
        $stmt = $this->db->prepare("UPDATE BAGNO SET disponibilita = 1 - disponibilita WHERE codiceBagno = ?");
        $stmt->bind_param("s", $id);
        return $stmt->execute();
    }

    // Recupera tutte le casse
    public function getCasse() {
        $sql = "SELECT * FROM CASSA";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    
    // Recupera tutti i bagni
    public function getBagni() {
        $sql = "SELECT * FROM BAGNO";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getAllAttrazioniPaura() {
        $stmt = $this->db->prepare("SELECT * FROM ATTRAZIONE_DI_PAURA ORDER BY nomeAttrazionePaura ASC");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getManutenzioniAttive() {
        // Selezioniamo solo quelle dove dataFine è NULL
        $query = "SELECT *, 
                COALESCE(nomeGiostra, nomeRuota, nomeAreaTematica, nomeAttrazionePaura) AS nomeImpianto
                FROM manutenzione 
                WHERE dataFine IS NULL 
                ORDER BY dataInizio DESC";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // Recupera gli abbonamenti
    public function getTipologieAbbonamenti() {
        $stmt = $this->db->prepare("SELECT * FROM tipologia_abbonamento ORDER BY prezzo ASC");
        $stmt->execute();
        return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    // Recupera i turni per una data specifica
    public function getTurniPerData($data) {
        $query = "SELECT * FROM turno_di_lavoro WHERE data = ? ORDER BY oraInizio ASC";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $data);
        $stmt->execute();
        return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    // Inserisce un nuovo turno
    public function addTurno($cf, $inizio, $fine, $data) {
        $query = "INSERT INTO turno_di_lavoro (CF, oraInizio, oraFine, data) VALUES (?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ssss", $cf, $inizio, $fine, $data);
        return $stmt->execute();
    }

    // Elimina un turno specifico
    public function deleteTurno($cf, $data, $inizio) {
        $query = "DELETE FROM turno_di_lavoro WHERE CF = ? AND data = ? AND oraInizio = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("sss", $cf, $data, $inizio);
        return $stmt->execute();
    }

    public function insertEvento($nome, $data, $inizio, $fine, $tipo) {
        $query = "INSERT INTO EVENTO (nomeEvento, data, oraInizio, oraFine, tipologiaEvento) 
                  VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('sssss', $nome, $data, $inizio, $fine, $tipo);
        return $stmt->execute();
    }

    public function deleteEvento($nome) {
        $stmt = $this->db->prepare("DELETE FROM EVENTO WHERE nomeEvento = ?");
        $stmt->bind_param('s', $nome);
        return $stmt->execute();
    }
}
?>