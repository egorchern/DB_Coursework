<?php
$pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
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
                Number INT NOT NULL,
                Name VARCHAR(500) NOT NULL,
                HomeAddress VARCHAR(1000) NOT NULL,
                Salary INT NOT NULL,
                DOB DATE NOT NULL,
                NIN VARCHAR(12) NOT NULL,
                ManagerEmpNumber INT,
                DepartmentNumber INT NOT NULL,
                PRIMARY KEY(Number),
                FOREIGN KEY(ManagerEmpNumber) REFERENCES Manager(EmployeeNumber) ON DELETE RESTRICT ON UPDATE RESTRICT
                
                
            );
        ";
    $pdo->exec($sql);
}
function createEmergencyContactNameTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS EmergencyContactName(
                PhoneNumber VARCHAR(30) NOT NULL,
                Name VARCHAR(200) NOT NULL,
                PRIMARY KEY(PhoneNumber)
                
                
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
                ManagerEmployeeNumber INT NOT NULL,
                PRIMARY KEY(DepartmentNumber),
                FOREIGN KEY (ManagerEmployeeNumber) REFERENCES Manager(EmployeeNumber) ON DELETE RESTRICT ON UPDATE RESTRICT
                
                
            );
        ";
    $pdo->exec($sql);
}
function createEmergencyContactTable()
{
    global $pdo;
    $sql = "
            CREATE TABLE IF NOT EXISTS EmergencyContact(
                EmployeeNumber INT NOT NULL,
                Relationship VARCHAR(100) NOT NULL,
                PhoneNumber VARCHAR(30) NOT NULL,
                PRIMARY KEY(EmployeeNumber),
                FOREIGN KEY(EmployeeNumber) REFERENCES Employee(Number) ON DELETE CASCADE ON UPDATE CASCADE,
                FOREIGN KEY(PhoneNumber) REFERENCES EmergencyContactName(PhoneNumber) ON DELETE CASCADE ON UPDATE CASCADE
                
                
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
deleteDB();
createDB();
$pdo->exec("USE Kilburnazon");
createManagerTable();
createDriverTable();
createHRSpecialistTable();
createEmployeeTable();
createComplaintTable();
createComplaintReasonTable();
createEmergencyContactNameTable();
createEmergencyContactTable();
createDepartmentTable();
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
?>