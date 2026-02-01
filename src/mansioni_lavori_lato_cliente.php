<?php
require 'config/config.php';

if (!isset($_SESSION['ruolo'])) {
    header("Location: index.php");
    exit;
}

$mansioni = $dbh->getMansioni();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lavora con noi</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --accent-color: #3498db;
            --bg-color: #f4f7f6;
        }
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 40px 20px;
        }
        .container { 
            max-width: 1200px; 
            margin: 0 auto; 
        }
        h1 { 
            text-align: center; 
            color: var(--primary-color); 
            margin-bottom: 50px; 
        }

        .jobs-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
        }

        .job-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border-top: 6px solid var(--accent-color);
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease;
        }

        .job-card:hover { transform: translateY(-5px); }
        .job-card h2 { margin: 0 0 15px 0; color: var(--primary-color); font-size: 1.3rem; }
        .job-card p { color: #666; font-size: 0.95rem; flex-grow: 1; }

        .apply-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px;
            background-color: var(--accent-color);
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: background 0.3s;
        }

        .apply-btn:hover { background-color: #2980b9; }

        .success-message {
            display: none;
            margin-top: 20px;
            padding: 15px;
            background-color: #e8f5e9;
            color: var(--success-color);
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            line-height: 1.4;
            border: 1px solid #c8e6c9;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Lavora con noi</h1>

    <div class="jobs-grid">
        <?php
        if (!empty($mansioni)): 
            foreach ($mansioni as $lavoro): ?>
                <div class="job-card">
                    <h2><?php echo htmlspecialchars($lavoro['mansione']); ?></h2>
                    
                    <button class="apply-btn" onclick="mostraConferma(this)">Invia Candidatura</button>
                    
                    <div class="success-message">
                        Grazie per averci inviato la tua candidatura, ti arriverà una mail con le specifiche per completare l'operazione.
                    </div>
                </div>
            <?php endforeach; 
        else: ?>
            <p style="text-align:center; grid-column: 1/-1;">Nessuna posizione aperta al momento.</p>
        <?php endif; ?>
    </div>
</div>
<p></p>
<a href="visitatori_home.php" style="text-decoration:none;">&larr; Torna alla Home</a>

<script>
    function mostraConferma(button) {
        button.style.display = 'none';
        const card = button.parentElement;
        const message = card.querySelector('.success-message');
        message.style.display = 'block';
    }
</script>

</body>
</html>