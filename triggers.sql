-- -----------------------------
-- Trigger: Log new client
-- -----------------------------
DELIMITER //
CREATE TRIGGER trg_after_client_insert
AFTER INSERT ON Clients
FOR EACH ROW
BEGIN
    INSERT INTO AuditLogs (LogMessage)
    VALUES (CONCAT('New client added: ', NEW.Name));
END //
DELIMITER ;

-- -----------------------------
-- Trigger: Track price change
-- -----------------------------
DELIMITER //
CREATE TRIGGER trg_after_price_insert
AFTER INSERT ON AssetPrices
FOR EACH ROW
BEGIN
    INSERT INTO AuditLogs (LogMessage)
    VALUES (CONCAT('Price added for asset ID ', NEW.AssetID, ' at ', NEW.Price));
END //
DELIMITER ;
