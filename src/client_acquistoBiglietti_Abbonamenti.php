<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: login.php");
    exit;
}

// Recupero dei dati dal database
try {
    $biglietti = $dbh->getTipologieBiglietti();
    $abbonamenti = $dbh->getTipologieAbbonamenti();
} catch (Exception $e) {
    $errore_db = "Errore nel recupero dei prezzi: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Acquisto Biglietti - WonderPark</title>
    <style>
        body { font-family: sans-serif; background-color: #f9f9f9; margin: 0; color: #333; line-height: 1.6; }
        a { text-decoration: none; color: inherit; }
        
        nav { background: #333; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; color: white; }
        .logo { font-weight: bold; font-size: 1.2rem; }
        
        .container { max-width: 900px; margin: 30px auto; padding: 0 15px; }
        
        .header-risultati { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; border-bottom: 1px solid #ddd; padding-bottom: 10px; }
        .btn-back { background: #ddd; color: #333; padding: 5px 10px; border-radius: 4px; font-weight: bold; }

        .sezione-titolo { margin: 40px 0 20px 0; color: #2c3e50; font-size: 1.5rem; display: flex; align-items: center; gap: 10px; }
        
        /* Grid e Card uniformate allo stile "item-card" */
        .ticket-grid { display: grid; grid-template-columns: 1fr; gap: 10px; }
        
        .item-card { 
            background: white; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            padding: 20px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            transition: background 0.2s;
        }
        .item-card:hover { background-color: #f0f0f0; border-color: #bbb; }

        .price-tag { 
            font-size: 1.4rem; 
            font-weight: bold; 
            color: #2c3e50; 
            text-align: right; 
        }
        .price-tag span { font-size: 0.8rem; color: #7f8c8d; display: block; font-weight: normal; }

        .badge-buy { 
            background: #5cb85c; 
            color: white; 
            padding: 8px 15px; 
            border-radius: 4px; 
            font-size: 0.9rem; 
            font-weight: bold; 
        }

        .info-box {
            background-color: #eee; 
            color: #555;
            padding: 20px; 
            border-radius: 5px; 
            margin-top: 50px; 
            text-align: center; 
            font-size: 0.9rem;
            border: 1px solid #ccc;
        }

        .site-footer {
            background-color: #eee; color: #555;
            padding: 20px; margin-top: 50px; text-align: center; border-top: 1px solid #ccc;
        }
    </style>
</head>
<body>

    <nav>
        <div class="logo">WonderPark App</div>
        <div>
            Benvenuto, <strong><?php echo htmlspecialchars($_SESSION['ruolo']); ?></strong>
        </div>
    </nav>

    <div class="container">

        <div class="header-risultati">
            <a href="visitatori_home.php" class="btn-back">⬅</a>
            <h2 style="margin:0; color: #2c3e50;">Acquista Titoli d'Ingresso</h2>
        </div>

        <div style="text-align: center; margin-bottom: 30px;">
            <p style="color: #7f8c8d; font-size: 1.1rem;">Scegli la soluzione perfetta per la tua giornata nel parco.</p>
        </div>

        <?php if (isset($errore_db)): ?>
            <div style="background:#f8d7da; color:#721c24; padding:15px; border-radius:5px;">
                <?php echo $errore_db; ?>
            </div>
        <?php else: ?>

            <div class="sezione-titolo">🎟 Biglietti Singoli</div>
            <div class="ticket-grid">
                <?php foreach ($biglietti as $b): ?>
                    <a href="client_form_acquisto.php?tipo=biglietto&nome=<?php echo urlencode($b['nomeBiglietto']); ?>">
                        <div class="item-card">
                            <div>
                                <h3 style="margin: 0; color: #333;"><?php echo htmlspecialchars($b['nomeBiglietto']); ?></h3>
                                <span style="color: #666; font-size: 0.9rem;">Ingresso giornaliero</span>
                            </div>
                            <div style="display: flex; align-items: center; gap: 20px;">
                                <div class="price-tag">
                                    <?php echo number_format($b['prezzo'], 2); ?>€
                                    <span>singolo</span>
                                </div>
                                <span class="badge-buy">Scegli ➔</span>
                            </div>
                        </div>
                    </a>
                <?php endforeach; ?>
            </div>

            <div class="sezione-titolo">💳 Abbonamenti</div>
            <div class="ticket-grid">
                <?php foreach ($abbonamenti as $a): ?>
                    <a href="client_form_acquisto.php?tipo=abbonamento&nome=<?php echo urlencode($a['nomeAbbonamento']); ?>">
                        <div class="item-card" style="border-left: 5px solid #9b59b6;">
                            <div>
                                <h3 style="margin: 0; color: #333;"><?php echo htmlspecialchars($a['nomeAbbonamento']); ?></h3>
                                <span style="color: #666; font-size: 0.9rem;">Divertimento senza limiti</span>
                            </div>
                            <div style="display: flex; align-items: center; gap: 20px;">
                                <div class="price-tag">
                                    <?php echo number_format($a['prezzo'], 2); ?>€
                                    <span>stagionale</span>
                                </div>
                                <span class="badge-buy" style="background: #9b59b6;">Scegli ➔</span>
                            </div>
                        </div>
                    </a>
                <?php endforeach; ?>
            </div>

        <?php endif; ?>

        <div class="info-box">
            <p>I prezzi indicati sono comprensivi di IVA. Una volta confermato l'acquisto, i titoli verranno associati al tuo account e non saranno rimborsabili.</p>
        </div>

    </div>

    <footer class="site-footer">
        <p>&copy; WonderPark 2026 - Area Acquisti Sicuri</p>
    </footer>

</body>
</html>