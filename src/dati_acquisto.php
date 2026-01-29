<?php
require 'config/config.php';
// Il file DatabaseHelper è solitamente incluso nel config, 
// ma se $dbh non viene creato lì, aggiungi: $dbh = new DatabaseHelper(...);

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // 1. Recupero e pulizia dati dal form
    $tipo          = $_POST['tipo']; 
    $prodotto      = $_POST['nome_prodotto'];
    $cf            = strtoupper(trim($_POST['codice_fiscale']));
    $nome          = trim($_POST['nome']);
    $cognome       = trim($_POST['cognome']);
    $data_nascita  = $_POST['data_nascita'];
    $altezza       = intval($_POST['altezza']);
    $email         = !empty($_POST['email']) ? trim($_POST['email']) : null;
    $telefono      = !empty($_POST['telefono']) ? trim($_POST['telefono']) : null;

    // 2. Variabili di servizio generate automaticamente
    $data_oggi     = '2026-07-28';
    $ora_attuale   = date('H:i:s');
    $scadenza_anno = date('Y-m-d', strtotime('+1 year'));

    if ($tipo === 'abbonamento') {
        $risultato = $dbh->eseguiAcquistoAbbonamento(
            $cf, $nome, $cognome, $data_nascita, $telefono, $email, 
            $altezza, $prodotto, $scadenza_anno, $data_oggi, $ora_attuale
        );
    } else {
        $data_validita = $_POST['data_validita'];
        $risultato = $dbh->eseguiAcquistoBiglietto(
            $cf, $nome, $cognome, $data_nascita, $telefono, $email, 
            $altezza, $prodotto, $data_validita, $data_oggi, $ora_attuale
        );
    }

    if ($risultato) {
        header("Location: dati_acquisto.php?success=1");
    } else {
        header("Location: dati_acquisto.php?error=1");
    }   
    exit;
} else {
    header("Location: client_acquistoBiglietti_Abbonamenti.php");
    exit;
}
?>