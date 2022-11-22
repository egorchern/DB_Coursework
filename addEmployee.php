<?php 
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    $pdo->exec("USE kilburnazon");
    function addEmployee($params){
        global $pdo;
        $sql = "
        INSERT INTO employee(Number, Name, HomeAddress, Salary, DOB, NIN, DepartmentNumber, EName, ERelationship, EPhone)
        VALUES(:number, :name, :homeAddress, :salary, :dob, :nin, :departmentNumber, :eName, :eRelationship, :ePhone);
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        
    }
    addEmployee($_POST);
?>