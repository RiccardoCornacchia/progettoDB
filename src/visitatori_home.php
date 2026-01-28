<?php
//session_start();
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: login.php");
    exit;
}

$categoria = isset($_GET['categoria']) ? $_GET['categoria'] : null;

$titolo_sezione = "";
$elenco_elementi = [];
$col_nome = "";      
$col_info = "";      
$label_info = "";    
$col_status = "";
$col_info_2 = ""; 

try {
    if ($categoria) {
        switch ($categoria) {
            
            case 'Giostre':
                $elenco_elementi = $dbh->getGiostre(); 
                $col_nome = 'nomeGiostra';
                $col_info = 'tipologiaGiostra';
                $label_info = "Tipo:";
                $col_status = 'disponibilita';
                $titolo_sezione = "Le nostre Giostre";
                break;

            case 'Eventi':
                $elenco_elementi = $dbh->getEventi(); 
                $col_nome = 'nomeEvento';
                $col_info = 'data';
                $label_info = "Data:";
                $col_info_2 = 'oraInizio';
                $col_status = null; 
                $titolo_sezione = "Eventi in Programma";
                break;

            case 'Spettacoli':
                $elenco_elementi = $dbh->getSpettacoli();
                $col_nome = 'nomeSpettacolo';
                $col_info = 'durataSpettacolo';
                $label_info = "Durata (min):";
                $col_status = 'disponibilita';
                $titolo_sezione = "Spettacoli dal Vivo";
                break;

            case 'Horror': 
                $elenco_elementi = $dbh->getAttrazioniPaura();
                $col_nome = 'nomeAttrazionePaura';
                $col_info = 'prezzoAggiuntivo';
                $label_info = "Prezzo Extra:";
                $col_status = 'disponibilita';
                $titolo_sezione = "Attrazioni da Brivido";
                break;

            case 'RuotaPanoramica':
                $elenco_elementi = $dbh->getRuotaPanoramica();
                $col_nome = 'nomeRuota';
                $col_info = 'altezzaRuotaPanoramica'; 
                $label_info = "Altezza (m):";
                $col_status = 'disponibilita';
                $titolo_sezione = "Giro Panoramico";
                break;

            case 'AttivitaCommerciali':
                $elenco_elementi = $dbh->getAttivitaCommerciali();
                $col_nome = 'nomeAttivita';
                $col_info = 'tipologiaAttivita'; 
                $label_info = "Tipologia:";
                $col_status = 'disponibilita';
                $titolo_sezione = "Negozi e Ristorazione";
                break;

            case 'AreeTematiche':
                $elenco_elementi = $dbh->getAreeTematiche();
                $col_nome = 'nomeAreaTematica';
                $col_info = 'tema'; 
                $label_info = "Tema:";
                $col_status = 'disponibilita';
                $titolo_sezione = "Le nostre Aree Tematiche";
                break;

            default:
                $categoria = null; 
                break;
        }
    }

} catch (Exception $e) {
    $errore_db = "Errore nel recupero dati: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Esplora WonderPark</title>
    <style>

    body { font-family: sans-serif; background-color: #f9f9f9; margin: 0; color: #333; line-height: 1.6; }
    a { text-decoration: none; color: inherit; }
    
    
    nav { background: #333; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; color: white; }
    .logo { font-weight: bold; font-size: 1.2rem; }
    .btn-logout { background: #d9534f; color: white; padding: 5px 15px; border-radius: 4px; font-size: 0.9rem; }
    .btn-logout:hover { background: #c9302c; }

    .container { max-width: 900px; margin: 30px auto; padding: 0 15px; }
    
    .menu-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-top: 30px; }
    
    .menu-card, .card-statistiche {
        background: white; 
        border: 1px solid #ccc; 
        border-radius: 5px; 
        padding: 20px; 
        text-align: center;
        display: block;
        transition: background 0.2s;
    }
    .menu-card:hover, .card-statistiche:hover { background-color: #eee; border-color: #bbb; }

    .menu-icon { font-size: 2.5rem; display: block; margin-bottom: 10px; }
    .menu-title { font-weight: bold; font-size: 1.1rem; }

    .header-risultati { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; border-bottom: 1px solid #ddd; padding-bottom: 10px; }
    .btn-back { background: #ddd; color: #333; padding: 5px 10px; border-radius: 4px; font-weight: bold; }

    
    .item-card { 
        background: white; 
        border: 1px solid #ccc; 
        border-radius: 5px; 
        padding: 15px; 
        margin-bottom: 10px; 
        display: flex; 
        justify-content: space-between; 
        align-items: center; 
    }
    
    .badge { padding: 4px 8px; border-radius: 4px; font-size: 0.8rem; font-weight: bold; color: white; }
    .status-ok { background: #5cb85c; } 
    .status-ko { background: #d9534f; } 

    .btn-shop-foto {
        display: inline-block; margin-top: 8px; padding: 5px 10px;
        background-color: #337ab7; color: white; border-radius: 4px; font-size: 0.85rem;
    }

    .banner-ticket {
        background-color: #f0ad4e; 
        color: white;
        padding: 20px;
        border-radius: 5px;
        margin-top: 40px;
        display: flex; justify-content: space-between; align-items: center;
    }
    .banner-content h2 { margin: 0; font-size: 1.5rem; }
    .btn-buy {
        background: white; color: #f0ad4e; padding: 10px 20px;
        border-radius: 4px; font-weight: bold; border: 1px solid white;
    }
    .btn-buy:hover { background: #fdfdfd; }

    .wrapper-centrato { text-align: center; margin-top: 30px; }
    .box-link { display: inline-block; width: 100%; max-width: 400px; }

    .site-footer {
        background-color: #eee; color: #555;
        padding: 20px; margin-top: 50px; text-align: center; border-top: 1px solid #ccc;
    }
    .footer-nav ul { list-style: none; padding: 0; display: flex; justify-content: center; gap: 15px; }
    .footer-nav a:hover { text-decoration: underline; color: #333; }

    @media (max-width: 600px) {
        .banner-ticket { flex-direction: column; text-align: center; gap: 15px; }
    }
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

        <?php if (!$categoria): ?>
            
            <div style="text-align: center; margin-bottom: 40px;">
                <h1 style="color: #2c3e50;">Esplora il Parco</h1>
                <p style="color: #7f8c8d; font-size: 1.1rem;">Seleziona un'area per vedere disponibilità e orari in tempo reale.</p>
            </div>

            <div class="menu-grid">
                <a href="?categoria=Giostre" class="menu-card card-giostre">
                    <span class="menu-icon">🎢</span>
                    <span class="menu-title">Giostre</span>
                </a>

                <a href="?categoria=Eventi" class="menu-card card-eventi">
                    <span class="menu-icon">🎉</span>
                    <span class="menu-title">Eventi</span>
                </a>

                <a href="?categoria=Spettacoli" class="menu-card card-spettacoli">
                    <span class="menu-icon">🎭</span>
                    <span class="menu-title">Spettacoli</span>
                </a>

                <a href="?categoria=Horror" class="menu-card card-horror">
                    <span class="menu-icon">👻</span>
                    <span class="menu-title">Horror</span>
                </a>

                <a href="?categoria=RuotaPanoramica" class="menu-card card-ruota">
                    <span class="menu-icon">🎡</span>
                    <span class="menu-title">Ruota Panoramica</span>
                </a>

                <a href="?categoria=AttivitaCommerciali" class="menu-card card-attivita">
                    <span class="menu-icon">🛍️</span>
                    <span class="menu-title">Negozi & Food</span>
                </a>

                <a href="?categoria=AreeTematiche" class="menu-card card-aree">
                    <span class="menu-icon">💫</span>
                    <span class="menu-title">Aree Tematiche</span>
                </a>
            </div>

        <?php else: ?>

            <div class="header-risultati">
                <a href="visitatori_home.php" class="btn-back">⬅</a>
                <h2 style="margin:0; color: #2c3e50;"><?php echo $titolo_sezione; ?></h2>
            </div>

            <?php if (isset($errore_db)): ?>
                <div style="background:#f8d7da; color:#721c24; padding:15px; border-radius:5px;">
                    <?php echo $errore_db; ?>
                </div>
            <?php elseif (count($elenco_elementi) > 0): ?>
                
                <?php foreach ($elenco_elementi as $item): ?>
                    <div class="item-card">
                        <div>
                            <h3 style="margin: 0 0 5px 0; color: #333;">
                                <?php echo htmlspecialchars($item[$col_nome]); ?>
                            </h3>
                            
                            <span style="color: #666; font-size: 0.9rem;">
                                <?php echo $label_info; ?> 
                                <strong><?php echo htmlspecialchars($item[$col_info]); ?></strong>
                            </span>

                            <?php if ($col_info_2 && isset($item[$col_info_2])): ?>
                                <br>
                                <span style="color: #666; font-size: 0.9rem;">
                                    Ore: <strong><?php echo htmlspecialchars($item[$col_info_2]); ?></strong>
                                </span>
                            <?php endif; ?>


                            <?php 
                            
                            if ($categoria === 'AttivitaCommerciali' && isset($item['tipologiaAttivita'])) {
                                if (stripos($item['tipologiaAttivita'], 'Foto') !== false) {
                                    echo '<br><a href="acquisto_foto.php?id=' . $item['codiceAttivita'] . '" class="btn-shop-foto">📸 Acquista Foto</a>';
                                }
                            }
                            ?>
                        </div>

                        <?php if ($col_status): ?>
                            <?php 
                                $stato_val = isset($item[$col_status]) ? $item[$col_status] : 'N/D';
                                $css_class = (stripos($stato_val, 'chiuso') === false) ? 'status-ok' : 'status-ko';
                            ?>
                            <span class="badge <?php echo $css_class; ?>">
                                <?php echo htmlspecialchars($stato_val); ?>
                            </span>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>

            <?php else: ?>
                <div style="text-align:center; padding: 50px; color: #999;">
                    <h3>Nessun elemento trovato </h3>
                    <p>La tabella <?php echo htmlspecialchars($categoria); ?> sembra vuota nel database.</p>
                </div>
            <?php endif; ?>

        <?php endif; ?>

        <div class="banner-ticket">
            <div class="banner-content">
                <h2>Non hai ancora il biglietto?</h2>
                <p>Salta la fila alle casse! Acquista online e accedi subito al parco.</p>
            </div>
            
            <a href="client_acquistoBiglietti_Abbonamenti.php" class="btn-buy">Acquista Ora ➔</a>
        </div>
            
        <div class="wrapper-centrato">
            <a href="statistiche_lato_client.php" class="box-link">
                <div class="card-statistiche">
                    <h3>Visualizza Statistiche</h3>
                    <p>Accedi alla pagina in cui potrai visualizzare alcuni dati che potrebbero interessarti</p>
                </div>
            </a>
        </div>

    </div>

    <footer class="site-footer">
        <div class="footer-content">
            <p>&copy; WonderPark 2026</p>
            <nav class="footer-nav">
                <ul>
                    <li><a href="index.php">Login</a></li>
                    <li><a href="contatti.php">Contatti</a></li>
                    <li><a href="mansioni_lavori_lato_cliente.php" class="footer-link">Lavora con noi</a></li>
                </ul>
            </nav>
        </div>
    </footer>

</body>
</html>