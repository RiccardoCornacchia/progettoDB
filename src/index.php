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
        body { font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #2c3e50; margin: 0; }
        .box { background: white; padding: 50px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); text-align: center; width: 350px; }
        h2 { color: #333; margin-top: 0; }
        p { color: #666; margin-bottom: 30px; }
        
        input { 
            padding: 15px; width: 100%; margin-top: 10px; border: 2px solid #eee; 
            border-radius: 8px; box-sizing: border-box; font-size: 1rem; outline: none; transition: 0.3s;
        }
        input:focus { border-color: #3498db; }
        
        button { 
            margin-top: 25px; padding: 15px 20px; background: #3498db; color: white; 
            border: none; border-radius: 8px; cursor: pointer; width: 100%; font-size: 1.1rem; font-weight: bold; transition: 0.3s;
        }
        button:hover { background: #2980b9; transform: translateY(-2px); }
        
        .error { color: #e74c3c; font-weight: bold; margin-top: 20px; background: #fadbd8; padding: 10px; border-radius: 5px; }
        .logo { font-size: 3rem; margin-bottom: 10px; display: block; }
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