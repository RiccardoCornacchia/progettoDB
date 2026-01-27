<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') { header("Location: login.php"); exit; }

$messaggio = ""; $errore = "";

if (isset($_GET['action']) && $_GET['action'] == 'delete_attivita' && isset($_GET['id'])) {
    try {
        $dbh->deleteAttivitaCommerciale($_GET['id']);
        $messaggio = "Attività eliminata!";
    } catch (Exception $e) { $errore = "Impossibile eliminare."; }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_attivita'])) {
    $res = $dbh->insertAttivitaCommerciale(
        $_POST['codice'], $_POST['nome'], $_POST['apertura'], 
        $_POST['chiusura'], $_POST['disponibilita'], $_POST['dipendenti'], $_POST['tipo']
    );
    if ($res) $messaggio = "Nuova attività aggiunta!"; else $errore = "Errore inserimento (ID duplicato?).";
}

$lista_attivita = $dbh->getAttivitaCommerciali();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Attività</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 0; display: flex; height: 100vh; background: #f4f6f8; }
        .sidebar { width: 250px; background: #2c3e50; color: white; display: flex; flex-direction: column; padding: 20px; overflow-y: auto; }
        .sidebar h2 { color: #ecf0f1; text-align: center; margin-bottom: 30px; }
        .menu-link { padding: 15px; color: #bdc3c7; text-decoration: none; border-radius: 5px; margin-bottom: 5px; display: block; }
        .menu-link:hover, .active { background: #34495e; color: white; }
        .logout { margin-top: auto; background: #e74c3c; color: white; text-align: center; }
        .main-content { flex: 1; padding: 40px; overflow-y: auto; }
        .section-box { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); margin-bottom: 40px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 0.9rem; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f9fa; }
        .btn-delete { background: #e74c3c; color: white; padding: 5px 10px; text-decoration: none; border-radius: 4px; font-size: 0.8rem; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 20px; background: #f9f9f9; padding: 20px; border-radius: 8px; }
        input, select { padding: 10px; border: 1px solid #ccc; border-radius: 4px; width: 100%; box-sizing: border-box; }
        .btn-add { grid-column: span 2; background: #27ae60; color: white; padding: 10px; border: none; cursor: pointer; border-radius: 4px; font-weight: bold; margin-top: 10px; }
        .msg-success { background: #d4edda; color: #155724; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
        .msg-error { background: #f8d7da; color: #721c24; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
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
                    <input type="number" name="codice" placeholder="Codice ID (es. 101)" required>
                    <input type="text" name="nome" placeholder="Nome Attività" required>
                    <select name="tipo">
                        <option value="Ristorante">Ristorante</option>
                        <option value="Negozio">Negozio Souvenir</option>
                        <option value="NegozioFoto">Negozio Foto</option>
                        <option value="Bar">Bar/Chiosco</option>
                    </select>
                    <input type="number" name="dipendenti" placeholder="N. Dipendenti" required>
                    <div style="grid-column: span 1;"><label>Apre:</label><input type="time" name="apertura" value="09:00" required></div>
                    <div style="grid-column: span 1;"><label>Chiude:</label><input type="time" name="chiusura" value="22:00" required></div>
                    <select name="disponibilita" style="grid-column: span 2;">
                        <option value="Aperta">Aperta</option>
                        <option value="Chiusa">Chiusa</option>
                    </select>
                    <button type="submit" class="btn-add">Aggiungi Attività</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>