<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo']) || $_SESSION['ruolo'] !== 'admin') {
    header("Location: login.php");
    exit;
}

// RECUPERO STATISTICHE GENERALI (I contatori in alto)
$num_giostre = count($dbh->getGiostre());
$num_attivita = count($dbh->getAttivitaCommerciali());
$num_aree = count($dbh->getAreeTematiche());
$num_ruote = count($dbh->getRuotaPanoramica());
$num_lavoratori = method_exists($dbh, 'countLavoratori') ? $dbh->countLavoratori() : 0; 
$num_biglietti = count($dbh->getTipologieBiglietti());

// 1. Top 3 Giostre
$top_giostre = $dbh->top3Giostre();

// 2. Top Fatturato
$top_fatturato = $dbh->getTopFatturato();

$topVisitatori = $dbh->top10visitatori();

$longevi = $dbh->lavoratoriPiuLongevi();

$guastoTop = $dbh->GuastoPiuLungo(); 
// Prendiamo il primo (e unico) risultato
$x = !empty($guastoTop) ? $guastoTop[0] : null;

// 3. Eventi Recenti (Logica del Form)
$anni_scelti = isset($_GET['anni']) ? (int)$_GET['anni'] : 1; // Default 1 anno
$eventi_recenti = $dbh->eventiDatiUltimiAnni($anni_scelti);

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
        
        /* Stats Cards in alto */
        .stats-container { display: flex; gap: 20px; margin-bottom: 40px; flex-wrap: wrap; }
        .stat-card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); flex: 1; min-width: 120px; text-align: center; }
        .stat-number { font-size: 2rem; font-weight: bold; color: #2980b9; margin: 5px 0; }

        /* Griglia per le statistiche avanzate */
        .dashboard-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 30px; }
        
        .chart-box { background: white; padding: 25px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        .chart-box h3 { margin-top: 0; color: #34495e; border-bottom: 2px solid #f1f1f1; padding-bottom: 10px; }

        /* Tabelle interne */
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; color: #555; }
        
        /* Form per gli anni */
        .filter-form { display: flex; gap: 10px; align-items: center; margin-bottom: 15px; background: #f9f9f9; padding: 10px; border-radius: 5px; }
        .filter-form input { padding: 5px; width: 60px; border: 1px solid #ddd; border-radius: 4px; }
        .filter-form button { padding: 5px 15px; background: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>

    <?php include 'admin_sidebar.php'; ?>

    <div class="main-content">
        <h1>📊 Dashboard Analitica</h1>
        <p>Panoramica delle performance del parco.</p>

        <div class="stats-container">
            <div class="stat-card"><div>Lavoratori</div><div class="stat-number"><?php echo $num_lavoratori; ?></div></div>
            <div class="stat-card"><div>Giostre</div><div class="stat-number"><?php echo $num_giostre; ?></div></div>
            <div class="stat-card"><div>Attività</div><div class="stat-number"><?php echo $num_attivita; ?></div></div>
            <div class="stat-card"><div>Aree</div><div class="stat-number"><?php echo $num_aree; ?></div></div>
            <div class="stat-card"><div>Biglietti</div><div class="stat-number"><?php echo $num_biglietti; ?></div></div>
        </div>

        <hr style="border: 0; border-top: 1px solid #ddd; margin: 30px 0;">

        <div class="dashboard-grid">
            
            <div class="chart-box">
                <h3>🏆 Top 3 Giostre più Frequentate</h3>
                <?php if(count($top_giostre) > 0): ?>
                    <table>
                        <thead>
                            <tr>
                                <th>Posizione</th>
                                <th>Nome Giostra</th>
                                <th>Salite Totali</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($top_giostre as $g): ?>
                            <tr>
                                <td>
                                    <?php 
                                    if($i==1) echo "🥇"; 
                                    elseif($i==2) echo "🥈"; 
                                    elseif($i==3) echo "🥉"; 
                                    ?>
                                </td>
                                <td><b><?php echo htmlspecialchars($g['nomeGiostra']); ?></b></td>
                                <td><?php echo $g['frequenzaTotale']; ?></td>
                            </tr>
                            <?php $i++; endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p style="color:#777;">Nessun dato sulle salite disponibile.</p>
                <?php endif; ?>
            </div>

            <div class="chart-box">
                <h3>💰 Attività con Maggior Fatturato</h3>
                <?php if(count($top_fatturato) > 0): ?>
                    <table>
                        <thead>
                            <tr>
                                <th>Attività</th>
                                <th>Tipo</th>
                                <th>Fatturato (€)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($top_fatturato as $f): ?>
                            <tr>
                                <td><b><?php echo htmlspecialchars($f['nomeAttivita']); ?></b></td>
                                <td><small><?php echo htmlspecialchars($f['tipologiaAttivita']); ?></small></td>
                                <td style="color: green; font-weight:bold;"><?php echo number_format($f['fatturatoTotale'], 2); ?> €</td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p style="color:#777;">Nessuna transazione registrata (Tabella USUFRUIZIONE vuota).</p>
                <?php endif; ?>
            </div>

            <div class="chart-box" style="grid-column: span 2;"> <h3>📅 Storico Eventi</h3>
                
                <form method="get" class="filter-form">
                    <label>Visualizza eventi degli ultimi</label>
                    <input type="number" name="anni" value="<?php echo $anni_scelti; ?>" min="1" max="50">
                    <label>anni.</label>
                    <button type="submit">Aggiorna</button>
                </form>

                <?php if(count($eventi_recenti) > 0): ?>
                    <table>
                        <thead>
                            <tr>
                                <th>Nome Evento</th>
                                <th>Data</th>
                                <th>Ora Inizio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($eventi_recenti as $e): ?>
                            <tr>
                                <td><b><?php echo htmlspecialchars($e['nomeEvento']); ?></b></td>
                                <td><?php echo $e['data']; ?></td>
                                <td><?php echo $e['oraInizio']; ?></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p style="color:#777;">Nessun evento trovato negli ultimi <?php echo $anni_scelti; ?> anni.</p>
                <?php endif; ?>
            </div>

            <div class="chart-box">
                <div class="card-header-v">
                    <h3>🏆 Top 10 Visitatori</h3>
                    <p>I clienti che hanno acquistato più biglietti in assoluto.</p>
                </div>
                <div class="table-responsive">
                    <table class="custom-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Visitatore</th>
                                <th class="text-center">Biglietti Comprati</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $rank = 1; foreach ($topVisitatori as $v): ?>
                            <tr>
                                <td><span class="rank-circle"><?php echo $rank++; ?></span></td>
                                <td><strong><?php echo htmlspecialchars($v['nome'] . " " . $v['cognome']); ?></strong></td>
                                <td class="text-center">
                                    <span class="ticket-badge"><?php echo $v['biglietti_comprati']; ?></span>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="chart-box">
                <div class="card-header-l">
                    <h3>⏳ Pilastri del Parco</h3>
                    <p>I 10 lavoratori con la data di inizio contratto più remota.</p>
                </div>
                <div class="table-responsive">
                    <table class="custom-table">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Mansione</th>
                                <th>Inizio Contratto</th>
                                <th class="text-center">In Servizio Ora</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($longevi as $l): ?>
                            <tr>
                                <td><strong><?php echo htmlspecialchars($l['nome'] . " " . $l['cognome']); ?></strong></td>
                                <td><?php echo htmlspecialchars($l['mansione']); ?></td>
                                <td><?php echo date('d/m/Y', strtotime($l['dataInizioContratto'])); ?></td>
                                <td class="text-center">
                                    <?php if ($l[ 'attualmente_a_lavoro' ] === 'Sì'): ?>
                                        <span class="status-badge online">Sì</span>
                                    <?php else: ?>
                                        <span class="status-badge offline">No</span>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>

           <div class="chart-box">
                <?php if ($x): ?>
                    <div class="alert-header">
                        <div class="alert-title">
                            <span class="alert-icon">⚠️</span><h3>Manutenzione Critica Rilevata</h3>
                            <p>Questo è il guasto con la durata maggiore registrato nel sistema.</p>
                        </div>
                    </div>

                    <div class="alert-body">
                        <div class="alert-info">
                            <span class="label">Impianto:</span>
                            <span class="value">
                                <?php 
                                    echo htmlspecialchars(
                                        $x['nomeGiostra'] ?? 
                                        $x['nomeRuota'] ?? 
                                        $x['nomeAreaTematica'] ?? 
                                        $x['nomeAttrazionePaura'] ?? 
                                        $x['impiantoInManutenzione']
                                    ); 
                                ?>
                            </span>
                        </div>
                        <div class="alert-info">
                            <span class="label">Tipo di Guasto:</span>
                            <span class="value"><?php echo htmlspecialchars($x['tipoGuasto']); ?></span>
                        </div>
                        <div class="alert-stats">
                            <div class="days-counter">
                                <span class="number"><?php echo $x['giorni_in_manutenzione']; ?></span>
                                <span class="text">Giorni totali</span>
                            </div>
                        </div>
                    </div>
                <?php else: ?>
                    <p>Nessun dato di manutenzione disponibile.</p>
                <?php endif; ?>
            </div>

        </div>
    </div>

</body>
</html>