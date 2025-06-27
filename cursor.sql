-- Cursor: Calculate total portfolio value for all clients
-- -----------------------------
DELIMITER //
CREATE PROCEDURE CalculateAllPortfolioValues()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cID INT;
    DECLARE cName VARCHAR(100);
    DECLARE totalVal DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT ClientID, Name FROM Clients;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO cID, cName;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT SUM(Quantity * PurchasePrice) INTO totalVal
        FROM Portfolios WHERE ClientID = cID;

        INSERT INTO AuditLogs (LogMessage)
        VALUES (CONCAT('Client ', cName, ' has total investment: ', IFNULL(totalVal, 0)));
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
