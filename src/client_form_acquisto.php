<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: index.php");
    exit;
}

// 1. Recupero parametri iniziali
$tipo_acquisto = $_REQUEST['tipo'] ?? 'biglietto'; 
$nome_prodotto = $_REQUEST['nome_prodotto'] ?? ($_GET['nome'] ?? '');
$oggi = date('Y-m-d'); 

$messaggioErrore = "";
$messaggioSuccesso = "";

// 2. Logica di Elaborazione Acquisto (POST)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recupero e pulizia dati comuni
    $cf            = strtoupper(trim($_POST['codice_fiscale']));
    $nome          = trim($_POST['nome']);
    $cognome       = trim($_POST['cognome']);
    $data_nascita  = $_POST['data_nascita'];
    $altezza       = intval($_POST['altezza']);
    $email         = !empty($_POST['email']) ? trim($_POST['email']) : null;
    $telefono      = !empty($_POST['telefono']) ? trim($_POST['telefono']) : null;
    
    $data_oggi     = date('Y-m-d');
    $ora_attuale   = date('H:i:s');

    if ($tipo_acquisto === 'abbonamento') {
        // Recupero l'anno inserito dall'utente e fisso la scadenza al 31 Ottobre
        $anno_scelto = intval($_POST['anno_utilizzo']);
        $scadenza_fissata = $anno_scelto . "-10-31";

        $risultato = $dbh->eseguiAcquistoAbbonamento(
            $cf, $nome, $cognome, $data_nascita, $telefono, $email, 
            $altezza, $nome_prodotto, $scadenza_fissata, $data_oggi, $ora_attuale
        );
    } else {
        // Logica biglietto (rimasta invariata)
        $data_validita = $_POST['data_validita'] ?? $data_oggi;
        $risultato = $dbh->eseguiAcquistoBiglietto(
            $cf, $nome, $cognome, $data_nascita, $telefono, $email, 
            $altezza, $nome_prodotto, $data_validita, $data_oggi, $ora_attuale
        );
    }

    if ($risultato) {
        $messaggioSuccesso = "🎉 Acquisto effettuato con successo! Grazie per aver scelto WonderPark.";
    } else {
        $messaggioErrore = "❌ Errore durante l'acquisto. Controlla i dati o riprova più tardi.";
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dati Acquisto - WonderPark</title>
    <style>
        body { font-family: sans-serif; background-color: #f9f9f9; margin: 0; color: #333; line-height: 1.6; }
        nav { background: #333; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; color: white; }
        .logo { font-weight: bold; font-size: 1.2rem; }
        .btn-logout { background: #d9534f; color: white; padding: 5px 15px; border-radius: 4px; font-size: 0.9rem; text-decoration: none; }
        
        .container { max-width: 700px; margin: 30px auto; padding: 0 15px; }
        .item-card { background: white; border: 1px solid #ccc; border-radius: 5px; padding: 25px; margin-bottom: 20px; }
        .header-risultati { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; border-bottom: 1px solid #ddd; padding-bottom: 10px; }
        .btn-back { background: #ddd; color: #333; padding: 5px 10px; border-radius: 4px; font-weight: bold; text-decoration: none; }

        .info-box { background: #f0f4f8; padding: 15px; border-radius: 5px; margin-bottom: 25px; border-left: 4px solid #f0ad4e; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .full-width { grid-column: span 2; }

        label { display: block; font-weight: bold; font-size: 0.85rem; color: #555; margin-bottom: 5px; }
        input { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 1rem; box-sizing: border-box; }

        .btn-confirm { width: 100%; background-color: #5cb85c; color: white; border: none; padding: 15px; border-radius: 4px; font-weight: bold; cursor: pointer; font-size: 1rem; margin-top: 20px; }
        
        .error-msg { color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 15px; border-radius: 4px; text-align: center; font-weight: bold; margin-bottom: 20px; }
        .success-msg { color: #155724; background-color: #d4edda; border: 1px solid #c3e6cb; padding: 15px; border-radius: 4px; text-align: center; font-weight: bold; margin-bottom: 20px; }

        .site-footer { background-color: #eee; color: #555; padding: 20px; margin-top: 50px; text-align: center; border-top: 1px solid #ccc; }
        @media (max-width: 600px) { .form-grid { grid-template-columns: 1fr; } .form-grid > * { grid-column: span 1; } }
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
            <a href="client_acquistoBiglietti_Abbonamenti.php" class="btn-back">⬅</a>
            <h2 style="margin:0; color: #2c3e50;">Dati Intestatario</h2>
        </div>

        <?php if ($messaggioErrore): ?>
            <div class="error-msg"><?php echo $messaggioErrore; ?></div>
        <?php endif; ?>

        <?php if ($messaggioSuccesso): ?>
            <div class="success-msg"><?php echo $messaggioSuccesso; ?></div>
        <?php endif; ?>

        <div class="item-card">
            <div class="info-box">
                Stai acquistando: <strong><?php echo htmlspecialchars($nome_prodotto); ?></strong><br>
                Categoria: <span style="text-transform: capitalize;"><?php echo htmlspecialchars($tipo_acquisto); ?></span>
            </div>

            <form action="" method="POST" class="form-grid">
                <input type="hidden" name="tipo" value="<?php echo htmlspecialchars($tipo_acquisto); ?>">
                <input type="hidden" name="nome_prodotto" value="<?php echo htmlspecialchars($nome_prodotto); ?>">

                <?php if ($tipo_acquisto === 'abbonamento'): ?>
                    <div class="full-width">
                        <label for="anno_utilizzo">In che anno utilizzerai l'abbonamento? *</label>
                        <input type="number" id="anno_utilizzo" name="anno_utilizzo" 
                               min="<?php echo date('Y'); ?>" max="2030" 
                               placeholder="es. 2028" 
                               value="<?php echo $_POST['anno_utilizzo'] ?? date('Y'); ?>" required>
                        <p style="font-size: 0.8rem; color: #666; margin-top: 5px;">
                            L'abbonamento sarà valido fino al <strong>31/10</strong> dell'anno indicato.
                        </p>
                        <hr style="margin-top: 20px; border: 0; border-top: 1px solid #eee;">
                    </div>

                <?php else: ?>
                    <div class="full-width">
                        <label for="data_validita">Data di utilizzo del biglietto *</label>
                        <input type="date" id="data_validita" name="data_validita" min="<?php echo $oggi; ?>" 
                               value="<?php echo $_POST['data_validita'] ?? $oggi; ?>" required>
                        <hr style="margin-top: 20px; border: 0; border-top: 1px solid #eee;">
                    </div>
                <?php endif; ?>

                <div>
                    <label for="nome">Nome *</label>
                    <input type="text" id="nome" name="nome" placeholder="es. Mario" 
                           value="<?php echo $_POST['nome'] ?? ''; ?>" required>
                </div>

                <div>
                    <label for="cognome">Cognome *</label>
                    <input type="text" id="cognome" name="cognome" placeholder="es. Rossi" 
                           value="<?php echo $_POST['cognome'] ?? ''; ?>" required>
                </div>

                <div>
                    <label for="data_nascita">Data di Nascita *</label>
                    <input type="date" id="data_nascita" name="data_nascita" 
                           value="<?php echo $_POST['data_nascita'] ?? ''; ?>" required>
                </div>

                <div>
                    <label for="codice_fiscale">Codice Fiscale *</label>
                    <input type="text" id="codice_fiscale" name="codice_fiscale" maxlength="16" required 
                           style="text-transform: uppercase;" value="<?php echo $_POST['codice_fiscale'] ?? ''; ?>">
                </div>

                <div>
                    <label for="altezza">Altezza (cm) *</label>
                    <input type="number" id="altezza" name="altezza" min="50" max="250" placeholder="es. 175" 
                           value="<?php echo $_POST['altezza'] ?? ''; ?>" required>
                </div>

                <div>
                    <label for="telefono">Telefono (opzionale)</label>
                    <input type="tel" id="telefono" name="telefono" placeholder="333 1234567" 
                           value="<?php echo $_POST['telefono'] ?? ''; ?>">
                </div>

                <div class="full-width">
                    <label for="email">Email (opzionale)</label>
                    <input type="email" id="email" name="email" placeholder="mario.rossi@esempio.com" 
                           value="<?php echo $_POST['email'] ?? ''; ?>">
                </div>

                <div class="full-width">
                    <button type="submit" class="btn-confirm">Conferma l'acquisto ➔</button>
                </div>
            </form>
        </div>
    </div>

    <footer class="site-footer">
        <p>&copy; WonderPark 2026</p>
    </footer>

</body>
</html>