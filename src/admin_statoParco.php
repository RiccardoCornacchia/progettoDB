<?php
require 'config/config.php';

// Controllo sicurezza: solo l'admin può accedere
if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$messaggio = "";
$errore = "";

// GESTIONE CAMBIO STATO (Logica Toggle)
if (isset($_GET['action']) && $_GET['action'] == 'toggle' && isset($_GET['tipo']) && isset($_GET['id'])) {
    $id = $_GET['id'];
    $tipo = $_GET['tipo'];
    $res = false;

    try {
        switch ($tipo) {
            case 'giostra':
                $res = $dbh->updateStatoGiostra($id); // Esegue: 1 - disponibilita
                break;
            case 'attivita':
                $res = $dbh->updateStatoAttivita($id); // Esegue: 1 - disponibilita
                break;
            case 'horror':
                $res = $dbh->updateStatoAttrazionePaura($id); // Esegue: 1 - disponibilita
                break;
            case 'cassa':
                $res = $dbh->updateStatoCassa($id); // Esegue: NOT stato
                break;
            case 'bagno':
                $res = $dbh->updateStatoBagno($id); // Esegue: 1 - disponibilita
                break;
        }
        if ($res) $messaggio = "Stato di " . htmlspecialchars($id) . " aggiornato!";
        else $errore = "Errore durante l'aggiornamento.";
    } catch (Exception $e) {
        $errore = "Errore: " . $e->getMessage();
    }
}

