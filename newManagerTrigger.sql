CREATE TRIGGER `new_manager` AFTER INSERT ON `employee`
 FOR EACH ROW IF NEW.departmentNumber = 4 THEN
    INSERT INTO manager
    VALUES(NEW.Number);
END IF