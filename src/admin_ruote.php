<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') { header("Location: login.php"); exit; }

$messaggio = ""; $errore = "";

// DELETE
if (isset($_GET['action']) && $_GET['action'] == 'delete_ruota' && isset($_GET['id'])) {
    try {
        $dbh->deleteRuotaPanoramica($_GET['id']);
        $messaggio = "Ruota Panoramica eliminata!";
    } catch (Exception $e) { $errore = "Impossibile eliminare."; }
}

// INSERT
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_ruota'])) {
    $res = $dbh->insertRuotaPanoramica(
        $_POST['nome'], $_POST['disponibilita'], 
        $_POST['durata'], $_POST['altezza']
    );
    if ($res) $messaggio = "Nuova Ruota Panoramica aggiunta!"; else $errore = "Errore inserimento.";
}

$lista_ruote = $dbh->getRuotaPanoramica();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Ruota Panoramica</title>
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
</style>
</head>
<body>
    <?php include 'admin_sidebar.php'; ?>

    <div class="main-content">
        <h1>Ruota Panoramica</h1>
        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="section-box">
            <h3>Elenco Ruote</h3>
            <table>
                <thead>
                    <tr><th>Nome Ruota</th><th>Altezza (m)</th><th>Durata (min)</th><th>Stato</th><th>Azioni</th></tr>
                </thead>
                <tbody>
                    <?php foreach ($lista_ruote as $r): ?>
                    <tr>
                        <td><b><?php echo htmlspecialchars($r['nomeRuota']); ?></b></td>
                        <td><?php echo htmlspecialchars($r['altezzaRuotaPanoramica']); ?> m</td>
                        <td><?php echo htmlspecialchars($r['durataRuotaPanoramica']); ?> min</td>
                        <td><?php echo htmlspecialchars($r['disponibilita']); ?></td>
                        <td>
                            <a href="?action=delete_ruota&id=<?php echo urlencode($r['nomeRuota']); ?>" class="btn-delete" onclick="return confirm('Sicuro?');">Elimina</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h3>Aggiungi Ruota Panoramica</h3>
            <form method="post">
                <input type="hidden" name="form_ruota" value="1">
                <div class="form-grid">
                    <input type="text" name="nome" placeholder="Nome Ruota" required>
                    <input type="number" step="0.1" name="altezza" placeholder="Altezza (metri)" required>
                    <input type="number" name="durata" placeholder="Durata Giro (minuti)" required>
                    
                    <select name="disponibilita">
                        <option value="Aperta">Aperta</option>
                        <option value="Chiusa">Chiusa</option>
                        <option value="Manutenzione">Manutenzione</option>
                    </select>
                    <button type="submit" class="btn-add">Aggiungi Ruota</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>