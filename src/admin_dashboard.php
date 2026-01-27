<?php
require 'config/config.php';

// Controllo accesso Admin
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
        elseif ($_GET['action'] == 'delete_attrazione') {
            $dbh->deleteAttrazionePaura($id);
            $messaggio = "Attrazione eliminata con successo!";
        }
        elseif ($_GET['action'] == 'delete_attivita') {
            $dbh->deleteAttivitaCommerciale($id);
            $messaggio = "Attività commerciale eliminata con successo!";
        }
    } catch (Exception $e) {
        $errore = "Impossibile eliminare: l'elemento potrebbe essere collegato ad altre tabelle.";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_giostra'])) {
    $res = $dbh->insertGiostra(
        $_POST['nome'], $_POST['capienza'], $_POST['disponibilita'], 
        $_POST['eta'], $_POST['durata'], $_POST['acquatica'], 
        $_POST['velocita'], $_POST['tipo']
    );
    if ($res) $messaggio = "Nuova giostra aggiunta!";
    else $errore = "Errore inserimento giostra.";
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_biglietto'])) {
    $res = $dbh->insertTipologiaBiglietto($_POST['nome'], $_POST['prezzo']);
    if ($res) $messaggio = "Nuovo tipo di biglietto creato!";
    else $errore = "Errore inserimento biglietto.";
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_attrazione'])) {
    $res = $dbh->insertAttrazionePaura(
        $_POST['nome'], $_POST['disponibilita'], $_POST['prezzo'], 
        $_POST['inizio'], $_POST['fine']
    );
    if ($res) $messaggio = "Nuova attrazione horror aggiunta!";
    else $errore = "Errore inserimento attrazione.";
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_attivita'])) {
    $res = $dbh->insertAttivitaCommerciale(
        $_POST['codice'], $_POST['nome'], $_POST['apertura'], 
        $_POST['chiusura'], $_POST['disponibilita'], 
        $_POST['dipendenti'], $_POST['tipo']
    );
    if ($res) $messaggio = "Nuova attività commerciale aggiunta!";
    else $errore = "Errore inserimento attività (controlla che il codice ID non sia duplicato).";
}
$lista_giostre = $dbh->getGiostre();
$lista_biglietti = $dbh->getTipologieBiglietti();
$num_lavoratori = $dbh->countLavoratori(); 
$lista_attrazioni = $dbh->getAttrazioniPaura();
$lista_attivita = $dbh->getAttivitaCommerciali();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - WonderPark</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 0; display: flex; height: 100vh; background: #f4f6f8; }
        
        .sidebar { width: 250px; background: #2c3e50; color: white; display: flex; flex-direction: column; padding: 20px; overflow-y: auto; }
        .sidebar h2 { color: #ecf0f1; text-align: center; margin-bottom: 30px; }
        .menu-link { padding: 15px; color: #bdc3c7; text-decoration: none; border-radius: 5px; margin-bottom: 5px; display: block; }
        .menu-link:hover, .active { background: #34495e; color: white; }
        .logout { margin-top: auto; background: #e74c3c; color: white; text-align: center; }

        .main-content { flex: 1; padding: 40px; overflow-y: auto; }
        
        .stats-container { display: flex; gap: 20px; margin-bottom: 40px; flex-wrap: wrap; }
        .stat-card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); flex: 1; min-width: 150px; text-align: center; }
        .stat-number { font-size: 2.5rem; font-weight: bold; color: #2980b9; margin: 10px 0; }

        .section-box { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); margin-bottom: 40px; }
        h3 { border-bottom: 2px solid #eee; padding-bottom: 10px; margin-top: 0; color: #2c3e50; }

        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 0.9rem; }
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
        <a href="#gestione-giostre" class="menu-link">Giostre</a>
        <a href="#gestione-attrazioni" class="menu-link"> Attrazioni Horror</a>
        <a href="#gestione-attivita" class="menu-link">Attività Commerciale</a>
        <a href="logout.php" class="menu-link logout">Esci</a>
    </div>

    <div class="main-content">
        
        <h1>Benvenuto Amministratore</h1>

        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="stats-container" id="statistiche">
            <div class="stat-card">
                <div>Lavoratori</div>
                <div class="stat-number"><?php echo $num_lavoratori; ?></div>
            </div>
            <div class="stat-card">
                <div>Giostre</div>
                <div class="stat-number"><?php echo count($lista_giostre); ?></div>
            </div>
            <div class="stat-card">
                <div>Attività Commerciale</div>
                <div class="stat-number"><?php echo count($lista_attivita); ?></div>
            </div>
            <div class="stat-card">
                <div>Biglietti</div>
                <div class="stat-number"><?php echo count($lista_biglietti); ?></div>
            </div>
        </div>

        <div class="section-box" id="gestione-giostre">
            <h3> Gestione Giostre</h3>
            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
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
                               class="btn-delete" onclick="return confirm('Sicuro?');">Elimina</a>
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
                        <option value="Avventura">Avventura</option>
                        <option value="Bambini">Bambini</option>
                        <option value="Montagna Russa">Montagna Russa</option>
                    </select>
                    <input type="number" name="capienza" placeholder="Capienza" required>
                    <input type="number" name="eta" placeholder="Età Minima" required>
                    <input type="number" name="durata" placeholder="Durata (min)" required>
                    <input type="number" step="0.1" name="velocita" placeholder="Velocità (km/h)" required>
                    <select name="acquatica"><option value="No">No Acqua</option><option value="Si">Si Acqua</option></select>
                    <select name="disponibilita"><option value="Aperta">Aperta</option><option value="Chiusa">Chiusa</option></select>
                    <button type="submit" class="btn-add">Aggiungi Giostra</button>
                </div>
            </form>
        </div>

        <div class="section-box" id="gestione-attrazioni">
            <h3> Attrazioni di Paura</h3>
            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Prezzo Extra</th>
                        <th>Periodo</th>
                        <th>Stato</th>
                        <th>Azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($lista_attrazioni as $a): ?>
                    <tr>
                        <td><b><?php echo htmlspecialchars($a['nomeAttrazionePaura']); ?></b></td>
                        <td><?php echo htmlspecialchars($a['prezzoAggiuntivo']); ?> €</td>
                        <td><?php echo $a['dataInizio'] . ' / ' . $a['dataFine']; ?></td>
                        <td><?php echo htmlspecialchars($a['disponibilita']); ?></td>
                        <td>
                            <a href="?action=delete_attrazione&id=<?php echo urlencode($a['nomeAttrazionePaura']); ?>" 
                               class="btn-delete" onclick="return confirm('Sicuro?');">Elimina</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h4>Aggiungi Attrazione Horror</h4>
            <form method="post">
                <input type="hidden" name="form_attrazione" value="1">
                <div class="form-grid">
                    <input type="text" name="nome" placeholder="Nome Attrazione" required>
                    <input type="number" step="0.50" name="prezzo" placeholder="Prezzo Extra (€)" required>
                    
                    <div style="grid-column: span 1;">
                        <label>Inizio:</label>
                        <input type="date" name="inizio" required>
                    </div>
                    <div style="grid-column: span 1;">
                        <label>Fine:</label>
                        <input type="date" name="fine" required>
                    </div>

                    <select name="disponibilita" style="grid-column: span 2;">
                        <option value="Aperta">Aperta</option>
                        <option value="Chiusa">Chiusa</option>
                    </select>

                    <button type="submit" class="btn-add">Aggiungi Attrazione</button>
                </div>
            </form>
        </div>

        <div class="section-box" id="gestione-attivita">
            <h3>🛍️ Attività Commerciali (Negozi & Food)</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Tipo</th>
                        <th>Orari</th>
                        <th>Dipendenti</th>
                        <th>Azioni</th>
                    </tr>
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
                            <a href="?action=delete_attivita&id=<?php echo urlencode($ac['codiceAttivita']); ?>" 
                               class="btn-delete" onclick="return confirm('Sicuro?');">Elimina</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h4>Aggiungi Attività Commerciale</h4>
            <form method="post">
                <input type="hidden" name="form_attivita" value="1">
                <div class="form-grid">
                    <input type="number" name="codice" placeholder="Codice ID (es. 101)" required>
                    <input type="text" name="nome" placeholder="Nome Attività" required>
                    
                    <select name="tipo">
                        <option value="Punto Ristoro">Punto Ristoro</option>
                        <option value="Negozio Souvenir">Negozio Souvenir</option>
                        <option value="NegozioFoto">Negozio Foto</option>
                        <option value="SalaGiochi">Sala Giochi</option>
                    </select>
                    
                    <input type="number" name="dipendenti" placeholder="N. Dipendenti" required>

                    <div style="grid-column: span 1;">
                        <label>Apertura:</label>
                        <input type="time" name="apertura" value="09:00" required>
                    </div>
                    <div style="grid-column: span 1;">
                        <label>Chiusura:</label>
                        <input type="time" name="chiusura" value="22:00" required>
                    </div>

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