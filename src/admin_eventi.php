<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: index.php");
    exit;
}

$messaggio = ""; 
$errore = "";

$lista_eventi = $dbh->getEventi();

if (isset($_GET['action']) && $_GET['action'] == 'delete_evento' && isset($_GET['id'])) {
    try {
        $dbh->deleteEvento($_GET['id']);
        $messaggio = "Evento eliminato con successo!";
        $lista_eventi = $dbh->getEventi();
    } catch (Exception $e) { 
        $errore = "Impossibile eliminare l'evento."; 
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_evento'])) {
    
    $codice_inserito = $_POST['codice'];
    $esiste_gia = false;

    foreach ($lista_eventi as $ev) {
        if ($ev['codiceEvento'] == $codice_inserito) {
            $esiste_gia = true;
            break;
        }
    }

    if ($esiste_gia) {
        $errore = "Attenzione: Esiste già un evento con il Codice '$codice_inserito'!";
    } else {
        $inizio = $_POST['inizio'];
        $fine = $_POST['fine'];
        
        $ts_inizio = strtotime($inizio);
        $ts_fine = strtotime($fine);
        $diff_secondi = $ts_fine - $ts_inizio;

        if ($diff_secondi < 1800) {
            if ($diff_secondi < 0) {
                $errore = "Errore: L'ora di fine non può essere precedente all'ora di inizio.";
            } else {
                $errore = "Errore: L'evento deve durare almeno 30 minuti.";
            }
        } else {
            $nome = $_POST['nome'];
            $tematica = $_POST['tematica'];
            $data = $_POST['data'];

            $res = $dbh->insertEvento($codice_inserito, $nome, $tematica, $inizio, $fine, $data);

            if ($res) {
                $messaggio = "Nuovo evento aggiunto correttamente!";
                $lista_eventi = $dbh->getEventi();
            } else {
                $errore = "Errore durante l'inserimento nel database.";
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Eventi - Admin</title>
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
        label { font-weight: bold; font-size: 0.9rem; margin-bottom: 5px; display: block; }
        .btn-add { grid-column: span 2; background: #5cb85c; color: white; padding: 10px; border: none; cursor: pointer; font-weight: bold; margin-top: 10px; }
        .msg-success { background: #dff0d8; color: #3c763d; padding: 15px; margin-bottom: 20px; border: 1px solid #d6e9c6; }
        .msg-error { background: #f2dede; color: #a94442; padding: 15px; margin-bottom: 20px; border: 1px solid #ebccd1; }
    </style>
</head>
<body>

    <?php include 'admin_sidebar.php'; ?>

    <div class="main-content">
        <h1>🎉 Gestione Eventi</h1>

        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="section-box">
            <h3>📅 Elenco Eventi</h3>
            <table>
                <thead>
                    <tr>
                        <th>Codice</th>
                        <th>Nome</th>
                        <th>Tematica</th>
                        <th>Data</th>
                        <th>Orario</th>
                        <th>Azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(count($lista_eventi) > 0): ?>
                        <?php foreach ($lista_eventi as $ev): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($ev['codiceEvento']); ?></td>
                            <td><b><?php echo htmlspecialchars($ev['nomeEvento']); ?></b></td>
                            <td><?php echo htmlspecialchars($ev['tematica']); ?></td>
                            <td><?php echo htmlspecialchars($ev['data']); ?></td>
                            <td>
                                <?php echo substr($ev['oraInizio'], 0, 5); ?> - 
                                <?php echo isset($ev['oraFine']) ? substr($ev['oraFine'], 0, 5) : '?'; ?>
                            </td>
                            <td>
                                <a href="?action=delete_evento&id=<?php echo urlencode($ev['codiceEvento']); ?>" 
                                   class="btn-delete" onclick="return confirm('Vuoi eliminare l\'evento <?php echo htmlspecialchars($ev['nomeEvento']); ?>?');">Elimina</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr><td colspan="6" style="text-align:center; color:#777;">Nessun evento in programma.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>

        <div class="section-box">
            <h3>Aggiungi Nuovo Evento</h3>
            <form method="post">
                <input type="hidden" name="form_evento" value="1">
                <div class="form-grid">
                    
                    <div>
                        <label>Codice Evento</label>
                        <input type="number" name="codice" placeholder="Es. 101" required>
                    </div>

                    <div>
                        <label>Nome Evento</label>
                        <input type="text" name="nome" placeholder="Es. Notte Bianca" required>
                    </div>

                    <div style="grid-column: span 2;">
                        <label>Tematica</label>
                        <input type="text" name="tematica" placeholder="Es. Musicale, Horror, Cartoni..." required>
                    </div>

                    <div style="grid-column: span 2;">
                        <label>Data</label>
                        <input type="date" name="data" required>
                    </div>

                    <div>
                        <label>Ora Inizio</label>
                        <input type="time" name="inizio" required>
                    </div>

                    <div>
                        <label>Ora Fine</label>
                        <input type="time" name="fine" required>
                    </div>

                    <div style="grid-column: span 2;">
                        <button type="submit" class="btn-add">Crea Evento</button>
                    </div>
                </div>
            </form>
        </div>

    </div>

</body>
</html>