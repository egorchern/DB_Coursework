<?php
function formatEmployeeAsTable($stmt)
{
    
    echo ("
    <table class='employees_table table table-bordered table-hover'>
    <thead>
        <th>Num(id)</th>
        <th>Name</th>
        <th>Home Address</th>
        <th>£ Salary</th>
        <th>DOB</th>
        <th>NIN</th>
        <th>ManagerEmpNumber</th>
        <th>Department</th>
        <th>eName</th>
        <th>eRelationship</th>
        <th>ePhone</th>
        <th>Manager name</th>
    </thead>
    <tbody class='table-group-divider'>
    
    ");
    while ($data = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo ("<tr>");
        foreach ($data as $key => $val) {
            if ($key == "DepartmentNumber") {
                switch ($val) {
                    case 1:
                        $val = "HR";
                        break;
                    case 2:
                        $val = "Driver";
                        break;
                    case 3:
                        $val = "Packager";
                        break;
                    case 4:
                        $val = "Manager";
                        break;
                }
            }
            echo ("<td>" . $val . "</td>");
        }
        echo ("</tr>");
    }
    echo ("</tbody></table>");
}
?>