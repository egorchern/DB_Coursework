<?php
$pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
// require_once('addEmployee.php');
function deleteDB()
{
    global $pdo;
    $sql = "DROP DATABASE IF EXISTS Kilburnazon;";
    $pdo->exec($sql);
}
function createDB()
{
    global $pdo;
    $sql = "CREATE DATABASE IF NOT EXISTS Kilburnazon; ";
    $pdo->exec($sql);
}
function createManagerTable()
{
    global $pdo;
    $sql = "
        CREATE TABLE IF NOT EXISTS Manager(
            EmployeeNumber INT NOT NULL,
            PRIMARY KEY(EmployeeNumber)
        );
        ";
    $pdo->exec($sql);
}
function createHRSpecialistTable()
{
    global $pdo;
    $sql = "
        CREATE TABLE IF NOT EXISTS HRSpecialist(
            EmployeeNumber INT NOT NULL,
            PRIMARY KEY(EmployeeNumber)
        );
        ";
    $pdo->exec($sql);
}
function createDriverTable()
{
    global $pdo;
    $sql = "
        CREATE TABLE IF NOT EXISTS Driver(
            EmployeeNumber INT NOT NULL,
            PRIMARY KEY(EmployeeNumber)
        );
        ";
    $pdo->exec($sql);
}
function createComplaintTable()
{
    global $pdo;
    $sql = "
        CREATE TABLE IF NOT EXISTS Complaint(
            Number INT NOT NULL,
            Date DATE NOT NULL,
            PassengerName VARCHAR(200) NOT NULL,
            HandlerEmployeeNumber INT NOT NULL,
            PRIMARY KEY(Number),
            FOREIGN KEY(HandlerEmployeeNumber) REFERENCES HRSpecialist(EmployeeNumber) ON DELETE RESTRICT ON UPDATE RESTRICT

        );
        ";
    $pdo->exec($sql);
}
function createComplaintReasonTable()
{
    global $pdo;
    $sql = "
        CREATE TABLE IF NOT EXISTS ComplaintReason(
            ComplaintNumber INT NOT NULL,
            Reason VARCHAR(2000) NOT NULL,
            PRIMARY KEY(ComplaintNumber),
            FOREIGN KEY (ComplaintNumber) REFERENCES Complaint(Number) ON DELETE CASCADE ON UPDATE CASCADE
        );
        ";
    $pdo->exec($sql);
}
function createEmployeeTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Employee(
                Number VARCHAR(20) NOT NULL,
                Name VARCHAR(500) NOT NULL,
                HomeAddress VARCHAR(1000) NOT NULL,
                Salary DOUBLE NOT NULL,
                DOB DATE NOT NULL,
                NIN VARCHAR(12) NOT NULL,
                ManagerEmpNumber INT,
                DepartmentNumber INT NOT NULL,
                EPhone VARCHAR(30) NOT NULL,
                ERelationship VARCHAR(100) NOT NULL,
                EName VARCHAR(200) NOT NULL,
                PRIMARY KEY(Number),
                FOREIGN KEY(ManagerEmpNumber) REFERENCES Manager(EmployeeNumber) ON DELETE RESTRICT ON UPDATE RESTRICT,
                FOREIGN KEY(DepartmentNumber) REFERENCES Department(DepartmentNumber) ON DELETE RESTRICT ON UPDATE RESTRICT
                
                
            );
        ";
    $pdo->exec($sql);
}

function createDepartmentTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Department(
                DepartmentNumber INT NOT NULL,
                Name VARCHAR(200) NOT NULL,
                ManagerEmployeeNumber INT,
                PRIMARY KEY(DepartmentNumber),
                FOREIGN KEY (ManagerEmployeeNumber) REFERENCES Manager(EmployeeNumber) ON DELETE RESTRICT ON UPDATE RESTRICT
                
                
            );
        ";
    $pdo->exec($sql);
}

function createHoursTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Hours(
                EmployeeNumber INT NOT NULL,
                WeekStartDate DATE NOT NULL,
                HoursWorked INT NOT NULL,
                PRIMARY KEY(EmployeeNumber, WeekStartDate),
                FOREIGN KEY(EmployeeNumber) REFERENCES Driver(EmployeeNumber) ON DELETE RESTRICT ON UPDATE RESTRICT
                
                
            );
        ";
    $pdo->exec($sql);
}
function createVehicleTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Vehicle(
                Id INT NOT NULL,
                Area VARCHAR(200) NOT NULL,
                Name VARCHAR (200) NOT NULL,
                PRIMARY KEY(Id)

                
            );
        ";
    $pdo->exec($sql);
}
function createRouteTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Route(
                Name VARCHAR(200) NOT NULL,
                StartingLocationAddress VARCHAR(1000) NOT NULL,
                EndLocationAddress VARCHAR(1000) NOT NULL,
                PRIMARY KEY(Name)

                
            );
        ";
    $pdo->exec($sql);
}
function createRouteStopTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS RouteStop(
                StopDateTime TIMESTAMP NOT NULL,
                RouteName VARCHAR(200) NOT NULL,
                Address VARCHAR(1000) NOT NULL,
                FOREIGN KEY(RouteName) REFERENCES Route(Name) ON DELETE RESTRICT ON UPDATE RESTRICT
                
            );
        ";
    $pdo->exec($sql);
}
function createDriverAssignmentTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS DriverAssignment(
                VehicleId INT NOT NULL,
                Date DATE NOT NULL,
                DriverEmployeeNumber INT NOT NULL,
                RouteName VARCHAR(200) NOT NULL,
                PRIMARY KEY(VehicleId, Date),
                FOREIGN KEY(DriverEmployeeNumber) REFERENCES Driver(EmployeeNumber)
                ON DELETE RESTRICT ON UPDATE RESTRICT,
                FOREIGN KEY(RouteName) REFERENCES Route(Name)
                ON DELETE RESTRICT ON UPDATE RESTRICT
                
            );
        ";
    $pdo->exec($sql);
}
function createBuildingTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Building(
                Id INT NOT NULL AUTO_INCREMENT,
                Address VARCHAR(1000) NOT NULL,
                BuildingType ENUM('Office', 'Warehouse') NOT NULL,
                Area VARCHAR(200) NOT NULL,
                PRIMARY KEY(Id)
                
            );
        ";
    $pdo->exec($sql);
}
function createWarehouseTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Warehouse(
                Id INT NOT NULL,
                Size BIGINT NOT NULL,
                Purpose ENUM('General') NOT NULL,
                BuildingId INT NOT NULL,
                PRIMARY KEY(Id),
                FOREIGN KEY(BuildingId) REFERENCES Building(Id)
                ON DELETE RESTRICT ON UPDATE RESTRICT
                
            );
        ";
    $pdo->exec($sql);
}
function createCustomerTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Customer(
                Id INT NOT NULL AUTO_INCREMENT,
                EmailAddress VARCHAR(500) NOT NULL,
                Name VARCHAR(200) NOT NULL,
                PostalAddress VARCHAR(1000) NOT NULL,
                PRIMARY KEY(Id)
                
            );
        ";
    $pdo->exec($sql);
}
function createOrderTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Orderr(
                Id INT NOT NULL AUTO_INCREMENT,
                Date DATE NOT NULL,
                CustomerId INT NOT NULL,
                PRIMARY KEY(Id),
                FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
                ON DELETE RESTRICT ON UPDATE RESTRICT
                
            );
        ";
    $pdo->exec($sql);
}
function createOrderProductsTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS OrderProducts(
                ProductId INT NOT NULL,
                OrderId INT NOT NULL,
                Quantity INT NOT NULL,
                PRIMARY KEY(ProductId, OrderId),
                FOREIGN KEY(ProductId) REFERENCES Product(Id)
                ON DELETE RESTRICT ON UPDATE RESTRICT,
                FOREIGN KEY(OrderId) REFERENCES Orderr(Id)
                ON DELETE CASCADE ON UPDATE CASCADE
                
            );
        ";
    $pdo->exec($sql);
}
function createProductTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Product(
                Id INT NOT NULL,
                Name VARCHAR(500) NOT NULL,
                Description TEXT NOT NULL,
                PRIMARY KEY(Id)
                
            );
        ";
    $pdo->exec($sql);
}
function createWarehouseProduct()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS Product(
                ProductId INT NOT NULL,
                WarehouseId INT NOT NULL,
                Quantity BIGINT NOT NULL,
                PRIMARY KEY(WarehouseId, ProductId),
                FOREIGN KEY (ProductId) REFERENCES Product(Id)
                ON DELETE RESTRICT ON UPDATE CASCADE,
                FOREIGN KEY (WarehouseId) REFERENCES Warehouse(Id)
                ON DELETE CASCADE ON UPDATE CASCADE
                
            );
        ";
    $pdo->exec($sql);
}
function insertDepartment($department){
    global $pdo;
    $sql = "
    INSERT INTO Department(departmentNumber, name)
    VALUES(:departmentNumber, :name)
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute($department);
}
function insertDepartments(){
    global $pdo;
    $departments = [
        [
            "departmentNumber" => 1,
            "name" => "HR"
        ],
        [
            "departmentNumber" => 2,
            "name" => "Driving"
        ],
        [
            "departmentNumber" => 3,
            "name" => "Packaging"
        ],
        [
            "departmentNumber" => 4,
            "name" => "Managment"
        ],
    ];
    foreach($departments as $department){
        insertDepartment($department);
    }
    
}
function addEmployee($params){
    global $pdo;
    // $params["number"] = substr($params["number"], 0, 2) . substr($params["number"], 3);
    $params["salary"] = preg_replace("/[^\d\.]/", "", $params["salary"]);
    $params["dob"] = date("Y-m-d", strtotime(str_replace('/', '-', $params["dob"])));
    $sql = "
    INSERT INTO employee(Number, Name, HomeAddress, Salary, DOB, NIN, DepartmentNumber, EName, ERelationship, EPhone)
    VALUES(:number, :name, :homeAddress, :salary, :dob, :nin, :departmentNumber, :eName, :eRelationship, :ePhone);
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    
}
function insertEmployeeCSV(){
    
    $csvFile = file('employees.csv');
    $data = [];
    $skip = true;
    foreach ($csvFile as $line) {
        if($skip){
            $skip = false;
            continue;
        }
        $data = str_getcsv($line);
        $departmentNumber = 1;
        switch($data[6]){
            case ("HR"):
                $departmentNumber = 1;
                break;
            case ("Packager"):
                $departmentNumber = 3;
                break;
            case ("Driver"):
                $departmentNumber = 2;
                break;
            case ("Manager"):
                $departmentNumber = 4;
                break;
        }
        

        
        $params = [
            "number" => $data[0],
            "name" => $data[1],
            "homeAddress" => $data[2],
            "salary" => $data[3],
            "dob" => $data[4],
            "nin" => $data[5],
            "departmentNumber" => $departmentNumber,
            "eName" => $data[7],
            "eRelationship" => $data[8],
            "ePhone" => $data[9]
        ];
        addEmployee($params);
    }
    
    
}
deleteDB();
createDB();
$pdo->exec("USE Kilburnazon");
createManagerTable();
createDriverTable();
createHRSpecialistTable();
createDepartmentTable();
createEmployeeTable();
createComplaintTable();
createComplaintReasonTable();

createHoursTable();
createVehicleTable();
createRouteTable();
createRouteStopTable();
createDriverAssignmentTable();
createBuildingTable();
createWarehouseTable();
createCustomerTable();
createOrderTable();
createProductTable();
createOrderProductsTable();
createWarehouseProduct();
insertDepartments();
insertEmployeeCSV();
?>