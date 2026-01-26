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
                $col_info = 'oraInizio';
                $label_info = "Inizio ore:";
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

            // --- NUOVO CASO AGGIUNTO: RUOTA PANORAMICA ---
            case 'RuotaPanoramica':
                $elenco_elementi = $dbh->getRuotaPanoramica();
                $col_nome = 'nomeRuota';
                // Dal tuo schema SQL la colonna è 'altezzaRuotaPanoramica'
                $col_info = 'altezzaRuotaPanoramica'; 
                $label_info = "Altezza (m):";
                $col_status = 'disponibilita';
                $titolo_sezione = "Giro Panoramico";
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
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f4f9; margin: 0; padding-bottom: 50px; }
    
        nav { background: #2c3e50; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; color: white; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .logo { font-weight: bold; color: #ff6b6b; font-size: 1.2rem; text-transform: uppercase; }
        .btn-logout { background: #e74c3c; color: white; text-decoration: none; padding: 8px 20px; border-radius: 20px; font-size: 0.9rem; transition: 0.3s; }
        .btn-logout:hover { background: #c0392b; }

        .container { max-width: 1000px; margin: 40px auto; padding: 0 20px; }

       
        .menu-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 25px; margin-top: 50px; }
        
        .menu-card {
            background: white; border-radius: 15px; padding: 40px 20px; text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05); text-decoration: none; color: #333;
            transition: transform 0.3s, border-color 0.3s; border-bottom: 5px solid transparent; display: block;
        }
        .menu-card:hover { transform: translateY(-5px); }
        
        
        .card-giostre { border-bottom-color: #3498db; }
        .card-eventi { border-bottom-color: #9b59b6; }
        .card-spettacoli { border-bottom-color: #f1c40f; }
        .card-horror { border-bottom-color: #e74c3c; }
        .card-ruota { border-bottom-color: #2ecc71; } 

        .menu-icon { font-size: 3.5rem; display: block; margin-bottom: 15px; }
        .menu-title { font-size: 1.5rem; font-weight: bold; display: block; }

        
        .header-risultati { display: flex; align-items: center; gap: 20px; margin-bottom: 30px; border-bottom: 2px solid #ddd; padding-bottom: 15px; }
        .btn-back { background: #ecf0f1; color: #333; padding: 10px 15px; border-radius: 50%; text-decoration: none; font-weight: bold; font-size: 1.2rem; }
        .btn-back:hover { background: #bdc3c7; }

        .item-card { 
            background: white; padding: 20px; border-radius: 10px; margin-bottom: 15px; 
            box-shadow: 0 4px 6px rgba(0,0,0,0.05); display: flex; justify-content: space-between; align-items: center; border-left: 5px solid #bdc3c7;
        }
        
        .badge { padding: 6px 12px; border-radius: 20px; font-size: 0.85rem; font-weight: bold; text-transform: uppercase; }
        .status-ok { background: #d4edda; color: #155724; } /* Verde */
        .status-ko { background: #FF0000; color: #721c24; } /* Rosso */

        
        .banner-ticket {
            background: linear-gradient(135deg, #f1c40f 0%, #f39c12 100%); /* Oro/Arancio */
            color: #fff;
            border-radius: 15px;
            padding: 30px 40px;
            margin-top: 50px; 
            box-shadow: 0 10px 20px rgba(243, 156, 18, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .banner-ticket::before {
            content: '';
            position: absolute;
            top: -50px; left: -50px;
            width: 150px; height: 150px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
        }

        .banner-content h2 { margin: 0; font-size: 1.8rem; text-shadow: 1px 1px 2px rgba(0,0,0,0.1); }
        .banner-content p { margin: 5px 0 0 0; opacity: 0.9; font-size: 1.1rem; }

        .btn-buy {
            background-color: white;
            color: #d35400;
            padding: 15px 35px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            white-space: nowrap; 
        }

        .btn-buy:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        @media (max-width: 600px) {
            .banner-ticket { flex-direction: column; text-align: center; gap: 20px; }
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
                        </div>

                        <?php if ($col_status): ?>
                            <?php 
                                // Gestione sicura dello stato
                                $stato_val = isset($item[$col_status]) ? $item[$col_status] : 'N/D';
                                $css_class = (stripos($stato_val, 'chius') === false) ? 'status-ok' : 'status-ko';
                            ?>
                            <span class="badge <?php echo $css_class; ?>">
                                <?php echo htmlspecialchars($stato_val); ?>
                            </span>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>

            <?php else: ?>
                <div style="text-align:center; padding: 50px; color: #999;">
                    <h3>Nessun elemento trovato 😔</h3>
                    <p>La tabella <?php echo htmlspecialchars($categoria); ?> sembra vuota nel database.</p>
                </div>
            <?php endif; ?>

        <?php endif; ?>

        <div class="banner-ticket">
            <div class="banner-content">
                <h2>🎟 Non hai ancora il biglietto?</h2>
                <p>Salta la fila alle casse! Acquista online e accedi subito al parco.</p>
            </div>
            
            <a href="acquisto_biglietti.php" class="btn-buy">Acquista Ora ➔</a>
        </div>

    </div>

</body>
</html>