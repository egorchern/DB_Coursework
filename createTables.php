<?php
    $pdo = new pdo('mysql:host=localhost', 'root', '123qweasdzxc');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    function deleteDB(){
        global $pdo;
        $sql = "DROP DATABASE IF EXISTS Kilburnazon;";
        $pdo->exec($sql);
    }
    function createDB(){
        global $pdo;
        $sql = "CREATE DATABASE IF NOT EXISTS Kilburnazon; ";
        $pdo->exec($sql);
    }
    function createManagerTable(){
        global $pdo;
        $sql = "
        CREATE TABLE IF NOT EXISTS Manager(
            EmployeeNumber INT NOT NULL,
            PRIMARY KEY(EmployeeNumber)
        );
        ";
        $pdo->exec($sql);
    }
    function createEmployeeTable(){
        global $pdo;
        $sql = "
            CREATE TABLE IF NOT EXISTS Employee(
                Number INT NOT NULL,
                Name VARCHAR(500) NOT NULL,
                HomeAddress VARCHAR(1000) NOT NULL,
                Salary INT NOT NULL,
                DOB DATE NOT NULL,
                NIN VARCHAR(12) NOT NULL,
                ManagerEmpNumber INT NOT NULL,
                DepartmentNumber INT NOT NULL,
                PRIMARY KEY(Number),
                FOREIGN KEY(ManagerEmpNumber) REFERENCES Manager(EmployeeNumber) ON DELETE RESTRICT ON UPDATE RESTRICT
                
                
            );
        ";
        $pdo->exec($sql);
    }
    deleteDB();
    createDB();
    $pdo->exec("USE Kilburnazon");
    createManagerTable();
    createEmployeeTable();
    
?>