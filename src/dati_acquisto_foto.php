<?php
require 'config/config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cf = $_POST['cf'] ?? '';
    $prezzo = $_POST['prezzo'] ?? 0;
    $codiceAttivita = $_POST['codiceAttivita'] ?? null;

    if (!empty($cf) && $prezzo > 0 && $codiceAttivita) {
        $successo = $dbh->eseguiAcquistoFoto($cf, $prezzo, $codiceAttivita);

        if ($successo) {
            // Reindirizza con un messaggio di successo
            header("Location: visitatori_home.php?msg=acquisto_ok");
        } else {
            echo "Errore durante l'elaborazione dell'acquisto.";
        }
    } else {
        echo "Dati del modulo incompleti.";
    }
} else {
    header("Location: visitatori_home.php");
}
?>