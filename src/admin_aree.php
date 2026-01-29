<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') { 
    header("Location: login.php"); 
    exit; 
}

$messaggio = ""; 
$errore = "";

$lista_aree = $dbh->getAreeTematiche();

if (isset($_GET['action']) && $_GET['action'] == 'delete_area' && isset($_GET['id'])) {
    try {
        $dbh->deleteAreaTematica($_GET['id']);
        $messaggio = "Area Tematica eliminata!";
        $lista_aree = $dbh->getAreeTematiche();
    } catch (Exception $e) { 
        $errore = "Impossibile eliminare: l'area potrebbe essere collegata ad altre tabelle."; 
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_area'])) {
    
    $nome_inserito = $_POST['nome'];
    $esiste_gia = false;

    foreach ($lista_aree as $area) {
        if (strcasecmp($area['nomeAreaTematica'], $nome_inserito) == 0) {
            $esiste_gia = true;
            break;
        }
    }

    if ($esiste_gia) {
        $errore = "Attenzione: Esiste già un'Area Tematica con il nome '$nome_inserito'!";
    } else {
        $inizio = $_POST['inizio'];
        $fine = $_POST['fine'];
        
        $ts_inizio = strtotime($inizio);
        $ts_fine = strtotime($fine);

        if ($ts_fine <= $ts_inizio) {
            $errore = "Errore: La data di fine deve essere successiva alla data di inizio.";
        } else {
            $res = $dbh->insertAreaTematica(
                $nome_inserito, 
                $_POST['disponibilita'], 
                $_POST['tema'],        
                $inizio, 
                $fine
            );

            if ($res) {
                $messaggio = "Nuova Area Tematica creata!";
                $lista_aree = $dbh->getAreeTematiche();
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
    <title>Gestione Aree Tematiche</title>
    <style>
        body { font-family: sans-serif; margin: 0; display: flex; height: 100vh; background-color: #eee; }
        .sidebar { width: 250px; background: #333; color: white; display: flex; flex-direction: column; padding: 20px; overflow-y: auto; }
        .sidebar h2 { margin-bottom: 30px; text-align: center; }
        .menu-link { padding: 10px; color: #ccc; text-decoration: none; display: block; margin-bottom: 5px; }
        .menu-link:hover, .active { background: #444; color: white; }
        .logout { margin-top: auto; background: #b00; color: white; text-align: center; }
        .main-content { flex: 1; padding: 40px; overflow-y: auto; }
        .section-box { background: white; padding: 20px; border: 1px solid #ccc; margin-bottom: 30px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f0f0f0; }
        .btn-delete { background: #d9534f; color: white; padding: 5px 10px; text-decoration: none; font-size: 0.8rem; }
        .btn-add { background: #5cb85c; color: white; padding: 10px; border: none; cursor: pointer; width: 100%; font-size: 1rem; margin-top: 10px; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 20px; }
        input, select { padding: 10px; border: 1px solid #ccc; width: 100%; box-sizing: border-box; }
        .msg-success { background: #dff0d8; color: #3c763d; padding: 15px; margin-bottom: 20px; border: 1px solid #d6e9c6; }
        .msg-error { background: #f2dede; color: #a94442; padding: 15px; margin-bottom: 20px; border: 1px solid #ebccd1; }
    </style>
</head>
<body>
    <?php include 'admin_sidebar.php'; ?>

    <div class="main-content">
        <h1>Aree Tematiche</h1>
        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="section-box">
            <h3>Elenco Aree</h3>
            <table>
                <thead>
                    <tr><th>Nome Area</th><th>Tema</th><th>Periodo</th><th>Stato</th><th>Azioni</th></tr>
                </thead>
                <tbody>
                    <?php if(count($lista_aree) > 0): ?>
                        <?php foreach ($lista_aree as $area): ?>
                        <tr>
                            <td><b><?php echo htmlspecialchars($area['nomeAreaTematica']); ?></b></td>
                            <td><?php echo htmlspecialchars($area['tema']); ?></td>
                            <td><?php echo $area['dataInizio'] . ' / ' . $area['dataFine']; ?></td>
                            <td>
                                <?php echo ($area['disponibilita'] == 1 || $area['disponibilita'] == 'Aperta') ? 'Aperta' : 'Chiusa'; ?>
                            </td>
                            <td>
                                <a href="?action=delete_area&id=<?php echo urlencode($area['nomeAreaTematica']); ?>" class="btn-delete" onclick="return confirm('Sicuro?');">Elimina</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr><td colspan="5" style="text-align:center;">Nessuna area presente.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>

            <h3>Crea Nuova Area Tematica</h3>
            <form method="post">
                <input type="hidden" name="form_area" value="1">
                <div class="form-grid">
                    <input type="text" name="nome" placeholder="Nome Area (es. Far West)" required>
                    <input type="text" name="tema" placeholder="Tema (es. Western)" required>
                    
                    <div style="grid-column: span 1;">
                        <label style="font-size:0.9rem; font-weight:bold;">Inizio:</label>
                        <input type="date" name="inizio" required>
                    </div>
                    <div style="grid-column: span 1;">
                        <label style="font-size:0.9rem; font-weight:bold;">Fine:</label>
                        <input type="date" name="fine" required>
                    </div>

                    <select name="disponibilita" style="grid-column: span 2;">
                        <option value="1">Aperta</option>
                        <option value="0">Chiusa</option>
                    </select>
                    <button type="submit" class="btn-add">Crea Area</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>