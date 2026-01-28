<?php

require 'config/config.php'; 

$pass_admin_corretta      = "admin123";      
$pass_visitatore_corretta = "parco2024";     

$errore = '';


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $password_inserita = $_POST['password'];

    
    if ($password_inserita === $pass_admin_corretta) {
        $_SESSION['ruolo'] = 'admin';
        $_SESSION['login_time'] = time(); 
        
        header("Location: admin_dashboard.php");
        exit;
    } elseif ($password_inserita === $pass_visitatore_corretta) {
        $_SESSION['ruolo'] = 'visitatore';
        
        
        header("Location: visitatori_home.php");
        exit;

    } else {
        
        $errore = "Password non riconosciuta. Riprova.";
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Login Parco - Accesso</title>
    <style>
    body { 
        font-family: sans-serif; 
        background-color: #f0f0f0; 
        margin: 0; 
        height: 100vh; 
        display: flex; 
        justify-content: center; 
        align-items: center; 
    }

    .box { 
        background: white; 
        padding: 40px; 
        width: 300px; 
        border: 1px solid #ccc;
        text-align: center; 
    }
    h2 { margin-top: 0; color: #333; }
    p { color: #666; margin-bottom: 20px; font-size: 0.9rem; }
    .logo { font-size: 3rem; display: block; margin-bottom: 10px; }
    input { 
        width: 100%; 
        padding: 10px; 
        margin-top: 10px; 
        border: 1px solid #ccc; 
        box-sizing: border-box; 
    }

    button { 
        width: 100%; 
        padding: 10px; 
        margin-top: 20px; 
        background: #337ab7; 
        color: white; 
        border: none; 
        cursor: pointer; 
        font-size: 1rem;
    }
    button:hover { background: #286090; }

    
    .error { 
        color: #d9534f; 
        margin-top: 15px; 
        font-size: 0.9rem; 
    }
</style>
</head>
<body>

    <div class="box">
        <span class="logo">🎡</span>
        <h2>WONDERPARK</h2>
        <p>Inserisci il codice di accesso per entrare.</p>
        
        <form method="post" action="index.php">
            <input type="password" name="password" placeholder="Inserisci Password..." required autofocus>
            <br>
            <button type="submit">Entra nel Parco</button>
        </form>

        <?php if ($errore): ?>
            <div class="error">⚠️ <?php echo $errore; ?></div>
        <?php endif; ?>
    </div>

</body>
</html>