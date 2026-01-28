<?php
require 'config/config.php';

// 1. Azione Aggiunta
if (isset($_POST['azione']) && $_POST['azione'] == 'aggiungi') {
    $nome = $_POST['nome'];
    $cognome = $_POST['cognome'];
    $dataNascita = $_POST['dataNascita'];
    $CF = $_POST['CF'];
    $numeroTelefono = $_POST['numeroTelefono'];
    $e_mail = $_POST['e_mail'];
    $mansione = $_POST['mansione'];
    $dataInizioContratto = $_POST['dataInizioContratto'];
    $stipendio = $_POST['stipendio'];
    
    $codiceAttivita_puntoRistoro = !empty($_POST['codiceAttivita_puntoRistoro']) ? $_POST['codiceAttivita_puntoRistoro'] : null;
    $codiceAttivita_negozio = !empty($_POST['codiceAttivita_negozio']) ? $_POST['codiceAttivita_negozio'] : null;
    $nomeGiostra = !empty($_POST['nomeGiostra']) ? $_POST['nomeGiostra'] : null;
    $nomeAreaTematica = !empty($_POST['nomeAreaTematica']) ? $_POST['nomeAreaTematica'] : null;
    $nomeRuota = !empty($_POST['nomeRuota']) ? $_POST['nomeRuota'] : null;
    $nomeAttrazionePaura = !empty($_POST['nomeAttrazionePaura']) ? $_POST['nomeAttrazionePaura'] : null;

    $esiste_gia = false;
    foreach ($lavoratori as $l) {
        if (strcasecmp($l['CF'], $CF) == 0) {
            $esiste_gia = true;
            break;
        }
    }

    if ($esiste_gia) {
        $errore = "Attenzione: Esiste già una giostra con il nome '$nome_inserito'!";
    } else if (!empty($nome) && !empty($cognome) && !empty($CF)) {
        $dbh->addLavoratore($nome, $cognome, $dataNascita, $CF, $numeroTelefono, $e_mail, $mansione, $dataInizioContratto, $stipendio, $codiceAttivita_puntoRistoro, $codiceAttivita_negozio, $nomeGiostra, $nomeAreaTematica, $nomeRuota, $nomeAttrazionePaura);
    }
    header("Location: sezione_lavoratoratori_admin.php");
    exit();
}

// 2. Azione Eliminazione
if (isset($_GET['elimina'])) {
    $id = (int)$_GET['elimina'];
    $dbh->deleteLavoratore($CF);
    header("Location: sezione_lavoratoratori_admin.php");
}

