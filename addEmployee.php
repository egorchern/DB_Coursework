<?php 
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    $pdo->exec("USE kilburnazon");
    function addEmployee($params){
        global $pdo;
        # Check for empty strings
        foreach ($params as $key => $val){
            if ($val ==""){
                return;
            }
            // Ensure id format
            if ($key == "number"){
                if (preg_match("/\d+-\d+/", $val) == 0){
                    return;
                }
            }
        }
        # Convert parameters to standard format
        $params["salary"] = preg_replace("/[^\d\.]/", "", $params["salary"]);
        $params["dob"] = date("Y-m-d", strtotime(str_replace('/', '-', $params["dob"])));
        $sql = "
        INSERT INTO employee(Number, Name, HomeAddress, Salary, DOB, NIN, DepartmentNumber, EName, ERelationship, EPhone)
        VALUES(:number, :name, :homeAddress, :salary, :dob, :nin, :departmentNumber, :eName, :eRelationship, :ePhone);
        ";
        
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        // Assign random manager
        $sql = "UPDATE employee SET ManagerEmpNumber = (SELECT EmployeeNumber FROM manager ORDER BY RAND() LIMIT 1); WHERE Number = :number ";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(["number" => $params["number"]]);
    }
    addEmployee($_POST);
    echo("<h1> Employee added successfully!</h2>");
?>