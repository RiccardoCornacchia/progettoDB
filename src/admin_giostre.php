<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$messaggio = "";
$errore = "";

// 1. Recupero lista subito per controlli
$lista_giostre = $dbh->getGiostre();

if (isset($_GET['action']) && $_GET['action'] == 'delete_giostra' && isset($_GET['id'])) {
    try {
        $dbh->deleteGiostra($_GET['id']);
        $messaggio = "Giostra eliminata!";
        $lista_giostre = $dbh->getGiostre();
    } catch (Exception $e) {
        $errore = "Impossibile eliminare: usata altrove.";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_giostra'])) {
    
    $nome_inserito = $_POST['nome'];
    $esiste_gia = false;

    // Controllo duplicati
    foreach ($lista_giostre as $g) {
        if (strcasecmp($g['nomeGiostra'], $nome_inserito) == 0) {
            $esiste_gia = true;
            break;
        }
    }

    if ($esiste_gia) {
        $errore = "Attenzione: Esiste già una giostra con il nome '$nome_inserito'!";
    } else {
        // Chiamata alla funzione aggiornata con TUTTI i parametri
        $res = $dbh->insertGiostra(
            $_POST['nome'], 
            $_POST['capienza'], 
            $_POST['disponibilita'], 
            $_POST['etamin'],       // Età Minima
            $_POST['durata'], 
            $_POST['acquatica'], 
            $_POST['etamax'],       // NUOVO: Età Massima
            $_POST['velocita'], 
            $_POST['altezzamax'],   // NUOVO: Altezza Max
            $_POST['tipo']
        );

        if ($res) {
            $messaggio = "Nuova giostra aggiunta!";
            $lista_giostre = $dbh->getGiostre();
        } else {
            $errore = "Errore generico durante l'inserimento (controlla i dati).";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Giostre</title>
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
        label { font-size: 0.8rem; font-weight: bold; margin-bottom: 2px; display: block; }
    </style>
</head>
<body>

    <?php include 'admin_sidebar.php'; ?>

    <div class="main-content">
        <h1>Gestione Giostre</h1>

        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="section-box">
            <h3>Elenco Giostre</h3>
            <table>
                <thead>
                    <tr>
                        <th>Nome</th><th>Tipo</th><th>Stato</th><th>Capienza</th><th>Azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($lista_giostre as $g): ?>
                    <tr>
                        <td><b><?php echo htmlspecialchars($g['nomeGiostra']); ?></b></td>
                        <td><?php echo htmlspecialchars($g['tipologiaGiostra']); ?></td>
                        <td><?php echo ($g['disponibilita'] == 1 || $g['disponibilita'] == 'Aperta') ? 'Aperta' : 'Chiusa'; ?></td>
                        <td><?php echo htmlspecialchars($g['capienza']); ?></td>
                        <td>
                            <a href="?action=delete_giostra&id=<?php echo urlencode($g['nomeGiostra']); ?>" 
                               class="btn-delete" onclick="return confirm('Sicuro?');">Elimina</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h3>Aggiungi Nuova Giostra</h3>
            <form method="post">
                <input type="hidden" name="form_giostra" value="1">
                <div class="form-grid">
                    <div><label>Nome Giostra</label><input type="text" name="nome" placeholder="Es. Brucomela" required></div>
                    
                    <div>
                        <label>Tipologia</label>
                        <select name="tipo">
                            <option value="Avventura">Avventura</option>
                            <option value="Bambini">Bambini</option>
                            <option value="Montagna Russa">Montagna Russa</option>
                        </select>
                    </div>

                    <div><label>Capienza Persone</label><input type="number" name="capienza" placeholder="Es. 20" required></div>
                    <div><label>Durata (min)</label><input type="number" name="durata" placeholder="Es. 5" required></div>
                    
                    <div><label>Età Minima</label><input type="number" name="etamin" placeholder="Es. 6" required></div>
                    <div><label>Età Massima</label><input type="number" name="etamax" placeholder="Es. 90" required></div>

                    <div><label>Velocità (km/h)</label><input type="number" step="0.1" name="velocita" placeholder="Es. 50.5" required></div>
                    <div><label>Altezza Max Visitatore (cm)</label><input type="number" name="altezzamax" placeholder="Es. 200" required></div>

                    <div>
                        <label>Acquatica</label>
                        <select name="acquatica">
                            <option value="0">No</option>
                            <option value="1">Si</option>
                        </select>
                    </div>
                    <div>
                        <label>Stato</label>
                        <select name="disponibilita">
                            <option value="1">Aperta</option>
                            <option value="0">Chiusa</option>
                        </select>
                    </div>

                    <button type="submit" class="btn-add">Aggiungi Giostra</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>