<?php 
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    $pdo->exec("USE kilburnazon");
    function formatEmployeeAsTable($stmt){
        echo("
        <table class='employees_table table table-bordered table-hover'>
        <thead>
            <th>Num</th>
            <th>Name</th>
            <th>Home Address</th>
            <th>Salary</th>
            <th>DOB</th>
            <th>NIN</th>
            <th>ManagerEmpNumber</th>
            <th>Department</th>
            <th>eName</th>
            <th>eRelationship</th>
            <th>ePhone</th>
        </thead>
        <tbody class='table-group-divider'>
        
        ");
        while($data = $stmt->fetch(PDO::FETCH_ASSOC)){
            echo("<tr>");
            foreach ($data as $key => $val){
                if($key == "DepartmentNumber"){
                    switch($val){
                        case 1:
                            $val = "HR";
                            break;
                        case 2:
                            $val = "Driving";
                            break;
                        case 3:
                            $val = "Packaging";
                            break;
                        case 4: 
                            $val = "Managment";
                            break;
                    }
                }
                echo("<td>".$val."</td>");
            }
            echo("</tr>");
        }
        echo("</tbody></table>");
    }
    function searchEmployee(){
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
    <h1 style="text-align:center">Matching employees</h1>
    <?php
        searchEmployee();
    ?>
</body>
</html>
