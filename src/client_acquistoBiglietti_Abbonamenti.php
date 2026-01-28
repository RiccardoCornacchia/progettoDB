<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: login.php");
    exit;
}

// Recupero dei dati dal database
$biglietti = $dbh->getTipologieBiglietti();
$abbonamenti = $dbh->getTipologieAbbonamenti();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Acquisto Titoli di Ingresso - WonderPark</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f4f9; margin: 0; }
        nav { background: #2c3e50; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; color: white; }
        .logo { font-weight: bold; color: #ff6b6b; font-size: 1.2rem; text-transform: uppercase; text-decoration: none; }
        
        .container { max-width: 1100px; margin: 40px auto; padding: 0 20px; }
        .section-title { color: #2c3e50; border-bottom: 3px solid #f1c40f; padding-bottom: 10px; margin-top: 40px; }
        
        .ticket-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
            gap: 20px; 
            margin-top: 20px; 
        }

        .ticket-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-left: 8px solid #f39c12;
            transition: transform 0.2s;
        }

        .ticket-card:hover { transform: scale(1.02); }

        .ticket-info h3 { margin: 0; color: #333; font-size: 1.4rem; }
        .ticket-info p { margin: 5px 0 0; color: #7f8c8d; }

        .ticket-price {
            text-align: right;
            font-size: 1.8rem;
            font-weight: bold;
            color: #2c3e50;
        }

        .ticket-price span { font-size: 1rem; color: #999; }

        .btn-back { 
            display: inline-block; 
            margin-bottom: 20px; 
            color: #3498db; 
            text-decoration: none; 
            font-weight: bold; 
        }

        .footer-note {
            margin-top: 50px;
            padding: 20px;
            background: #ecf0f1;
            border-radius: 10px;
            text-align: center;
            color: #7f8c8d;
        }
    </style>
</head>
<body>

<nav>
    <a href="visitatori_home.php" class="logo">WonderPark App</a>
    <div>Utente: <strong><?php echo htmlspecialchars($_SESSION['ruolo']); ?></strong></div>
</nav>

<div class="container">
    <a href="visitatori_home.php" class="btn-back">⬅ Torna alla Home</a>
    
    <h1 style="text-align: center; color: #2c3e50;">Scegli la tua avventura</h1>
    <p style="text-align: center; color: #7f8c8d;">Seleziona la tipologia di ingresso più adatta alle tue esigenze.</p>

    <h2 class="section-title">🎟 Biglietti Singoli</h2>
    <div class="ticket-grid">
        <?php foreach ($biglietti as $b): ?>
            <div class="ticket-card">
                <div class="ticket-info">
                    <h3><?php echo htmlspecialchars($b['nomeBiglietto']); ?></h3>
                </div>
                <div class="ticket-price">
                    <?php echo $b['prezzo']; ?>€
                    <br><span>Persona</span>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <h2 class="section-title" style="border-bottom-color: #9b59b6;">💳 Abbonamenti</h2>
    <div class="ticket-grid">
        <?php foreach ($abbonamenti as $a): ?>
            <div class="ticket-card" style="border-left-color: #9b59b6;">
                <div class="ticket-info">
                    <h3><?php echo htmlspecialchars($a['nomeAbbonamento']); ?></h3>
                </div>
                <div class="ticket-price">
                    <?php echo $a['prezzo']; ?>€
                    <br><span>Abbonato</span>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="footer-note">
        <p>I prezzi indicati sono comprensivi di IVA. I biglietti e gli abbonamenti acquistati non sono rimborsabili.</p>
    </div>
</div>

</body>
</html>