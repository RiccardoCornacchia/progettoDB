<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: index.php");
    exit;
}

$anniScelti = 3;
$risultato4 = [];
$CF = $_GET['CF'] ?? null;

if (isset($_GET['anni']) && is_numeric($_GET['anni'])) {
    $anniScelti = (int)$_GET['anni'];
}

$risultato1 = $dbh->top3giostre();
$risultato2 = $dbh->spettacoliEventiDatoOrario();
$risultato3 = $dbh->eventiDatiUltimiAnni($anniScelti);
if ($CF) {
    $risultato4 = $dbh->storicoBigliettiAbbonamenti($CF);
}

function renderTable($data, $titolo) {
    echo "<h3>$titolo</h3>";
    if (empty($data)) {
        echo "<p>Nessun risultato trovato.</p>";
        return;
    }
    echo "<div class='table-container'><table><thead><tr>";
    
    foreach (array_keys($data[0]) as $key) {
        echo "<th>" . htmlspecialchars(ucfirst($key)) . "</th>";
    }
    echo "</tr></thead><tbody>";
    
    foreach ($data as $row) {
        echo "<tr>";
        foreach ($row as $cell) {
            echo "<td>" . htmlspecialchars($cell) . "</td>";
        }
        echo "</tr>";
    }
    echo "</tbody></table></div>";
}

?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Report Query Aziendali</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7f6; padding: 20px; color: #333; }
        .container { max-width: 1000px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        .query-section { margin-bottom: 40px; padding: 15px; border-left: 4px solid #3498db; background: #fafafa; }
        .table-container { overflow-x: auto; margin-top: 10px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #3498db; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>
<a href="visitatori_home.php" style="text-decoration:none;">&larr; Torna alla Home Page</a>
<div class="container">
    <h1>Alcuni dati interessanti!</h1>

    <div class="query-section">
        <?php renderTable($risultato1, "1. Le 3 giostre che vengono scelte con maggiore frequenza"); ?>
    </div>

    <div class="query-section">
        <?php renderTable($risultato2, "2. Spettacoli e eventi in corso o non ancora iniziati in base all'orario fornito"); ?>
    </div>

    <div class="query-section">
        <div class="search-box">
            <form method="GET" action="">
                <label for="anni">Visualizza eventi degli ultimi: </label>
                <input type="number" name="anni" id="anni" value="<?php echo $anniScelti; ?>" min="1" max="15">
                <span> anni</span>
                <button type="submit"> Aggiorna</button>
            </form>
        </div>
        <?php renderTable($risultato3, "3. Ecco tutti gli eventi che ci sono stati negli ultimi n anni"); ?>
    </div>

    <div class="query-section">
        <div class="search-box">
            <h3>Cerca Storico Visitatore</h3>
            <form method="GET" action="">
                <input type="text" name="CF" placeholder="Inserisci Codice Fiscale (es. BNCHGL...)" 
                    value="<?php echo htmlspecialchars($_GET['CF'] ?? ''); ?>" required>
                <button type="submit" class="btn-search">🔍 Cerca</button>
            </form>
        </div>
        <?php renderTable($risultato4, "4. Qui puoi vedere tutti i biglietti e gli abbonamenti che hai comprato"); ?>
    </div>
</div>

</body>
</html>

