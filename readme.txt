Le istruzioni per eseguire il progetto in locale sono le seguenti. 

**1. Configurazione del Database**

Il progetto utilizza un database MySQL. Per configurarlo si seguano questi passaggi:

1.  Aprire MySqlWorkbench.

2.  **Creare il database ed eseguire gli script SQL.**
    Il file `src/db/tables.sql` contiene già il comando per creare il database (`parco_divertimenti_db`) e tutte le tabelle necessarie.
    
    *   **Eseguire `src/db/tables.sql`:** Questo creerà la struttura del database.
    *   **Eseguire `src/db/data.sql`:** Questo popolerà il database con i dati iniziali necessari per il funzionamento del sito.

3.  **Verificare la connessione.**
    Aprire il file `src/config/config.php`. All'interno si trovano le credenziali per la connessione al database:
    
    `$dbh = new DatabaseHelper("127.0.0.1", "root", "", "parco_divertimenti_db", 3306);`
    
    Assicurarsi che il tuo server MySQL locale utilizzi queste credenziali (utente 'root' e password ''). In caso contrario,
    modificare il file con le credenziali corrette.

**2. Avvio del Server Web**

Il sito è sviluppato in HTML, PHP e CSS. Per avviarlo:

1.  Controllare di avere la cartella del progetto nella cartella htdocs all'interno di XAMPP
1.  Aprire XAMPP/MAMP
2.  Avviare APACHE
3.  Aprire un browser e apire localhost

**3. Accesso al Sito**

La pagina iniziale (`index.php`) è un portale di accesso che richiede una password per differenziare due tipi di utenti:
l'amministratore e il visitatore.

Le password sono inserite nel file `src/index.php`:

*   **Accesso come Amministratore:**
    *   **Password:** `admin123`
    *   **Scopo:** Questa password dà accesso alla dashboard di amministrazione (`admin_dashboard.php`), da cui è possibile gestire le varie sezioni del parco.

*   **Accesso come Visitatore:**
    *   **Password:** `parco2024`
    *   **Scopo:** Questa password reindirizza alla home page per i visitatori (`visitatori_home.php`), che simula la vista che avrebbe un utente generico per consultare le informazioni pubbliche del parco e l'eventuale acquisto di biglietto e abbonamento.

Buon divertimento!
Grazie!