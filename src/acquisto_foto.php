<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: index.php");
    exit;
}

$codiceNegozio = $_REQUEST['id'] ?? ($_POST['codiceAttivita'] ?? null);
$nomeNegozio = "";

if ($codiceNegozio) {
    $nomeNegozio = $dbh->getNomeAttivita($codiceNegozio);
} else {
    header("Location: visitatori_home.php");
    exit;
}

$messaggioErrore = "";
$messaggioSuccesso = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cf = $_POST['cf'] ?? '';
    $prezzo = $_POST['prezzo'] ?? 0;

    if (!empty($cf) && $prezzo > 0) {
        $risultato = $dbh->eseguiAcquistoFoto($cf, $prezzo, $codiceNegozio);

        if ($risultato === true) {
            $messaggioSuccesso = "Acquisto completato con successo! La foto è in stampa.";
            $_POST['cf'] = ""; 
        } elseif ($risultato === "visitatore_non_presente") {
            $messaggioErrore = "Visitatore non presente in database, impossibile acquistare la foto.";
        } else {
            $messaggioErrore = "Errore tecnico durante l'elaborazione dell'acquisto.";
        }
    } else {
        $messaggioErrore = "Dati del modulo incompleti.";
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Acquisto Foto - WonderPark</title>
    <style>
        body { font-family: sans-serif; background-color: #f9f9f9; margin: 0; color: #333; line-height: 1.6; }
        a { text-decoration: none; color: inherit; }
        nav { background: #333; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; color: white; }
        .logo { font-weight: bold; font-size: 1.2rem; }
        .btn-logout { background: #d9534f; color: white; padding: 5px 15px; border-radius: 4px; font-size: 0.9rem; }
        .btn-logout:hover { background: #c9302c; }

        .container { max-width: 700px; margin: 30px auto; padding: 0 15px; }
        .item-card { background: white; border: 1px solid #ccc; border-radius: 5px; padding: 25px; margin-bottom: 20px; }
        
        .price-list { background: #f0f4f8; padding: 15px; border-radius: 5px; margin-bottom: 20px; border-left: 4px solid #337ab7; }
        .price-item { display: flex; justify-content: space-between; margin: 5px 0; font-size: 0.95rem; }

        form { display: flex; flex-direction: column; gap: 15px; }
        label { font-weight: bold; font-size: 0.9rem; color: #555; }
        input, select { padding: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 1rem; width: 100%; box-sizing: border-box; }

        .btn-confirm { background-color: #5cb85c; color: white; border: none; padding: 12px; border-radius: 4px; font-weight: bold; cursor: pointer; font-size: 1rem; }
        .btn-confirm:hover { background-color: #4cae4c; }

        .error-msg { color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 10px; border-radius: 4px; text-align: center; font-weight: bold; margin-top: 15px; }
        .success-msg { color: #155724; background-color: #d4edda; border: 1px solid #c3e6cb; padding: 10px; border-radius: 4px; text-align: center; font-weight: bold; margin-top: 15px; }

        .site-footer { background-color: #eee; color: #555; padding: 20px; margin-top: 50px; text-align: center; border-top: 1px solid #ccc; }
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
        <div class="item-card">
            <div style="text-align: center; margin-bottom: 20px;">
                <span style="font-size: 3rem;">📸</span>
                <h3 style="margin: 10px 0;">Punto vendita: <?php echo htmlspecialchars($nomeNegozio); ?></h3>
            </div>

            <div class="price-list">
                <div class="price-item"><span>🖼️ Foto Piccola</span> <strong>7.99 €</strong></div>
                <div class="price-item"><span>🖼️ Foto Media</span> <strong>10.99 €</strong></div>
                <div class="price-item"><span>🖼️ Foto Grande</span> <strong>12.99 €</strong></div>
            </div>

            <form action="" method="POST">
                <input type="hidden" name="codiceAttivita" value="<?php echo htmlspecialchars($codiceNegozio); ?>">

                <div>
                    <label for="cf">Codice Fiscale Visitatore:</label>
                    <input type="text" name="cf" id="cf" placeholder="Inserisci il tuo CF" required maxlength="16" style="text-transform: uppercase;" 
                           value="<?php echo isset($_POST['cf']) ? htmlspecialchars($_POST['cf']) : ''; ?>">
                </div>

                <div>
                    <label for="prezzo">Seleziona il Formato:</label>
                    <select name="prezzo" id="prezzo" required>
                        <option value="" disabled selected>Scegli prezzo...</option>
                        <option value="7.99" <?php echo (isset($_POST['prezzo']) && $_POST['prezzo'] == '7.99') ? 'selected' : ''; ?>>7.99 €</option>
                        <option value="10.99" <?php echo (isset($_POST['prezzo']) && $_POST['prezzo'] == '10.99') ? 'selected' : ''; ?>>10.99 €</option>
                        <option value="12.99" <?php echo (isset($_POST['prezzo']) && $_POST['prezzo'] == '12.99') ? 'selected' : ''; ?>>12.99 €</option>
                    </select>
                </div>

                <button type="submit" class="btn-confirm">Conferma Acquisto e Stampa ➔</button>

                <?php if ($messaggioErrore): ?>
                    <div class="error-msg">❌ <?php echo $messaggioErrore; ?></div>
                <?php endif; ?>

                <?php if ($messaggioSuccesso): ?>
                    <div class="success-msg">✅ <?php echo $messaggioSuccesso; ?></div>
                <?php endif; ?>
            </form>
        </div>

        <div style="text-align: center;">
            <a href="visitatori_home.php?categoria=AttivitaCommerciali" style="color: #777; font-size: 0.9rem;">Torna ai negozi</a>
        </div>
    </div>

    <footer class="site-footer">
        <p>&copy; WonderPark 2026</p>
    </footer>

</body>
</html>