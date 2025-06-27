-- -----------------------------
-- Financial Portfolio Management System - Schema
-- -----------------------------

CREATE DATABASE IF NOT EXISTS FinancialPortfolioDB;
USE FinancialPortfolioDB;

-- Clients Table
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    RegisteredDate DATE
);

-- Advisors Table
CREATE TABLE Advisors (
    AdvisorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(100)
);

-- Assets Table
CREATE TABLE Assets (
    AssetID INT PRIMARY KEY AUTO_INCREMENT,
    AssetName VARCHAR(100),
    AssetType VARCHAR(50),
    RiskLevel VARCHAR(20)
);

-- Portfolios Table
CREATE TABLE Portfolios (
    PortfolioID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    AssetID INT,
    Quantity DECIMAL(10,2),
    PurchasePrice DECIMAL(10,2),
    PurchaseDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID)
);

-- Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    PortfolioID INT,
    TransactionType VARCHAR(10),
    Quantity DECIMAL(10,2),
    TransactionPrice DECIMAL(10,2),
    TransactionDate DATE,
    FOREIGN KEY (PortfolioID) REFERENCES Portfolios(PortfolioID)
);

-- AssetRatings Table
CREATE TABLE AssetRatings (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    AssetID INT,
    RatingAgency VARCHAR(100),
    Rating VARCHAR(10),
    RatingDate DATE,
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID)
);

-- AdvisorAssignments Table
CREATE TABLE AdvisorAssignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    AdvisorID INT,
    StartDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (AdvisorID) REFERENCES Advisors(AdvisorID)
);

-- AssetPrices Table
CREATE TABLE AssetPrices (
    PriceID INT PRIMARY KEY AUTO_INCREMENT,
    AssetID INT,
    Price DECIMAL(10,2),
    PriceDate DATE,
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID)
);

-- ClientFeedback Table
CREATE TABLE ClientFeedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    AdvisorID INT,
    Rating INT,
    Comments TEXT,
    FeedbackDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (AdvisorID) REFERENCES Advisors(AdvisorID)
);

-- AuditLogs Table
CREATE TABLE AuditLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    LogMessage TEXT,
    LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
