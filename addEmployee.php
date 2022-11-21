<?php 
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    $pdo->exec("USE kilburnazon");
    function addEmployee(){
        global $pdo;
        foreach ($_POST as $key => $val){
            echo "Key is: ".$key.", "."Value is: ".$val;
            echo "<br>";
        }
        $sql = "
        INSERT INTO employee(Number, Name, HomeAddress, Salary, DOB, NIN, DepartmentNumber)
        VALUES(:Number, :Name, :HomeAddress, :Salary, :DOB, :NIN, :departmentNumber);
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            "Number" => $_POST["id"],
            "Name" => $_POST["name"],
            "HomeAddress" => $_POST["address"],
            "Salary" => $_POST["salary"],
            "DOB" => $_POST["dob"],
            "NIN" => $_POST["nin"],
            "departmentNumber" => $_POST["departmentNumber"]
        ]);
        
    }
    addEmployee();
?>