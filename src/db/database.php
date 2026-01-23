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
}
?>