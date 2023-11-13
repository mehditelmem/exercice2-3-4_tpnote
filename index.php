<?php

include('clientDTO.php');
include('clientDO.php');
include('clientManager.php');


$clients = ClientManager::getAllClients();

?>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Clients</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Liste des Clients</h1>
    <div id="clients-list">
        <?php foreach ($clients as $client) : ?>
            <div class="client" data-id="<?= $client->id_client ?>">
                <?= "ID: " . $client->id_client . " - Nom: " . $client->nom_client . " - Prénom: " . $client->prenom_client ?>
            </div>
        <?php endforeach; ?>
    </div>
    <div id="client-details">
        <!-- Les détails du client sélectionné seront affichés ici -->
    </div>
    <script src="script.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const clientsListElement = document.getElementById('clients-list');
        const clientDetailsElement = document.getElementById('client-details');

        clientsListElement.addEventListener('click', function(event) {
            const clientElement = event.target.closest('.client');
            if (clientElement) {
                const clientId = clientElement.dataset.id;
                getClientDetailsById(clientId);
            }
        });

        // ...
    });
</script>
    <script src="script.js"></script>
</body>
</html>