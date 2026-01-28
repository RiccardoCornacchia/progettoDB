<?php
require 'config/config.php';

if (isset($_GET['elimina_cf'])) {
    $dbh->deleteTurno($_GET['elimina_cf'], $_GET['data_t'], $_GET['inizio_t']);
    header("Location: gestione_turni_lavoro.php?data_sel=" . $_GET['data_t']);
    exit();
}

if (isset($_POST['azione']) && $_POST['azione'] == 'aggiungi_turno') {
    $dbh->addTurno($_POST['cf'], $_POST['oraInizio'], $_POST['oraFine'], $_POST['data']);
    header("Location: gestione_turni_lavoro.php?data_sel=" . $_POST['data']);
    exit();
}

$dataSelezionata = $_GET['data_sel'] ?? date('2026-07-28');
$turni = $dbh->getTurniPerData($dataSelezionata);
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Turni</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7f6; padding: 20px; }
        .container { max-width: 900px; margin: 0 auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .form-box { background: #eef2f3; padding: 20px; border-radius: 6px; margin-bottom: 30px; }
        .grid-form { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 10px; }
        input, button { padding: 10px; border: 1px solid #ccc; border-radius: 4px; }
        .btn-add { background: #27ae60; color: white; border: none; cursor: pointer; font-weight: bold; }
        .filter-box { margin-bottom: 20px; padding: 10px; border-bottom: 2px solid #3498db; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { padding: 12px; border-bottom: 1px solid #eee; text-align: left; }
        th { background: #34495e; color: white; }
        .btn-del { color: #e74c3c; text-decoration: none; border: 1px solid #e74c3c; padding: 5px 8px; border-radius: 4px; font-size: 0.8rem; }
        .btn-del:hover { background: #e74c3c; color: white; }
    </style>
</head>
<body>

<div class="container">
    <a href="sezione_lavoratori_admin.php" style="text-decoration:none;">&larr; Torna a Lavoratori</a>
    <h1>Gestione Turni di Lavoro</h1>

    <div class="form-box">
        <h3>Inserisci Nuovo Turno</h3>
        <form method="POST">
            <input type="hidden" name="action" value="aggiungi_turno">
            <div class="grid-form">
                <input type="text" name="cf" placeholder="Codice Fiscale" required>
                <input type="date" name="data" value="<?php echo $dataSelezionata; ?>" required>
                <input type="time" name="oraInizio" required title="Ora Inizio">
                <input type="time" name="oraFine" required title="Ora Fine">
                <button type="submit" class="btn-add">Salva Turno</button>
            </div>
        </form>
    </div>

    <div class="filter-box">
        <form method="GET">
            <label>Visualizza turni del giorno: </label>
            <input type="date" name="data_sel" value="<?php echo $dataSelezionata; ?>" onchange="this.form.submit()">
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>Lavoratore (CF)</th>
                <th>Inizio</th>
                <th>Fine</th>
                <th>Data</th>
                <th>Azioni</th>
            </tr>
        </thead>
        <tbody>
            <?php if(empty($turni)): ?>
                <tr><td colspan="5" style="text-align:center;">Nessun turno programmato per questa data.</td></tr>
            <?php else: ?>
                <?php foreach ($turni as $t): ?>
                <tr>
                    <td><?php echo htmlspecialchars($t['CF']); ?></td>
                    <td><?php echo htmlspecialchars($t['oraInizio']); ?></td>
                    <td><?php echo htmlspecialchars($t['oraFine']); ?></td>
                    <td><?php echo htmlspecialchars($t['data']); ?></td>
                    <td>
                        <a href="?elimina_cf=<?php echo $t['CF']; ?>&data_t=<?php echo $t['data']; ?>&inizio_t=<?php echo $t['oraInizio']; ?>" 
                           class="btn-del" 
                           onclick="return confirm('Eliminare questo turno?')">Elimina</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>

</body>
</html>