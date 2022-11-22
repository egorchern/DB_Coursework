CREATE TRIGGER `insert_termination_audit` BEFORE DELETE ON `employee`
 FOR EACH ROW INSERT INTO terminationaudit
VALUES(CURRENT_DATE, CURRENT_TIME, OLD.Number, OLD.ManagerEmpNumber)