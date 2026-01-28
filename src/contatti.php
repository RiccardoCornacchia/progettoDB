<?php
session_start();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Contatti - WonderPark</title>
    <style>
    /* RESET E BASE */
    body { font-family: sans-serif; background-color: #f9f9f9; margin: 0; color: #333; }
    a { text-decoration: none; }

    /* NAVBAR: Barra scura semplice */
    nav { background: #333; color: white; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; }
    .logo { font-weight: bold; font-size: 1.2rem; }
    
    /* BOTTONE INDIETRO: Grigio semplice */
    .btn-home { background: #ddd; color: #333; padding: 5px 15px; border-radius: 4px; font-weight: bold; font-size: 0.9rem; }
    .btn-home:hover { background: #ccc; }

    /* CONTENITORE PRINCIPALE */
    .container { max-width: 600px; margin: 40px auto; padding: 0 15px; }

    /* CARD CONTATTI: Niente ombre, solo un bordo sottile */
    .contact-card {
        background: white;
        border: 1px solid #ccc; /* Bordo grigio al posto dell'ombra */
        padding: 30px;
        text-align: center;
        border-radius: 4px;
    }

    h1 { margin-top: 0; color: #333; }
    p.intro { color: #666; margin-bottom: 30px; }

    /* LISTA INFORMAZIONI */
    .info-list { list-style: none; padding: 0; text-align: left; display: inline-block; }
    
    .info-item { display: flex; align-items: center; margin-bottom: 20px; }
    
    /* ICONE: Semplici, senza cerchio di sfondo */
    .icon { font-size: 1.8rem; margin-right: 15px; }
    
    .label { display: block; font-weight: bold; font-size: 0.85rem; color: #555; text-transform: uppercase; }

    /* FOOTER */
    .site-footer {
        background-color: #eee; color: #555;
        padding: 20px; margin-top: 40px; text-align: center;
        border-top: 1px solid #ccc;
    }
    .footer-nav ul { list-style: none; padding: 0; display: flex; justify-content: center; gap: 15px; }
    .footer-nav a { color: #555; }
    .footer-nav a:hover { text-decoration: underline; color: #000; }
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