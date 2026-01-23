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
