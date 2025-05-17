<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "CostellazioniDB";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StarBase</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #121212;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            text-align: center;
            padding: 20px;
            background-image:
                radial-gradient(white, rgba(255,255,255,.2) 2px, transparent 2px),
                radial-gradient(white, rgba(255,255,255,.15) 1px, transparent 1px);
            background-size: 50px 50px, 30px 30px;
            background-position: 0 0, 25px 25px;
        }
        h1 {
            color: #4e9af1;
            margin-top: 20px;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }
        .container {
            max-width: 800px;
            width: 100%;
        }
        .controls, .info-box, .constellation-card, .skymap-container {
            background-color: rgba(25, 25, 40, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
            width: 100%;
        }
        button {
            background-color: #4e9af1;
            color: #fff;
            cursor: pointer;
            border: none;
            padding: 12px 24px;
            font-weight: bold;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
            width: 100%;
            max-width: 300px;
            margin: 10px auto;
            display: block;
        }
        button:hover {
            background-color: #3a7bc0;
        }
        .constellation-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .constellation-card {
            width: 100%;
            max-width: 300px;
        }
        .main-content {
            display: flex;
            flex-direction: column;
            width: 100%;
            align-items: center;
        }
        .skymap-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            max-width: 100%;
            overflow: hidden;
        }
        .skymap-iframe {
            border: 1px solid #303050;
            border-radius: 5px;
            overflow: hidden;
            max-width: 100%;
        }
        #status {
            margin-bottom: 10px;
        }
        @media (max-width: 768px) {
            h1 { font-size: 1.5rem; }
            .controls, .info-box, .constellation-card, .skymap-container {
                padding: 15px;
            }
            button { font-size: 0.9rem; }
            #skymap-iframe {
                width: 100%;
                height: auto;
                min-height: 500px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header><h1>StarBase</h1></header>
        
        <div class="main-content">
            <div class="controls">
                <p id="status">Determinazione della posizione...</p>
                <button onclick="getLocation()">Usa la mia posizione</button>
            </div>
            
            <div class="skymap-container">
                <div id="skymap-wrapper">
                    <!-- La mappa del cielo verrà caricata qui dinamicamente -->
                </div>
            </div>
            
            <div id="result"></div>
        </div>

        <script>
            // Variabili globali per memorizzare la posizione
            let userLatitude = 0;
            let userLongitude = 0;
            
            // Inizializza la mappa con i valori predefiniti
            updateSkymap(userLatitude, userLongitude);
            
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(sendPosition, showError);
                } else {
                    document.getElementById("status").innerHTML = "Geolocalizzazione non supportata.";
                }
            }

            function sendPosition(position) {
                userLatitude = position.coords.latitude;
                userLongitude = position.coords.longitude;
                
                document.getElementById("status").innerHTML = "Posizione rilevata: " + userLatitude.toFixed(2) + ", " + userLongitude.toFixed(2);
                
                // Aggiorna la mappa del cielo con la nuova posizione
                updateSkymap(userLatitude, userLongitude);
                
                // Invia la latitudine al server tramite POST per ottenere le costellazioni
                fetch("get_constellations.php", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: "latitude=" + userLatitude + "&longitude=" + userLongitude
                })
                .then(response => response.text())
                .then(data => document.getElementById("result").innerHTML = data)
                .catch(error => console.error("Errore:", error));
            }
            
            function updateSkymap(lat, lon) {
                // Crea l'iframe per la mappa del cielo utilizzando solo latitudine e longitudine
                const iframe = document.createElement('iframe');
                iframe.id = 'skymap-iframe';
                iframe.src = `https://astroviewer.net/av/widgets/skymap-av4-widget.php?lon=${lon}&lat=${lat}&deco=31&lang=it&size=300`;
                iframe.sandbox = 'allow-scripts allow-popups';
                iframe.style = 'overflow-x:auto;border: 1px solid #303050;border-radius:5px;max-width:100%;';
                iframe.width = '500';
                iframe.height = '620';
                
                // Aggiorna il contenitore della mappa
                const container = document.getElementById('skymap-wrapper');
                container.innerHTML = ''; // Rimuovi il contenuto precedente
                container.appendChild(iframe);
            }

            function showError(error) {
                switch(error.code) {
                    case error.PERMISSION_DENIED:
                        document.getElementById("status").innerHTML = "Permesso negato per la geolocalizzazione.";
                        break;
                    case error.POSITION_UNAVAILABLE:
                        document.getElementById("status").innerHTML = "Informazioni sulla posizione non disponibili.";
                        break;
                    case error.TIMEOUT:
                        document.getElementById("status").innerHTML = "Tempo scaduto nel recupero della posizione.";
                        break;
                    default:
                        document.getElementById("status").innerHTML = "Errore sconosciuto.";
                        break;
                }
            }
            
            // Carica lo script di Astroviewer
            (function() {
                const script = document.createElement('script');
                script.src = 'https://astroviewer-net.translate.goog/widgets/widgets/skymap.js';
                document.body.appendChild(script);
            })();
        </script>
    </div>
</body>
</html>
