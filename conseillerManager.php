<?php
    include('config.php');
    class ConseillerManager{
        public static function getAllConseillers() {
            
            global $conn;
        
            $sql = "SELECT * FROM conseiller";
            $result = $conn->query($sql);
        
            $conseillers = array();
        
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $conseillerDTO = new ConseillerDTO();
                    $conseillerDTO->id_conseiller = $row["Id_conseiller"];
                    $conseillerDTO->nom_conseiller = $row["Nom_conseiller"];
                    $conseillerDTO->prenom_conseiller = $row["Prenom_conseiller"];
                    $conseillers[] = $compteDTO;
                }
            }
        
            $conn->close();
        
            return $conseillers;
        }
}
?>