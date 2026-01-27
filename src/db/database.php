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
        $stmt = $this->db->prepare("SELECT * FROM EVENTO");
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
        $stmt = $this->db->prepare("SELECT * FROM ATTRAZIONE_DI_PAURA");
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

    /*POST acquisto*/
    public function insertAcquistoBiglietto($cf, $codiceBiglietto, $data, $orario) {
        $stmt = $this->db->prepare("INSERT INTO ACQUISTO_B (CF, codiceBiglietto, data, orario) VALUES (?, ?, ?, ?)");
        $stmt->bind_param('siss', $cf, $codiceBiglietto, $data, $orario);
        $stmt->execute();
        return $stmt->affected_rows > 0;
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

    // Recupera tutti i lavoratori
    public function getLavoratori() {
        $query = "SELECT * FROM LAVORATORE";
        $result = $this->db->query($query);
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // Aggiunge un lavoratore
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

    // Elimina un lavoratore tramite ID
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
            LIMIT 3; ";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function spettacoliEventiDatoOrario(){
        
    }

    public function eventiDatiUltimiAnni($numeroAnni){
        $query = "SELECT * FROM EVENTO WHERE data >= DATE_SUB('2026-07-28', INTERVAL ? YEAR)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('i', $numeroAnni); // 'i' sta per integer
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function storicoBigliettiAbbonamenti(){
        
    }
    
}
?>