document.addEventListener('DOMContentLoaded', function() {
    const clientsListElement = document.getElementById('clients-list');
    const clientDetailsElement = document.getElementById('client-details');

    clientsListElement.addEventListener('click', function(event) {
        const clientElement = event.target.closest('.client');
        if (clientElement) {
            const clientId = clientElement.dataset.id;
            const clientDetails = getClientDetailsById(clientId);
            showClientDetails(clientDetails);
        }
    });

    function getClientDetailsById(clientId) {
        // Utilisez une requête AJAX ou un autre moyen pour récupérer les détails du client depuis votre base de données
        // Par exemple, en utilisant fetch() ou en envoyant une requête XMLHttpRequest
        // Retournez les détails du client au format JSON
    }

    function showClientDetails(client) {
        clientDetailsElement.innerHTML = `
            <h2>Détails du Client</h2>
            <p>ID: ${client.id_client}</p>
            <p>Nom: ${client.nom_client}</p>
            <p>Prénom: ${client.prenom_client}</p>
            <p>Adresse: ${client.adresse_client}</p>
            <p>Telephone: ${client.tel_client}</p>
            <p>Date naissance: ${client.date_naissance_client}</p>
            <p>Conseiller: ${client.id_conseiller}</p>
        `;
    }

    function getClientDetailsById(clientId) {
        fetch('get_client_details.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ clientId: clientId }),
        })
        .then(response => response.json())
        .then(data => {
            showClientDetails(data);
        })
        .catch(error => console.error('Erreur :', error));
        console.log(clientId);
    }
});

