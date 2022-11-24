<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Root</title>
    <style>
        nav {
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
            padding: 0.7rem;
            background-color: hsla(0, 0%, 20%);
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 0.4rem;
            border-radius: 12px;
            transition: all 0.3s;
            margin: 0.2rem;
        }

        nav a:hover {
            color: white;
            background-color: hsla(0, 0%, 35%);
        }

        form {
            margin-left: auto;
            margin-right: auto;
            margin-top: 3rem;
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            flex-wrap: wrap;
            align-items: center;
            border: 1px solid hsl(0, 0%, 80%);
            padding: 2rem;
            border-radius: 12px;
            max-width: 750px;
        }
        main{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }
        .margin-sm {
            margin: 0.4rem;
        }
    </style>
</head>

<body>
    <nav>
        <a href="index.php">Home</a>
        <a href="employees.php">Employees</a>
    </nav>
    <main>
        <form action="addEmployee.php" class="shadow" method="POST">
            <h2 style="width:100%;text-align:center">Add Employee</h2>
            <div class="margin-sm">
                <label for="number" class="form-label">Number (id)</label>
                <input type="text" class="form-control" pattern="\d+-\d+" required id="number" name="number">
            </div>
            <div class="margin-sm">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" required id="name" name="name">
            </div>
            <div class="margin-sm">
                <label for="homeAddress" class="form-label">Address</label>
                <input type="text" class="form-control" required id="homeAddress" name="homeAddress">
            </div>
            <div class="margin-sm">
                <label for="salary" class="form-label">Salary </label>
                <input type="text" class="form-control" required   id="salary" name="salary">
            </div>
            <div class="margin-sm">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="date" class="form-control" required id="dob" name="dob">
            </div>
            <div class="margin-sm">
                <label for="nin" class="form-label">National Insurance Number </label>
                <input type="text" class="form-control" required id="nin" name="nin">
            </div>
            <div class="margin-sm">
                <label for="eName" class="form-label">Emergency Contact Name</label>
                <input type="text" class="form-control" required id="eName" name="eName">
            </div>
            <div class="margin-sm">
                <label for="eRelationship" class="form-label">Emergency Contact Relationship</label>
                <input type="text" class="form-control" required id="eRelationship" name="eRelationship">
            </div>
            <div class="margin-sm">
                <label for="ePhone" class="form-label">Emergency Contact Phone Number</label>
                <input type="number" class="form-control" min="0" required id="ePhone" name="ePhone">
            </div>
            <div class="margin-sm">
                <label for="departmentNumber" class="form-label">Department</label>
                
                <select class="form-select" id="departmentNumber" name="departmentNumber">
                    <option value="1">HR</option>
                    <option value="2">Driver</option>
                    <option value="3">Packager</option>
                    <option value="4">Manager</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        <form action="updateEmployee.php" class="shadow" method="POST">
            <h2 style="width:100%;text-align:center">Update employee</h2>
            <p style="width:100%;text-align:center">Blank fields will be unchanged</p>
            <div class="margin-sm">
                <label for="number" class="form-label">Number (id)</label>
                <input type="text" class="form-control" required id="number" name="number">
            </div>
            <div class="margin-sm">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control"  id="name" name="name">
            </div>
            <div class="margin-sm">
                <label for="homeAddress" class="form-label">Address</label>
                <input type="text" class="form-control"  id="homeAddress" name="homeAddress">
            </div>
            <div class="margin-sm">
                <label for="salary" class="form-label">Salary </label>
                <input type="text" class="form-control"    id="salary" name="salary">
            </div>
            <div class="margin-sm">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="date" class="form-control"  id="dob" name="dob">
            </div>
            <div class="margin-sm">
                <label for="nin" class="form-label">National Insurance Number </label>
                <input type="text" class="form-control"  id="nin" name="nin">
            </div>
            <div class="margin-sm">
                <label for="ManagerEmpNumber" class="form-label">Manager Number (id)</label>
                <input type="text" class="form-control"  id="ManagerEmpNumber" name="ManagerEmpNumber">
            </div>
            <div class="margin-sm">
                <label for="eName" class="form-label">Emergency Contact Name</label>
                <input type="text" class="form-control"  id="eName" name="eName">
            </div>
            <div class="margin-sm">
                <label for="eRelationship" class="form-label">Emergency Contact Relationship</label>
                <input type="text" class="form-control"  id="eRelationship" name="eRelationship">
            </div>
            <div class="margin-sm">
                <label for="ePhone" class="form-label">Emergency Contact Phone Number</label>
                <input type="text" class="form-control"  id="ePhone" name="ePhone">
            </div>
            <div class="margin-sm">
                <label for="departmentNumber" class="form-label">Department</label>
                
                <select class="form-select" id="departmentNumber" name="departmentNumber">
                    <option value="-1">Unchanged</option>
                    <option value="1">HR</option>
                    <option value="2">Driver</option>
                    <option value="3">Packager</option>
                    <option value="4">Manager</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <form action="searchEmployees.php" class="shadow" method="POST">
            <h2 style="width:100%;text-align:center">Search employees</h2>
            <p style="width:100%;text-align:center">Blank fields will be ignored when searching</p>
            <div class="margin-sm">
                <label for="number" class="form-label">Number (id)</label>
                <input type="text" class="form-control" id="number" name="number">
            </div>
            <div class="margin-sm">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control"  id="name" name="name">
            </div>
            <div class="margin-sm">
                <label for="homeAddress" class="form-label">Address</label>
                <input type="text" class="form-control"  id="homeAddress" name="homeAddress">
            </div>
            <div class="margin-sm">
                <label for="salary" class="form-label">Salary </label>
                <input type="text" class="form-control"    id="salary" name="salary">
            </div>
            <div class="margin-sm">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="date" class="form-control"  id="dob" name="dob">
            </div>
            <div class="margin-sm">
                <label for="nin" class="form-label">National Insurance Number </label>
                <input type="text" class="form-control"  id="nin" name="nin">
            </div>
            <div class="margin-sm">
                <label for="eName" class="form-label">Emergency Contact Name</label>
                <input type="text" class="form-control"  id="eName" name="eName">
            </div>
            <div class="margin-sm">
                <label for="eRelationship" class="form-label">Emergency Contact Relationship</label>
                <input type="text" class="form-control"  id="eRelationship" name="eRelationship">
            </div>
            <div class="margin-sm">
                <label for="ePhone" class="form-label">Emergency Contact Phone Number</label>
                <input type="text" class="form-control"  id="ePhone" name="ePhone">
            </div>
            <div class="margin-sm">
                <label for="departmentNumber" class="form-label">Department</label>
                
                <select class="form-select" id="departmentNumber" name="departmentNumber">
                    <option value="-1">Any</option>
                    <option value="1">HR</option>
                    <option value="2">Driver</option>
                    <option value="3">Packager</option>
                    <option value="4">Manager</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <form action="deleteEmployee.php" class="shadow" method="POST">
            <h2 style="width:100%;text-align:center">Delete Employee</h2>
            <div class="margin-sm">
                <label for="number" class="form-label">Number (id)</label>
                <input type="text" class="form-control" required id="number" name="number">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <form action="showBirthdayEmp.php" class="shadow" method="POST">
            <h2 style="width:100%;text-align:center">Show employees with birthdays soon</h2>
            <p style="width:100%;text-align:center">Shows employees that have birthday in the current month</p>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <form action="showTerminationAudit.php" class="shadow" method="POST">
            <h2 style="width:100%;text-align:center">Search termination audits</h2>
            <p style="width:100%;text-align:center">Blank fields will be ignored when searching</p>
            <div class="margin-sm">
                <label for="terminatedEmpNumber" class="form-label">Terminated employee number (id)</label>
                <input type="text" class="form-control" id="terminatedEmpNumber" name="terminatedEmpNumber">
            </div>
            <div class="margin-sm">
                <label for="dateTerminated" class="form-label">Date terminated</label>
                <input type="curDate" class="form-control"  id="dateTerminated" name="dateTerminated">
            </div>
            <div class="margin-sm">
                <label for="terminatingEmpNumber" class="form-label">Terminating employee number (id)</label>
                <input type="text" class="form-control" id="terminatingEmpNumber" name="terminatingEmpNumber">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </main>

</body>

</html>