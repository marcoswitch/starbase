<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "CostellazioniDB";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $latitude = floatval($_POST['latitude']);
    $longitude = floatval($_POST['longitude']);
    
   
    $sql = "SELECT * FROM Costellazioni WHERE (? BETWEEN Latitudine_Minima AND Latitudine_Massima) AND (? BETWEEN Longitudine_Minima AND Longitudine_Massima)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("dd", $latitude, $longitude);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo '<div class="info-box">';
        echo '<h2>Costellazioni visibili</h2>';
        echo '<div class="constellation-grid">';
        while ($row = $result->fetch_assoc()) {
            echo '<div class="constellation-card">';
            echo '<h2>' . htmlspecialchars($row['Nome']) . '</h2>';
            echo '<p><strong>Descrizione:</strong> ' . htmlspecialchars($row['Descrizione']) . '</p>';
            echo '</div>';
        }
        echo '</div></div>';
    } else {
        echo '<p class="info-box">Nessuna costellazione visibile trovata con le coordinate fornite.</p>';
    }

    $stmt->close();
}
$conn->close();
?>
