<?php
    include('config.php');
    class CompteManager{
        public static function getAllComptes() {
            
            global $conn;
        
            $sql = "SELECT * FROM compte";
            $result = $conn->query($sql);
        
            $comptes = array();
        
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $compteDTO = new CompteDTO();
                    $compteDTO->id_compte = $row["id_compte"];
                    $compteDTO->type_compte = $row["type_compte"];
                    $compteDTO->id_client = $row["id_client"];
                    $compteDTO->id_agence = $row["id_agence"];
                    $comptes[] = $compteDTO;
                }
            }
        
            $conn->close();
        
            return $comptes;
        }
}
?>