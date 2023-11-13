<?php
    include('config.php');
    class AgenceManager{
        public static function getAllAgences() {
            
            global $conn;
        
            $sql = "SELECT * FROM agence";
            $result = $conn->query($sql);
        
            $agences = array();
        
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $agenceDTO = new AgenceDTO();
                    $agenceDTO->id_agence = $row["Id_agence"];
                    $agenceDTO->nom_agence = $row["Nom_agence"];
                    $agenceDTO->adresse_agence = $row["Adresse_agence"];
                    $agenceDTO->tel_agence = $row["Tel_agence"];
                    $agences[] = $agenceDTO;
                }
            }
        
            $conn->close();
        
            return $agences;
        }        
}
?>