<?php 
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    $pdo->exec("USE kilburnazon");
    function updateEmployee(){
        global $pdo;
        
        $sql = "
        UPDATE Employee
        SET 
        ";
        $params = [];
        // Only consider non empty keys
        foreach ($_POST as $key => $val){
            if ($val != "" && $key != "number"){
                if ($key == "departmentNumber" && $val == -1){
                    continue;
                }
                $sql = $sql ." ".$key." = ".":".$key."val".", ";
                $params[$key."val"] = $val;
            }
            
            
        }
        $sql = substr($sql, 0, strlen($sql) - 2);
        $sql = $sql . " ";
        $params["number"] = $_POST["number"];
        print_r($params);
        $sql = $sql . "WHERE number = :number;";
        
        echo $sql;
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        
    }
    updateEmployee();
?>