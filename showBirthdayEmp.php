<?php 
$pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
$pdo->exec("USE kilburnazon");
include('searchEmployees.php');
function showEmployeesWithBirthdaySoon(){
    global $pdo;
    $sql = "
    CALL getEmployeesWithBirthdayM();
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    formatEmployeeAsTable($stmt);

}
showEmployeesWithBirthdaySoon();
?>