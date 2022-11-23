<?php 
$pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
$pdo->exec("USE kilburnazon");
include("formatAuditsAsTable.php");
function searchAudits(){
    global $pdo;
    
    $sql = "
    SELECT * FROM terminationaudit
    ";
    $params = [];
    // Only consider non empty keys
    foreach ($_POST as $key => $val){
        if ($val != ""){
            if (count($params) == 0){
                $sql = $sql . " WHERE ";
            }
            
            if (count($params) > 0){
                $sql = $sql ." AND ".$key." = ".":".$key."val  " ;
            }
            else{
                $sql = $sql ." ".$key." = ".":".$key."val  " ;
            }
            $params[$key."val"] = $val;
        }
        
        //TODO servside verification for input
    }
    // $sql = substr($sql, 0, strlen($sql) - 2);
    $sql = $sql." ORDER BY dateTerminated ";
    echo $sql;
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    formatEmployeeAsTable($stmt);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Employee list</title>
</head>
<body>
    <h1 style="text-align:center">Matching termination audits</h1>
    <?php
        
        searchAudits();
        
        
    ?>
</body>
</html>
