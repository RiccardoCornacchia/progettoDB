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

    /* GET Mansioni*/
    public function getMansioni() {
        $query = "SELECT DISTINCT mansione FROM LAVORATORE";
        $stmt = $this->db->prepare($query);
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
    public function countLavoratori() {
        $stmt = $this->db->prepare("SELECT COUNT(*) as totale FROM LAVORATORE");
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
}
?>