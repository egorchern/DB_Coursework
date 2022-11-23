<?php
function formatEmployeeAsTable($stmt)
{
    
    echo ("
    <table class='employees_table table table-bordered table-hover'>
    <thead>
        <th>Terminated Employee Number (id)</th>
        <th>Terminating Employee Number (id)</th>
        <th>Date terminated</th>
        <th>Time terminated</th>
    </thead>
    <tbody class='table-group-divider'>
    
    ");
    while ($data = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo ("<tr>");
        foreach ($data as $key => $val) {
            
            echo ("<td>" . $val . "</td>");
        }
        echo ("</tr>");
    }
    echo ("</tbody></table>");
}
?>