<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$messaggio = "";
$errore = "";

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

    foreach ($lista_giostre as $g) {
        if (strcasecmp($g['nomeGiostra'], $nome_inserito) == 0) {
            $esiste_gia = true;
            break;
        }
    }

    if ($esiste_gia) {
        $errore = "Attenzione: Esiste già una giostra con il nome '$nome_inserito'!";
    } else {
        $res = $dbh->insertGiostra(
            $_POST['nome'], $_POST['capienza'], $_POST['disponibilita'], 
            $_POST['eta'], $_POST['durata'], $_POST['acquatica'], 
            $_POST['velocita'], $_POST['tipo']
        );

        if ($res) {
            $messaggio = "Nuova giostra aggiunta!";
            $lista_giostre = $dbh->getGiostre();
        } else {
            $errore = "Errore generico durante l'inserimento.";
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
                        <td><?php echo htmlspecialchars($g['disponibilita']); ?></td>
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
                    <input type="text" name="nome" placeholder="Nome Giostra" required>
                    <select name="tipo">
                        <option value="Avventura">Avventura</option>
                        <option value="Bambini">Bambini</option>
                        <option value="Motantagna Russa">Motantagna Russa</option>
                    </select>
                    <input type="number" name="capienza" placeholder="Capienza" required>
                    <input type="number" name="eta" placeholder="Età Minima" required>
                    <input type="number" name="durata" placeholder="Durata (min)" required>
                    <input type="number" step="0.1" name="velocita" placeholder="Velocità (km/h)" required>
                    <select name="acquatica"><option value="0">No Acqua</option><option value="1">Si Acqua</option></select>
                    <select name="disponibilita"><option value="1">Aperta</option><option value="0">Chiusa</option></select>
                    <button type="submit" class="btn-add">Aggiungi Giostra</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>