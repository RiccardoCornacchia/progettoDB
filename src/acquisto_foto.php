<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: index.php");
    exit;
}

// Recuperiamo l'ID del negozio passato dal link precedente
$codiceNegozio = isset($_GET['id']) ? $_GET['id'] : null;
$nomeNegozio = "";

if ($codiceNegozio) {
    $nomeNegozio = $dbh->getNomeAttivita($codiceNegozio);
} else {
    header("Location: visitatori_home.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Acquisto Foto - WonderPark</title>
    <style>
        /* Stili importati dalla visitatori_home per coerenza grafica */
        body { font-family: sans-serif; background-color: #f9f9f9; margin: 0; color: #333; line-height: 1.6; }
        a { text-decoration: none; color: inherit; }
        
        nav { background: #333; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; color: white; }
        .logo { font-weight: bold; font-size: 1.2rem; }
        .btn-logout { background: #d9534f; color: white; padding: 5px 15px; border-radius: 4px; font-size: 0.9rem; }
        .btn-logout:hover { background: #c9302c; }

        .container { max-width: 700px; margin: 30px auto; padding: 0 15px; }
        
        /* Stile Form e Card */
        .item-card { 
            background: white; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            padding: 25px; 
            margin-bottom: 20px; 
        }

        .header-risultati { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; border-bottom: 1px solid #ddd; padding-bottom: 10px; }
        .btn-back { background: #ddd; color: #333; padding: 5px 10px; border-radius: 4px; font-weight: bold; }

        .price-list { background: #f0f4f8; padding: 15px; border-radius: 5px; margin-bottom: 20px; border-left: 4px solid #337ab7; }
        .price-item { display: flex; justify-content: space-between; margin: 5px 0; font-size: 0.95rem; }

        form { display: flex; flex-direction: column; gap: 15px; }
        label { font-weight: bold; font-size: 0.9rem; color: #555; }
        
        input, select { 
            padding: 10px; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
            font-size: 1rem; 
            width: 100%; 
            box-sizing: border-box;
        }

        .btn-confirm { 
            background-color: #5cb85c; 
            color: white; 
            border: none; 
            padding: 12px; 
            border-radius: 4px; 
            font-weight: bold; 
            cursor: pointer; 
            font-size: 1rem;
            transition: background 0.2s; 
        }
        .btn-confirm:hover { background-color: #4cae4c; }

        /* Footer */
        .site-footer {
            background-color: #eee; color: #555;
            padding: 20px; margin-top: 50px; text-align: center; border-top: 1px solid #ccc;
        }
        .footer-nav ul { list-style: none; padding: 0; display: flex; justify-content: center; gap: 15px; }
    </style>
</head>
<body>

    <nav>
        <div class="logo">WonderPark App</div>
        <div>
            Benvenuto, <?php echo htmlspecialchars($_SESSION['ruolo']); ?>
            <a href="logout.php" class="btn-logout" style="margin-left: 15px;">Esci</a>
        </div>
    </nav>

    <div class="container">
        
        <div class="header-risultati">
            <a href="visitatori_home.php?categoria=AttivitaCommerciali" class="btn-back">⬅</a>
            <h2 style="margin:0; color: #2c3e50;">Acquisto Foto</h2>
        </div>

        <div class="item-card">
            <div style="text-align: center; margin-bottom: 20px;">
                <span style="font-size: 3rem;">📸</span>
                <h3 style="margin: 10px 0;">Punto vendita: <?php echo htmlspecialchars($nomeNegozio); ?></h3>
                <p style="color: #666;">Completa il modulo per stampare il tuo ricordo digitale.</p>
            </div>

            <div class="price-list">
                <div class="price-item"><span>🖼️ Foto Piccola</span> <strong>7.99 €</strong></div>
                <div class="price-item"><span>🖼️ Foto Media</span> <strong>10.99 €</strong></div>
                <div class="price-item"><span>🖼️ Foto Grande</span> <strong>12.99 €</strong></div>
            </div>

            <form action="processa_acquisto_foto.php" method="POST">
                <input type="hidden" name="codiceAttivita" value="<?php echo htmlspecialchars($codiceNegozio); ?>">

                <div>
                    <label for="cf">Codice Fiscale Visitatore:</label>
                    <input type="text" name="cf" id="cf" placeholder="Inserisci il tuo CF" required maxlength="16" style="text-transform: uppercase;">
                </div>

                <div>
                    <label for="prezzo">Seleziona il Formato:</label>
                    <select name="prezzo" id="prezzo" required>
                        <option value="" disabled selected>Scegli prezzo...</option>
                        <option value=7.99>7.99 €</option>
                        <option value=10.99>10.99 €</option>
                        <option value=12.99>12.99 €</option>
                    </select>
                </div>

                <button type="submit" class="btn-confirm">Conferma Acquisto e Stampa ➔</button>
            </form>
        </div>

        <div style="text-align: center;">
            <a href="visitatori_home.php?categoria=AttivitaCommerciali" style="color: #777; font-size: 0.9rem;">Annulla l'operazione e torna ai negozi</a>
        </div>

    </div>

    <footer class="site-footer">
        <div class="footer-content">
            <p>&copy; WonderPark 2026</p>
            <nav class="footer-nav">
                <ul>
                    <li><a href="index.php">Login</a></li>
                    <li><a href="contatti.php">Contatti</a></li>
                    <li><a href="mansioni_lavori_lato_cliente.php">Lavora con noi</a></li>
                </ul>
            </nav>
        </div>
    </footer>

</body>
</html>