<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') { 
    header("Location: index.php"); 
    exit; 
}

$messaggio = ""; 
$errore = "";
$lista_attivita = $dbh->getAttivitaCommerciali();

if (isset($_GET['action']) && $_GET['action'] == 'delete_attivita' && isset($_GET['id'])) {
    try {
        $dbh->deleteAttivitaCommerciale($_GET['id']);
        $messaggio = "Attività eliminata!";
        // Aggiorno la lista
        $lista_attivita = $dbh->getAttivitaCommerciali();
    } catch (Exception $e) { 
        $errore = "Impossibile eliminare l'attività."; 
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_attivita'])) {
    
    $codice_ins = $_POST['codice'];
    $nome_ins = $_POST['nome'];
    $dipendenti = $_POST['dipendenti'];
    $apertura = $_POST['apertura'];
    $chiusura = $_POST['chiusura'];
    
    $duplicato_id = false;
    $duplicato_nome = false;

    foreach ($lista_attivita as $ac) {
        if ($ac['codiceAttivita'] == $codice_ins) {
            $duplicato_id = true;
        }
        if (strcasecmp($ac['nomeAttivita'], $nome_ins) == 0) {
            $duplicato_nome = true;
        }
    }

    if ($duplicato_id) {
        $errore = "Errore: Esiste già un'attività con il Codice ID '$codice_ins'.";
    } elseif ($duplicato_nome) {
        $errore = "Errore: Esiste già un'attività con il Nome '$nome_ins'.";
    } elseif ($dipendenti < 1) {
        $errore = "Errore: Il numero di dipendenti deve essere almeno 1.";
    } else {
        $ts_apertura = strtotime($apertura);
        $ts_chiusura = strtotime($chiusura);
        
        if ($ts_chiusura < ($ts_apertura + 7200)) {
            $errore = "Errore: L'orario di chiusura deve essere almeno 2 ore dopo l'apertura.";
        } else {
            $res = $dbh->insertAttivitaCommerciale(
                $codice_ins, $nome_ins, $apertura, 
                $chiusura, $_POST['disponibilita'], $dipendenti, $_POST['tipo']
            );
            
            if ($res) {
                $messaggio = "Nuova attività aggiunta correttamente!"; 
                $lista_attivita = $dbh->getAttivitaCommerciali();
            } else { 
                $errore = "Errore generico durante l'inserimento nel DB."; 
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Attività</title>
    <style>
        body { font-family: sans-serif; margin: 0; display: flex; height: 100vh; background: #eee; }
        .sidebar { width: 250px; background: #333; color: white; display: flex; flex-direction: column; padding: 20px; overflow-y: auto; }
        .sidebar h2 { text-align: center; margin-bottom: 30px; }
        .menu-link { padding: 10px; color: #ccc; text-decoration: none; display: block; margin-bottom: 5px; }
        .menu-link:hover, .active { background: #444; color: white; }
        .logout { margin-top: auto; background: #b00; color: white; text-align: center; }
        .main-content { flex: 1; padding: 40px; overflow-y: auto; }
        .section-box { background: white; padding: 20px; border: 1px solid #ccc; margin-bottom: 30px; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f0f0f0; }
        .btn-delete { background: #d9534f; color: white; padding: 5px 10px; text-decoration: none; font-size: 0.8rem; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 20px; }
        input, select { padding: 8px; border: 1px solid #ccc; width: 100%; box-sizing: border-box; }
        .btn-add { grid-column: span 2; background: #5cb85c; color: white; padding: 10px; border: none; cursor: pointer; font-weight: bold; margin-top: 10px; }
        .msg-success { background: #dff0d8; color: #3c763d; padding: 15px; margin-bottom: 20px; border: 1px solid #d6e9c6; }
        .msg-error { background: #f2dede; color: #a94442; padding: 15px; margin-bottom: 20px; border: 1px solid #ebccd1; }
        label { font-weight: bold; font-size: 0.9rem; margin-bottom: 5px; display: block; }
</style>
</head>
<body>
    <?php include 'admin_sidebar.php'; ?>

    <div class="main-content">
        <h1>Gestione Attività Commerciali</h1>
        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="section-box">
            <h3>Elenco Attività</h3>
            <table>
                <thead>
                    <tr><th>ID</th><th>Nome</th><th>Tipo</th><th>Orari</th><th>Dip.</th><th>Azioni</th></tr>
                </thead>
                <tbody>
                    <?php foreach ($lista_attivita as $ac): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($ac['codiceAttivita']); ?></td>
                        <td><b><?php echo htmlspecialchars($ac['nomeAttivita']); ?></b></td>
                        <td><?php echo htmlspecialchars($ac['tipologiaAttivita']); ?></td>
                        <td><?php echo $ac['orarioApertura'] . ' - ' . $ac['orarioChiusura']; ?></td>
                        <td><?php echo htmlspecialchars($ac['numeroDipendenti']); ?></td>
                        <td>
                            <a href="?action=delete_attivita&id=<?php echo urlencode($ac['codiceAttivita']); ?>" class="btn-delete" onclick="return confirm('Sicuro?');">Elimina</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h3>Aggiungi Attività</h3>
            <form method="post">
                <input type="hidden" name="form_attivita" value="1">
                <div class="form-grid">
                    <div>
                        <label>Codice ID</label>
                        <input type="number" name="codice" placeholder="Es. 101" required>
                    </div>
                    <div>
                        <label>Nome Attività</label>
                        <input type="text" name="nome" placeholder="Nome Attività" required>
                    </div>
                    
                    <div style="grid-column: span 2;">
                        <label>Tipologia</label>
                        <select name="tipo">
                            <option value="Punto Ristoro">Punto Ristoro</option>
                            <option value="NegozioSouvenir">Negozio Souvenir</option>
                            <option value="NegozioFoto">Negozio Foto</option>
                            <option value="Sala Giochi">Sala Giochi</option>
                        </select>
                    </div>

                    <div style="grid-column: span 2;">
                        <label>Num. Dipendenti</label>
                        <input type="number" name="dipendenti" placeholder="Minimo 1" min="1" required>
                    </div>

                    <div>
                        <label>Apertura:</label>
                        <input type="time" name="apertura" value="09:00" required>
                    </div>
                    <div>
                        <label>Chiusura:</label>
                        <input type="time" name="chiusura" value="22:00" required>
                    </div>

                    <div style="grid-column: span 2;">
                        <label>Stato:</label>
                        <select name="disponibilita">
                            <option value="1">Aperta</option>
                            <option value="0">Chiusa</option>
                        </select>
                    </div>

                    <button type="submit" class="btn-add">Aggiungi Attività</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>