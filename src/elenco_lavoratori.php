<?php 
require 'config/config.php';

$statsMansioni = $dbh->lavoratoriPerMansione();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Lavoratori per mansione</title>
    <style>
    .stats-container {
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        padding: 20px;
        margin: 20px 0;
        border-top: 5px solid #3498db;
    }
    .stats-header h3 { margin: 0; color: #2c3e50; }
    .stats-header p { color: #7f8c8d; font-size: 0.9rem; margin-bottom: 20px; }
    
    .stats-table { width: 100%; border-collapse: collapse; }
    .stats-table th { 
        text-align: left; 
        padding: 12px; 
        background: #f8f9fa; 
        color: #34495e; 
        font-size: 0.85rem; 
        text-transform: uppercase; 
    }
    .stats-table td { padding: 15px 12px; border-bottom: 1px solid #f1f1f1; }
    
    .text-center { text-align: center; }
    .text-right { text-align: right; font-family: 'Courier New', monospace; font-weight: bold; }
    
    .badge-count {
        background: #3498db;
        color: white;
        padding: 4px 10px;
        border-radius: 20px;
        font-size: 0.85rem;
    }
    .stats-table tr:hover { background: #fcfcfc; }

    .back-container {
        margin-bottom: 25px;
    }

    .btn-back {
        display: inline-flex;
        align-items: center;
        padding: 10px 18px;
        background-color: #f8f9fa; /* Grigio chiaro per non distrarre */
        color: #2c3e50;
        text-decoration: none;
        border: 1px solid #dcdde1;
        border-radius: 6px;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.2s ease-in-out;
    }

    .btn-back .icon {
        margin-right: 8px;
        font-size: 1.1rem;
    }

    .btn-back:hover {
        background-color: #3498db; /* Diventa blu al passaggio */
        color: white;
        border-color: #2980b9;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        transform: translateX(-3px); /* Leggero movimento verso sinistra */
    }
</style>
</head>

<body>
<div class="stats-container">
    <div class="stats-header">
        <h3>📊 Riepilogo per Mansione</h3>
        <p>Analisi della distribuzione del personale e degli stipendi medi.</p>
    </div>
    
    <div class="stats-table-wrapper">
        <table class="stats-table">
            <thead>
                <tr>
                    <th>Mansione</th>
                    <th class="text-center">N° Lavoratori</th>
                    <th class="text-right">Stipendio Medio</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($statsMansioni as $stat): ?>
                <tr>
                    <td><strong><?php echo htmlspecialchars($stat['mansione']); ?></strong></td>
                    <td class="text-center">
                        <span class="badge-count"><?php echo $stat['numero_lavoratori']; ?></span>
                    </td>
                    <td class="text-right">
                        € <?php echo number_format($stat['stipendio_medio'], 2, ',', '.'); ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<div class="back-container">
    <a href="sezione_lavoratori_admin.php" class="btn-back">
        <span class="icon">⬅</span> Torna a Gestione Lavoratori
    </a>
</div>
</body>

