<?php
include('clientDTO.php');
include('clientDO.php');
include('clientManager.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $clientId = json_decode(file_get_contents('php://input'), true)['clientId'];

    $clientDetails = ClientManager::getClientDetailsById($clientId);

    header('Content-Type: application/json');
    echo json_encode($clientDetails);
} else {
    http_response_code(405); // Méthode non autorisée
}
?>
