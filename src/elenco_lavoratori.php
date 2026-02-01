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
    .stats-header h3 { 
        margin: 0; 
        color: #2c3e50; 
    }
    .stats-header p { 
        color: #7f8c8d; 
        font-size: 0.9rem; 
        margin-bottom: 20px; 
    }
    .stats-table { 
        width: 100%; 
        border-collapse: collapse; 
    }
    .stats-table th { 
        text-align: left; 
        padding: 12px; 
        background: #f8f9fa; 
        color: #34495e; 
        font-size: 0.85rem; 
        text-transform: uppercase; 
    }
    .stats-table td { 
        padding: 15px 12px; 
        border-bottom: 1px solid #f1f1f1; 
    }
    
    .text-center { 
        text-align: center; 
    }
    .text-right { 
        text-align: right; 
        font-family: 'Courier New', monospace; 
        font-weight: bold;
    }
    
    .badge-count {
        background: #3498db;
        color: white;
        padding: 4px 10px;
        border-radius: 20px;
        font-size: 0.85rem;
    }
    .stats-table tr:hover { 
        background: #fcfcfc; 
    }

</style>
</head>

<body>
<p></p>
<a href="sezione_lavoratori_admin.php" style="text-decoration:none;">&larr; Torna a Gestione Lavoratori</a>
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
</body>

