DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee`(IN empNumber VARCHAR(20))
BEGIN
	DECLARE mEmpNum VARCHAR(20);
    SELECT ManagerEmpNumber INTO mEmpNum FROM employee WHERE Number = empNumber LIMIT 1;
    IF mEmpNum IS NOT NULL THEN
    	DELETE FROM employee WHERE Number = empNumber LIMIT 1;
    END IF;
END$$
DELIMITER ;