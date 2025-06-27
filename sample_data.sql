-- Sample Clients
INSERT INTO Clients (Name, Email, Phone, RegisteredDate) VALUES
('Alice', 'alice@example.com', '1234567890', '2024-01-01'),
('Bob', 'bob@example.com', '9876543210', '2024-02-01');

-- Sample Advisors
INSERT INTO Advisors (Name, Email, Phone, Specialization) VALUES
('Dr. Smith', 'smith@advisor.com', '9999999999', 'Equity'),
('Dr. Jane', 'jane@advisor.com', '8888888888', 'Mutual Funds');

-- Sample Assets
INSERT INTO Assets (AssetName, AssetType, RiskLevel) VALUES
('Tata Shares', 'Equity', 'High'),
('HDFC Bonds', 'Debt', 'Low');
