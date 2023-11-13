<?php
    include('config.php');
    class LigneCompteManager{
        public static function getAllConseillers() {
            
            global $conn;
        
            $sql = "SELECT * FROM lignecompte";
            $result = $conn->query($sql);
        
            $lignecomptes = array();
        
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $lignecompteDTO = new LigneCompteDTO();
                    $lignecompteDTO->id_lignecompte = $row["Id_ligneCompte"];
                    $lignecompteDTO->dateouv_lignecompte = $row["dateOuv_ligneCompte"];
                    $lignecompteDTO->solde_lignecompte = $row["solde_ligneCompte"];
                    $lignecompteDTO->id_compte = $row["id_compte"];
                    $lignecomptes[] = $LigneCompteDTO;
                }
            }
        
            $conn->close();
        
            return $lignecomptes;
        }
}
?>