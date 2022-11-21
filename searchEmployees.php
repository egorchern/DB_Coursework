<?php 
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    $pdo->exec("USE kilburnazon");
    function updateEmployee(){
        global $pdo;
        
        $sql = "
        SELECT * FROM Employee   
        ";
        $params = [];
        // Only consider non empty keys
        foreach ($_POST as $key => $val){
            if ($val != ""){
                if ($key == "departmentNumber" && $val == -1){
                    continue;
                }
                if (count($params) == 0){
                    $sql = $sql . " WHERE ";
                }
                $sql = $sql ." ".$key." = ".":".$key."val".", ";
                $params[$key."val"] = $val;
            }
            
            
        }
        $sql = substr($sql, 0, strlen($sql) - 2);
        print_r($params);
        echo $sql;
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        while($data = $stmt->fetch(PDO::FETCH_ASSOC)){
            print_r($data);
        }
    }
    updateEmployee();
?>