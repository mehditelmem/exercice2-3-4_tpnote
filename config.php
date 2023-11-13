<?php
	define('DB_SERVER', 'localhost');
    define('DB_USERNAME', 'mehdi');
    define('DB_PASSWORD', '123456');
    define('DB_NAME', 'gestion_agence');
    
    $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
    
    if ($conn->connect_error) {
        die("La connexion à la base de données a échoué : " . $conn->connect_error);
    }
?>

