<?php
require 'config/config.php';

// Controllo accesso
if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$messaggio = ""; 
$errore = "";

// 1. GESTIONE CANCELLAZIONE
if (isset($_GET['action']) && $_GET['action'] == 'delete_evento' && isset($_GET['id'])) {
    try {
        $dbh->deleteEvento($_GET['id']);
        $messaggio = "Evento eliminato con successo!";
    } catch (Exception $e) { 
        $errore = "Impossibile eliminare l'evento (forse è già passato o collegato ad altro)."; 
    }
}

// 2. GESTIONE INSERIMENTO
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_evento'])) {
    // Recupero dati dal form
    $nome = $_POST['nome'];
    $data = $_POST['data'];
    $inizio = $_POST['inizio'];
    $fine = $_POST['fine'];
    $tipo = $_POST['tipo'];

    // Chiamata al DB
    $res = $dbh->insertEvento($nome, $data, $inizio, $fine, $tipo);

    if ($res) {
        $messaggio = "Nuovo evento programmato!";
    } else {
        $errore = "Errore durante l'inserimento (controlla se il nome esiste già).";
    }
}
$lista_eventi = $dbh->getEventi();
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
        .btn-add { background: #5cb85c; color: white; padding: 10px; border: none; cursor: pointer; font-size: 1rem; margin-top: 10px; width: 100%; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 20px; }
        input, select { padding: 8px; border: 1px solid #ccc; width: 100%; box-sizing: border-box; }
        label { font-weight: bold; font-size: 0.9rem; margin-bottom: 5px; display: block; }
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
            <h3>📅 Eventi Programmati</h3>
            <table>
                <thead>
                    <tr>
                        <th>Nome Evento</th>
                        <th>Data</th>
                        <th>Orario</th>
                        <th>Tipo</th>
                        <th>Azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(count($lista_eventi) > 0): ?>
                        <?php foreach ($lista_eventi as $ev): ?>
                        <tr>
                            <td><b><?php echo htmlspecialchars($ev['nomeEvento']); ?></b></td>
                            <td><?php echo htmlspecialchars($ev['data']); ?></td>
                            <td>
                                <?php echo substr($ev['oraInizio'], 0, 5); ?> - 
                                <?php echo isset($ev['oraFine']) ? substr($ev['oraFine'], 0, 5) : '?'; ?>
                            </td>
                            <td><?php echo htmlspecialchars($ev['tipologiaEvento'] ?? '-'); ?></td>
                            <td>
                                <a href="?action=delete_evento&id=<?php echo urlencode($ev['nomeEvento']); ?>" 
                                   class="btn-delete" onclick="return confirm('Sei sicuro di voler eliminare questo evento?');">Elimina</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr><td colspan="5" style="text-align:center; color:#777;">Nessun evento futuro in programma.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>

        <div class="section-box">
            <h3>Aggiungi Nuovo Evento</h3>
            <form method="post">
                <input type="hidden" name="form_evento" value="1">
                <div class="form-grid">
                    
                    <div style="grid-column: span 2;">
                        <label>Nome Evento</label>
                        <input type="text" name="nome" placeholder="Es. Notte Bianca" required>
                    </div>

                    <div>
                        <label>Data</label>
                        <input type="date" name="data" required>
                    </div>

                    <div>
                        <label>Tipologia</label>
                        <select name="tipo">
                            <option value="Parata">Parata</option>
                            <option value="Concerto">Concerto</option>
                            <option value="Spettacolo">Spettacolo Pirotecnico</option>
                            <option value="Animazione">Animazione Bambini</option>
                        </select>
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