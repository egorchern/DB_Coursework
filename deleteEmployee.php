<?php 
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    $pdo->exec("USE kilburnazon");
    function deleteEmployee(){
        global $pdo;
        print_r($_POST);
        $sql = "
        DELETE FROM Employee
        WHERE Number = :number
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($_POST);
        
    }
    deleteEmployee();
?>
<h1>Employee Successfully deleted</h1>