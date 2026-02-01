<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: index.php");
    exit;
}

$messaggio = "";
$errore = "";

if (isset($_GET['action']) && $_GET['action'] == 'toggle' && isset($_GET['tipo']) && isset($_GET['id'])) {
    $id = $_GET['id'];
    $tipo = $_GET['tipo'];
    $res = false;

    try {
        switch ($tipo) {
            case 'giostra':
                $res = $dbh->updateStatoGiostra($id);
                break;
            case 'attivita':
                $res = $dbh->updateStatoAttivita($id); 
                break;
            case 'horror':
                $res = $dbh->updateStatoAttrazionePaura($id); 
                break;
            case 'cassa':
                $res = $dbh->updateStatoCassa($id); 
                break;
            case 'bagno':
                $res = $dbh->updateStatoBagno($id); 
                break;
        }
        if ($res) $messaggio = "Stato di " . htmlspecialchars($id) . " aggiornato!";
        else $errore = "Errore durante l'aggiornamento.";
    } catch (Exception $e) {
        $errore = "Errore: " . $e->getMessage();
    }
}

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
        .status-badge { padding: 5px 10px; font-size: 0.8rem; font-weight: bold; }
        .bg-open { background: #dff0d8; color: #3c763d; }
        .bg-closed { background: #f2dede; color: #a94442; }
        .btn-toggle { background: #337ab7; color: white; padding: 5px 10px; text-decoration: none; font-size: 0.8rem; }
        .msg-success { background: #dff0d8; color: #3c763d; padding: 15px; margin-bottom: 20px; border: 1px solid #d6e9c6; }
        .msg-error { background: #f2dede; color: #a94442; padding: 15px; margin-bottom: 20px; border: 1px solid #ebccd1; }
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
                <h3>💀 Attrazioni di Paura</h3>
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
            <div class="section-box">
                <h3>🛠 Manutenzioni In Corso</h3>
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