// 3. Recupero dati aggiornati
$lavoratori = $dbh->getLavoratori();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Admin - Gestione Lavoratori</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7f6; padding: 20px; }
        .container { max-width: 1100px; margin: 0 auto; }
        
        .form-container { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); margin-bottom: 30px; }
        .grid-inputs { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 15px; }
        input { padding: 10px; border: 1px solid #ddd; border-radius: 4px; }
        .btn-add { grid-column: 1 / -1; padding: 12px; background: #27ae60; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; margin-top:10px; }

        .nav-actions {
            margin: 20px 0;
            display: flex;
            justify-content: flex-start;
        }

        .btn-turni {
            display: inline-flex;
            align-items: center;
            padding: 12px 20px;
            background-color: #34495e;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .btn-turni:hover {
            background-color: #2c3e50;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .btn-turni .icon {
            margin-right: 10px;
            font-size: 1.2rem;
        }

        .table-container { background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 15px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #2c3e50; color: white; font-size: 0.9rem; }
        tr:hover { background: #f9f9f9; }
        

        .btn-delete {
            display: inline-block;
            padding: 6px 12px;
            background-color: #e74c3c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 0.85rem;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<div class="container">
    <a href="admin_dashboard.php" style="text-decoration:none;">&larr; Torna a Admin dashboard</a>
    <h1>Gestione Personale Parco</h1>

    <div class="form-container">
        <h3>Registrazione di un nuovo Lavoratore</h3>
        <form method="POST">
            <input type="hidden" name="azione" value="aggiungi">
            
            <div class="grid-inputs">
                <input type="text" name="nome" placeholder="Nome" required>
                <input type="text" name="cognome" placeholder="Cognome" required>
                <input type="text" name="CF" placeholder="Codice Fiscale">
                <input type="date" name="dataNascita" title="Data di Nascita">
                <input type="email" name="e_mail" placeholder="Email">
                <input type="text" name="numeroTelefono" placeholder="Telefono">
                <input type="text" name="mansione" placeholder="Mansione">
                <input type="date" name="dataInizioContratto" title="Inizio Contratto">
                <input type="number" step="0.01" name="stipendio" placeholder="Stipendio €">

                <input type="text" name="codiceAttivita_puntoRistoro" placeholder="Cod. Punto Ristoro">
                <input type="text" name="codiceAttivita_negozio" placeholder="Cod. Negozio">
                <input type="text" name="nomeGiostra" placeholder="Nome Giostra">
                <input type="text" name="nomeAreaTematica" placeholder="Nome Area Tematica">
                <input type="text" name="nomeRuota" placeholder="Nome Ruota">
                <input type="text" name="nomeAttrazionePaura" placeholder="Nome Attrazione Paura">
            </div>
            <button type="submit" class="btn-add">Registra Lavoratore</button>
        </form>
    </div>

    <div class="nav-actions">
        <a href="turni_di_lavoro_admin.php" class="btn-turni">
            <span class="icon">📅</span> Gestione Turni di Lavoro
        </a>
    </div>

    <div class="nav-actions">
        <a href="elenco_lavoratori.php" class="btn-turni">
            Elenco Lavoratori Per Mansione
        </a>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Nome e Cognome</th>
                    <th>Email</th>
                    <th>Mansione</th>
                    <th>Stipendio</th>
                    <th>Assegnazione</th>
                    <th>Azioni</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($lavoratori as $l): ?>
                <tr>
                    <td><strong><?php echo htmlspecialchars($l['nome'] . " " . $l['cognome']); ?></strong></td>
                    <td><?php echo htmlspecialchars($l['e_mail']); ?></td>
                    <td><?php echo htmlspecialchars($l['mansione']); ?></td>
                    <td>€ <?php echo number_format($l['stipendio'], 2); ?></td>
                    <td>
                        <?php 
                            if (!empty($l['codiceAttivita_puntoRistoro'])) {
                                // Chiamiamo il database per il nome del punto ristoro
                                echo "Ristoro: " . htmlspecialchars($dbh->getNomeAttivita($l['codiceAttivita_puntoRistoro']));
                            } elseif (!empty($l['codiceAttivita_negozio'])) {
                                // Chiamiamo il database per il nome del negozio
                                echo "Negozio: " . htmlspecialchars($dbh->getNomeAttivita($l['codiceAttivita_negozio']));
                            } elseif (!empty($l['nomeGiostra'])) {
                                echo "Giostra: " . htmlspecialchars($l['nomeGiostra']);
                            } elseif (!empty($l['nomeAreaTematica'])) {
                                echo "Area Tematica: " . htmlspecialchars($l['nomeAreaTematica']);
                            } elseif (!empty($l['nomeRuota'])) {
                                echo "Ruota: " . htmlspecialchars($l['nomeRuota']);
                            }  elseif (!empty($l['nomeAttrazionePaura'])) {
                                echo "Attrazione Paura: " . htmlspecialchars($l['nomeAttrazionePaura']);
                            } 
                            else {
                                echo "-";
                            }
                        ?>
                    </td>
                    <td>
                        <a href="?elimina=<?php echo $l['CF']; ?>" 
                        class="btn-delete" 
                        onclick="return confirm('Sei sicuro di voler licenziare/eliminare questo lavoratore?')">
                        Elimina
                        </a>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</body>
</html>