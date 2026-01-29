<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') { 
    header("Location: index.php"); 
    exit; 
}

$messaggio = ""; 
$errore = "";

$lista_attrazioni = $dbh->getAttrazioniPaura();

if (isset($_GET['action']) && $_GET['action'] == 'delete_attrazione' && isset($_GET['id'])) {
    try {
        $dbh->deleteAttrazionePaura($_GET['id']);
        $messaggio = "Attrazione eliminata con successo!";
        $lista_attrazioni = $dbh->getAttrazioniPaura();
    } catch (Exception $e) { 
        $errore = "Impossibile eliminare: usata altrove."; 
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_attrazione'])) {
    
    $nome_inserito = $_POST['nome'];
    $esiste_gia = false;

    foreach ($lista_attrazioni as $a) {
        if (strcasecmp($a['nomeAttrazionePaura'], $nome_inserito) == 0) {
            $esiste_gia = true;
            break;
        }
    }

    if ($esiste_gia) {
        $errore = "Attenzione: Esiste già un'attrazione con il nome '$nome_inserito'!";
    } else {
        $inizio = $_POST['inizio'];
        $fine = $_POST['fine'];
        
        if ($fine <= $inizio) {
            $errore = "Errore: La data di fine deve essere successiva alla data di inizio.";
        } else {
            $res = $dbh->insertAttrazionePaura(
                $nome_inserito, 
                $_POST['disponibilita'], 
                $_POST['prezzo'], 
                $inizio, 
                $fine
            );
            
            if ($res) {
                $messaggio = "Nuova attrazione horror aggiunta!"; 
                $lista_attrazioni = $dbh->getAttrazioniPaura();
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
    <title>Gestione Attrazioni Horror</title>
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
        <h1>👻 Attrazioni di Paura</h1>
        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="section-box">
            <h3>Elenco Attrazioni</h3>
            <table>
                <thead>
                    <tr><th>Nome</th><th>Prezzo Extra</th><th>Periodo</th><th>Stato</th><th>Azioni</th></tr>
                </thead>
                <tbody>
                    <?php if(count($lista_attrazioni) > 0): ?>
                        <?php foreach ($lista_attrazioni as $a): ?>
                        <tr>
                            <td><b><?php echo htmlspecialchars($a['nomeAttrazionePaura']); ?></b></td>
                            <td><?php echo htmlspecialchars($a['prezzoAggiuntivo']); ?> €</td>
                            <td><?php echo $a['dataInizio'] . ' / ' . $a['dataFine']; ?></td>
                            <td>
                                <?php echo ($a['disponibilita'] == 1 || $a['disponibilita'] == 'Aperta') ? 'Aperta' : 'Chiusa'; ?>
                            </td>
                            <td>
                                <a href="?action=delete_attrazione&id=<?php echo urlencode($a['nomeAttrazionePaura']); ?>" class="btn-delete" onclick="return confirm('Sei sicuro di voler eliminare questa attrazione?');">Elimina</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr><td colspan="5" style="text-align:center;">Nessuna attrazione presente.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>

            <h3>Aggiungi Nuova Attrazione</h3>
            <form method="post">
                <input type="hidden" name="form_attrazione" value="1">
                <div class="form-grid">
                    <div style="grid-column: span 2;">
                        <label>Nome Attrazione</label>
                        <input type="text" name="nome" placeholder="Es. Casa degli Orrori" required>
                    </div>

                    <div style="grid-column: span 2;">
                        <label>Prezzo Extra (€)</label>
                        <input type="number" step="0.50" name="prezzo" placeholder="Es. 5.00" required>
                    </div>
                    
                    <div>
                        <label>Data di Apertura</label>
                        <input type="date" name="inizio" required>
                    </div>
                    
                    <div>
                        <label>Data di Chiusura</label>
                        <input type="date" name="fine" required>
                    </div>

                    <div style="grid-column: span 2;">
                        <label>Stato</label>
                        <select name="disponibilita">
                            <option value="1">Aperta</option>
                            <option value="0">Chiusa</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn-add">Aggiungi Attrazione</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>