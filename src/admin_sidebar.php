<?php
// Capiamo in che pagina siamo per evidenziare il link giusto
$pagina_corrente = basename($_SERVER['PHP_SELF']);
?>

<div class="sidebar">
    <h2>🔧 ADMIN PANEL</h2>
    
    <a href="admin_dashboard.php" class="menu-link <?php echo ($pagina_corrente == 'admin_dashboard.php') ? 'active' : ''; ?>">
        Dashboard
    </a>
    
    <a href="sezione_lavoratori_admin.php" class="menu-link <?php echo ($pagina_corrente == 'sezione_lavoratori_admin.php') ? 'active' : ''; ?>">
        🔨Lavoratori
    </a>
    
    <a href="admin_giostre.php" class="menu-link <?php echo ($pagina_corrente == 'admin_giostre.php') ? 'active' : ''; ?>">
        Giostre
    </a>
    
    <a href="admin_attrazioni.php" class="menu-link <?php echo ($pagina_corrente == 'admin_attrazioni.php') ? 'active' : ''; ?>">
        Attrazioni Horror
    </a>
    
    <a href="admin_attivita.php" class="menu-link <?php echo ($pagina_corrente == 'admin_attivita.php') ? 'active' : ''; ?>">
        Attività Commerciali
    </a>
    
    <a href="admin_aree.php" class="menu-link <?php echo ($pagina_corrente == 'admin_aree.php') ? 'active' : ''; ?>">
        Aree Tematiche
    </a>

    <a href="admin_eventi.php" class="menu-link <?php echo ($pagina_corrente == 'admin_eventi.php') ? 'active' : ''; ?>">
        Eventi
    </a>
    
    <a href="admin_ruote.php" class="menu-link <?php echo ($pagina_corrente == 'admin_ruote.php') ? 'active' : ''; ?>">
        Ruota Panoramica
    </a>
    <a href="admin_statoParco.php" class = "menu-link <?php ($pagina_corrente == 'admin_statoParco.php') ? 'active' : ''; ?>">
        Stato Parco e Manutenzioni
    </a>
    
    <a href="logout.php" class="menu-link logout">Esci</a>
</div>