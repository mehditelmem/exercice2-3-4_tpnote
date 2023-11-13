<?php
    include('config.php');
    class ClientManager{
        public static function getAllClients() {
            
            global $conn;
        
            $sql = "SELECT * FROM client";
            $result = $conn->query($sql);
        
            $clients = array();
        
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $clientDTO = new ClientDTO();
                    $clientDTO->id_client = $row["id_client"];
                    $clientDTO->nom_client = $row["nom_client"];
                    $clientDTO->prenom_client = $row["prenom_client"];
                    $clientDTO->adresse_client = $row["adresse_client"];
                    $clientDTO->tel_client = $row["tel_client"];
                    $clientDTO->date_naissance_client = $row["date_naissance_client"];
                    $clientDTO->id_conseiller = $row["id_conseiller"];
                    $clients[] = $clientDTO;
                }
            }
        
            $conn->close();
        
            return $clients;
        }

        public static function getClientDetailsById($clientId) {
            global $conn;
        
            $sql = "SELECT * FROM client WHERE id_client = $clientId";
            $result = $conn->query($sql);
        
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $clientDTO = new ClientDTO();
                $clientDTO->id_client = $row["id_client"];
                $clientDTO->nom_client = $row["nom_client"];
                $clientDTO->prenom_client = $row["prenom_client"];
                $clientDTO->adresse_client = $row["adresse_client"];
                $clientDTO->tel_client = $row["tel_client"];
                $clientDTO->date_naissance_client = $row["date_naissance_client"];
                $clientDTO->id_conseiller = $row["id_conseiller"];

                return $clientDTO;
            } else {
                return null;
            }
        }
        
}
?>