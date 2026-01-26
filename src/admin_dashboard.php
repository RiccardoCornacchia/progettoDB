<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$messaggio = "";
$errore = "";

if (isset($_GET['action']) && isset($_GET['id'])) {
    $id = $_GET['id'];
    
    try {
        if ($_GET['action'] == 'delete_giostra') {
            $dbh->deleteGiostra($id);
            $messaggio = "Giostra eliminata con successo!";
        } 
        elseif ($_GET['action'] == 'delete_biglietto') {
            $dbh->deleteTipologiaBiglietto($id);
            $messaggio = "Biglietto eliminato con successo!";
        }
    } catch (Exception $e) {
        $errore = "Impossibile eliminare: l'elemento potrebbe essere collegato ad altre tabelle.";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_giostra'])) {
    $res = $dbh->insertGiostra(
        $_POST['nome'], 
        $_POST['capienza'], 
        $_POST['disponibilita'], 
        $_POST['eta'], 
        $_POST['durata'], 
        $_POST['acquatica'], 
        $_POST['velocita'], 
        $_POST['tipo']
    );

    if ($res) {
        $messaggio = "Nuova giostra aggiunta!";
    } else {
        $errore = "Errore durante l'inserimento della giostra.";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_biglietto'])) {
    $res = $dbh->insertTipologiaBiglietto($_POST['nome'], $_POST['prezzo']);
    
    if ($res) {
        $messaggio = "Nuovo tipo di biglietto creato!";
    } else {
        $errore = "Errore durante l'inserimento del biglietto.";
    }
}

$lista_giostre = $dbh->getGiostre();
$lista_biglietti = $dbh->getTipologieBiglietti();
$num_visitatori = $dbh->countVisitatori();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - WonderPark</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 0; display: flex; height: 100vh; background: #f4f6f8; }
        .sidebar { width: 250px; background: #2c3e50; color: white; display: flex; flex-direction: column; padding: 20px; }
        .sidebar h2 { color: #ecf0f1; text-align: center; margin-bottom: 30px; }
        .menu-link { padding: 15px; color: #bdc3c7; text-decoration: none; border-radius: 5px; margin-bottom: 5px; display: block; }
        .menu-link:hover, .active { background: #34495e; color: white; }
        .logout { margin-top: auto; background: #e74c3c; color: white; text-align: center; }
        .main-content { flex: 1; padding: 40px; overflow-y: auto; }
        .stats-container { display: flex; gap: 20px; margin-bottom: 40px; }
        .stat-card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); flex: 1; text-align: center; }
        .stat-number { font-size: 2.5rem; font-weight: bold; color: #2980b9; margin: 10px 0; }
        .section-box { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); margin-bottom: 40px; }
        h3 { border-bottom: 2px solid #eee; padding-bottom: 10px; margin-top: 0; color: #2c3e50; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f9fa; }
        .btn-delete { background: #e74c3c; color: white; padding: 5px 10px; text-decoration: none; border-radius: 4px; font-size: 0.8rem; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 20px; background: #f9f9f9; padding: 20px; border-radius: 8px; }
        input, select { padding: 10px; border: 1px solid #ccc; border-radius: 4px; width: 100%; box-sizing: border-box; }
        .btn-add { grid-column: span 2; background: #27ae60; color: white; padding: 10px; border: none; cursor: pointer; border-radius: 4px; font-weight: bold; margin-top: 10px; }
        .btn-add:hover { background: #219150; }
        .msg-success { background: #d4edda; color: #155724; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
        .msg-error { background: #f8d7da; color: #721c24; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>🔧 ADMIN PANEL</h2>
        <a href="#statistiche" class="menu-link active">Dashboard</a>
        <a href="#gestione-giostre" class="menu-link">🎢 Gestione Giostre</a>
        <a href="#gestione-biglietti" class="menu-link">🎟 Biglietti & Prezzi</a>
        <a href="logout.php" class="menu-link logout">Esci</a>
    </div>

    <div class="main-content">
        
        <h1>Benvenuto Amministratore</h1>

        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="stats-container" id="statistiche">
            <div class="stat-card">
                <div>Visitatori Registrati</div>
                <div class="stat-number"><?php echo $num_visitatori; ?></div>
            </div>
            <div class="stat-card">
                <div>Giostre Attive</div>
                <div class="stat-number"><?php echo count($lista_giostre); ?></div>
            </div>
            <div class="stat-card">
                <div>Tipi di Biglietto</div>
                <div class="stat-number"><?php echo count($lista_biglietti); ?></div>
            </div>
        </div>

        <div class="section-box" id="gestione-giostre">
            <h3>🎢 Gestione Giostre</h3>
            
            <table>
                <thead>
                    <tr>
                        <th>Nome Giostra</th>
                        <th>Tipo</th>
                        <th>Stato</th>
                        <th>Capienza</th>
                        <th>Azioni</th>
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
                               class="btn-delete" onclick="return confirm('Sicuro di voler eliminare questa giostra?');">Elimina</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h4>Aggiungi Nuova Giostra</h4>
            <form method="post">
                <input type="hidden" name="form_giostra" value="1">
                <div class="form-grid">
                    <input type="text" name="nome" placeholder="Nome Giostra (es. Katun)" required>
                    <select name="tipo">
                        <option value="Adrenalina">Adrenalina</option>
                        <option value="Bambini">Bambini</option>
                        <option value="Acqua">Acqua</option>
                        <option value="Famiglia">Famiglia</option>
                    </select>
                    <input type="number" name="capienza" placeholder="Capienza Persone" required>
                    <input type="number" name="eta" placeholder="Età Minima (anni)" required>
                    <input type="number" name="durata" placeholder="Durata (minuti)" required>
                    <input type="number" step="0.1" name="velocita" placeholder="Velocità (km/h)" required>
                    
                    <select name="acquatica">
                        <option value="No">Non Acquatica</option>
                        <option value="Si">Acquatica</option>
                    </select>
                    <select name="disponibilita">
                        <option value="Aperta">Aperta</option>
                        <option value="Manutenzione">Manutenzione</option>
                        <option value="Chiusa">Chiusa</option>
                    </select>

                    <button type="submit" class="btn-add">+ Aggiungi Giostra</button>
                </div>
            </form>
        </div>

        <div class="section-box" id="gestione-biglietti">
            <h3>🎟 Gestione Prezzi Biglietti</h3>
            
            <table>
                <thead>
                    <tr>
                        <th>Nome Biglietto</th>
                        <th>Prezzo Attuale</th>
                        <th>Azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($lista_biglietti as $b): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($b['nomeBiglietto']); ?></td>
                        <td><?php echo htmlspecialchars($b['prezzo']); ?> €</td>
                        <td>
                            <a href="?action=delete_biglietto&id=<?php echo urlencode($b['nomeBiglietto']); ?>" 
                               class="btn-delete" onclick="return confirm('Eliminare questo biglietto?');">Elimina</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h4>Crea Nuovo Tipo Biglietto</h4>
            <form method="post">
                <input type="hidden" name="form_biglietto" value="1">
                <div class="form-grid">
                    <input type="text" name="nome" placeholder="Nome (es. VIP Pass)" required>
                    <input type="number" step="0.01" name="prezzo" placeholder="Prezzo (€)" required>
                    <button type="submit" class="btn-add" style="background:#f39c12;">+ Crea Biglietto</button>
                </div>
            </form>
        </div>

    </div>

</body>
</html>