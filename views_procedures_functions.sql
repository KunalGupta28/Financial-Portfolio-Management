-- -----------------------------
-- Views
-- -----------------------------
CREATE VIEW AdvisorClientCount AS
SELECT A.AdvisorID, A.Name AS AdvisorName, COUNT(AA.ClientID) AS TotalClients
FROM Advisors A
JOIN AdvisorAssignments AA ON A.AdvisorID = AA.AdvisorID
GROUP BY A.AdvisorID, A.Name;

-- -----------------------------
-- Stored Procedure: Add Asset
-- -----------------------------
DELIMITER //
CREATE PROCEDURE AddAsset(
    IN name VARCHAR(100),
    IN type VARCHAR(50),
    IN risk VARCHAR(20)
)
BEGIN
    INSERT INTO Assets (AssetName, AssetType, RiskLevel)
    VALUES (name, type, risk);

    INSERT INTO AuditLogs (LogMessage) 
    VALUES (CONCAT('New asset added: ', name));
END //
DELIMITER ;

-- -----------------------------
-- Stored Procedure: Calculate All Portfolio Values (with Cursor)
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

-- -----------------------------
-- Function: Get Average Feedback for Advisor
-- -----------------------------
DELIMITER //
CREATE FUNCTION GetAdvisorRating(advisorID INT)
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE avgRating DECIMAL(3,2);
    SELECT AVG(Rating) INTO avgRating FROM ClientFeedback WHERE AdvisorID = advisorID;
    RETURN avgRating;
END //
DELIMITER ;