// RECUPERO DATI PER LE TABELLE
$lista_giostre = $dbh->getGiostre();
$lista_attivita = $dbh->getAttivitaCommerciali();
$lista_horror = $dbh->getAllAttrazioniPaura();
$lista_casse = $dbh->getCasse(); 
$lista_bagni = $dbh->getBagni();
$lista_manutenzioni = $dbh->getManutenzioniAttive();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Stato Parco - WonderPark</title>
    <style>
        /* CSS in linea con Gestione Giostre */
        body { font-family: 'Segoe UI', sans-serif; margin: 0; display: flex; height: 100vh; background: #f4f6f8; }
        .sidebar { width: 250px; background: #2c3e50; color: white; display: flex; flex-direction: column; padding: 20px; overflow-y: auto; }
        .sidebar h2 { color: #ecf0f1; text-align: center; margin-bottom: 30px; }
        .menu-link { padding: 15px; color: #bdc3c7; text-decoration: none; border-radius: 5px; margin-bottom: 5px; display: block; }
        .menu-link:hover, .active { background: #34495e; color: white; }
        .logout { margin-top: auto; background: #e74c3c; color: white; text-align: center; }
        
        .main-content { flex: 1; padding: 40px; overflow-y: auto; }
        .section-box { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); margin-bottom: 40px; }
        
        table { width: 100%; border-collapse: collapse; margin-top: 10px; font-size: 0.9rem; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f9fa; color: #34495e; text-transform: uppercase; font-size: 0.75rem; }
        
        /* Badges e Bottoni */
        .status-badge { padding: 4px 8px; border-radius: 4px; font-weight: bold; font-size: 0.8rem; }
        .bg-open { background: #d4edda; color: #155724; }
        .bg-closed { background: #f8d7da; color: #721c24; }
        
        .btn-toggle { 
            background: #3498db; color: white; padding: 5px 10px; 
            text-decoration: none; border-radius: 4px; font-size: 0.8rem; 
        }
        .btn-toggle:hover { background: #2980b9; }
        
        .msg-success { background: #d4edda; color: #155724; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
        .msg-error { background: #f8d7da; color: #721c24; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
        
        .grid-container { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
    </style>
</head>
<body>

    <?php include 'admin_sidebar.php'; ?>

    <div class="main-content">
        <h1>🛠 Stato Operativo Parco</h1>
        <p>Gestione disponibilità e apertura servizi in tempo reale.</p>

        <?php if ($messaggio): ?> <div class="msg-success"><?php echo $messaggio; ?></div> <?php endif; ?>
        <?php if ($errore): ?> <div class="msg-error"><?php echo $errore; ?></div> <?php endif; ?>

        <div class="grid-container">
            
            <div class="section-box">
                <h3>🎢 Giostre</h3>
                <table>
                    <thead><tr><th>Nome</th><th>Stato</th><th>Azione</th></tr></thead>
                    <tbody>
                        <?php foreach ($lista_giostre as $g): ?>
                        <tr>
                            <td><b><?php echo htmlspecialchars($g['nomeGiostra']); ?></b></td>
                            <td><span class="status-badge <?php echo ($g['disponibilita'] == 1 || $g['disponibilita'] == 'Aperta') ? 'bg-open' : 'bg-closed'; ?>">
                                <?php echo ($g['disponibilita'] == 1 || $g['disponibilita'] == 'Aperta') ? 'APERTA' : 'CHIUSA'; ?></span></td>
                            <td><a href="?action=toggle&tipo=giostra&id=<?php echo urlencode($g['nomeGiostra']); ?>" class="btn-toggle">Inverti</a></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <div class="section-box">
                <h3>💰 Casse</h3>
                <table>
                    <thead><tr><th>Numero</th><th>Stato</th><th>Azione</th></tr></thead>
                    <tbody>
                        <?php foreach ($lista_casse as $c): ?>
                        <tr>
                            <td><b>Cassa #<?php echo htmlspecialchars($c['numeroCassa']); ?></b></td>
                            <td><span class="status-badge <?php echo $c['stato'] ? 'bg-open' : 'bg-closed'; ?>">
                                <?php echo $c['stato'] ? 'ATTIVA' : 'CHIUSA'; ?></span></td>
                            <td><a href="?action=toggle&tipo=cassa&id=<?php echo urlencode($c['numeroCassa']); ?>" class="btn-toggle">Inverti</a></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <div class="section-box">
                <h3>🛍 Attività Commerciali</h3>
                <table>
                    <thead><tr><th>Nome</th><th>Stato</th><th>Azione</th></tr></thead>
                    <tbody>
                        <?php foreach ($lista_attivita as $a): ?>
                        <tr>
                            <td><b><?php echo htmlspecialchars($a['nomeAttivita']); ?></b></td>
                            <td><span class="status-badge <?php echo $a['disponibilita'] ? 'bg-open' : 'bg-closed'; ?>">
                                <?php echo $a['disponibilita'] ? 'ATTIVA' : 'CHIUSA'; ?></span></td>
                            <td><a href="?action=toggle&tipo=attivita&id=<?php echo urlencode($a['nomeAttivita']); ?>" class="btn-toggle">Inverti</a></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <div class="section-box">
                <h3>🚻 Bagni</h3>
                <table>
                    <thead><tr><th>Codice</th><th>Stato</th><th>Azione</th></tr></thead>
                    <tbody>
                        <?php foreach ($lista_bagni as $b): ?>
                        <tr>
                            <td><b>Bagno <?php echo htmlspecialchars($b['codiceBagno']); ?></b></td>
                            <td><span class="status-badge <?php echo $b['disponibilita'] ? 'bg-open' : 'bg-closed'; ?>">
                                <?php echo $b['disponibilita'] ? 'DISPONIBILE' : 'CHIUSO'; ?></span></td>
                            <td><a href="?action=toggle&tipo=bagno&id=<?php echo urlencode($b['codiceBagno']); ?>" class="btn-toggle">Inverti</a></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <div class="section-box">
                <h3>💀 Attrazioni Horror</h3>
                <table>
                    <thead><tr><th>Nome</th><th>Stato</th><th>Azione</th></tr></thead>
                    <tbody>
                        <?php foreach ($lista_horror as $h): ?>
                        <tr>
                            <td><b><?php echo htmlspecialchars($h['nomeAttrazionePaura']); ?></b></td>
                            <td><span class="status-badge <?php echo $h['disponibilita'] ? 'bg-open' : 'bg-closed'; ?>">
                                <?php echo $h['disponibilita'] ? 'APERTA' : 'CHIUSA'; ?></span></td>
                            <td><a href="?action=toggle&tipo=horror&id=<?php echo urlencode($h['nomeAttrazionePaura']); ?>" class="btn-toggle">Inverti</a></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <div class="section-box" style="border-top: 5px solid #e67e22;">
                <h3 style="color: #e67e22;">🛠 Manutenzioni In Corso</h3>
                <table>
                    <thead><tr>
                    <th>Impianto</th>
                    <th>Tipo Guasto</th>
                    <th>Data Inizio</th></tr></thead>
                    <tbody>
                        <?php if (count($lista_manutenzioni) > 0): ?>
                        <?php foreach ($lista_manutenzioni as $m): ?>
                    <tr>
                        <td><b><?php echo htmlspecialchars($m['nomeImpianto']); ?></b><br>
                            <small style="color: #7f8c8d; text-transform: uppercase;">
                            <?php echo htmlspecialchars($m['impiantoInManutenzione']); ?>
                        </small>
                    </td>
                    <td><?php echo htmlspecialchars($m['tipoGuasto']); ?></td>
                    <td>
                        <span class="status-badge bg-closed">
                            <?php echo date("d/m/Y", strtotime($m['dataInizio'])); ?>
                        </span>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="3" style="text-align:center; padding: 20px; color: #7f8c8d;">
                        ✅ Nessun intervento tecnico in corso.
                    </td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>
        </div>
    </div>
</body>
</html>