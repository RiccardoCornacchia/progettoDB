<?php
session_start();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Contatti - WonderPark</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f6f8; margin: 0; }
        
        /* NAVBAR STILE UNIFICATO */
        nav { background: #2c3e50; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; color: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .logo { font-weight: bold; color: #ff6b6b; font-size: 1.2rem; text-transform: uppercase; }
        
        /* BOTTONE INDIETRO */
        .btn-home { 
            background: #3498db; color: white; text-decoration: none; 
            padding: 8px 20px; border-radius: 20px; font-size: 0.9rem; transition: 0.3s; 
        }
        .btn-home:hover { background: #2980b9; }

        /* CONTENITORE CENTRALE */
        .container { 
            max-width: 600px; /* Più stretto perché c'è solo un box */
            margin: 60px auto; 
            padding: 0 20px; 
        }

        /* CARD BIANCA */
        .contact-card {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
            text-align: center; /* Testo centrato per eleganza */
        }

        h1 { margin-top: 0; color: #2c3e50; margin-bottom: 30px; }
        p.intro { color: #7f8c8d; margin-bottom: 40px; }

        /* LISTA INFO */
        .info-list {
            list-style: none;
            padding: 0;
            margin: 0;
            text-align: left; /* Le info le allineiamo a sinistra per ordine */
            display: inline-block; /* Per centrare il blocco rispetto alla card */
        }

        .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            font-size: 1.1rem;
            color: #333;
        }

        .icon {
            font-size: 1.5rem;
            margin-right: 20px;
            background: #ecf0f1;
            width: 50px; height: 50px;
            display: flex; align-items: center; justify-content: center;
            border-radius: 50%;
        }

        .label {
            display: block;
            font-size: 0.85rem;
            color: #999;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
            margin-bottom: 2px;
        }
        .site-footer {
            background-color: #2c3e50;
            color: white;
            padding: 30px 20px;
            margin-top: 50px;
            display: flex;
            flex-direction: column; 
            align-items: center;    
            text-align: center;     
        }

        .footer-nav ul {
            list-style: none;
            padding: 0;
            margin: 15px 0 0;
            display: flex;
            justify-content: center; 
            gap: 20px;               
            flex-wrap: wrap;         
        }

        .footer-nav a {
            color: #bdc3c7;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .footer-nav a:hover { color: #3498db; }
        .footer-link { font-weight: bold; }

    </style>
</head>
<body>

    <nav>
        <div class="logo">WonderPark Info</div>
        
        <?php if(isset($_SESSION['ruolo']) && $_SESSION['ruolo'] == 'admin'): ?>
            <a href="admin_dashboard.php" class="btn-home">Torna alla Dashboard</a>
        <?php elseif(isset($_SESSION['ruolo']) && $_SESSION['ruolo'] == 'visitatore'): ?>
            <a href="visitatori_home.php" class="btn-home">Torna alla Home</a>
        <?php else: ?>
            <a href="index.php" class="btn-home">Torna al Login</a>
        <?php endif; ?>
    </nav>

    <div class="container">
        
        <div class="contact-card">
            <h1>Contatti</h1>
            <p class="intro">Hai bisogno di assistenza o informazioni? <br>Ecco come raggiungerci.</p>

            <div class="info-list">
                
                <div class="info-item">
                    <div class="icon">📍</div>
                    <div>
                        <span class="label">Indirizzo</span>
                        Via delle Meraviglie, 88<br>47900 Rimini (RN)
                    </div>
                </div>

                <div class="info-item">
                    <div class="icon">📞</div>
                    <div>
                        <span class="label">Telefono</span>
                        +39 0541 123 456
                    </div>
                </div>

                <div class="info-item">
                    <div class="icon">✉️</div>
                    <div>
                        <span class="label">Email</span>
                        info@wonderpark.it
                    </div>
                </div>

            </div>
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