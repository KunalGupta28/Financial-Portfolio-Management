# Financial-Portfolio-Management
A comprehensive DBMS project for managing financial portfolios including assets, clients, advisors, transactions, and analytics using SQL
# 💼 Financial Portfolio Management System

This project is a full-featured SQL-based **Financial Portfolio Management System** built for tracking and analyzing clients' investments, advisor performance, asset ratings, and transactions.

## 📚 Tech Stack
- MySQL 8+
- SQL Procedures, Functions, Triggers, Cursors, Views

## 📂 Database Schema Overview
This project contains the following 10+ database tables:

- Clients
- Advisors
- Assets
- Portfolios
- Transactions
- AssetRatings
- AdvisorAssignments
- AssetPrices
- ClientFeedback
- AuditLogs (for logging via triggers)

## 🏗️ Features Implemented

### ➕ Tables
- 10+ relational tables with constraints and foreign keys

### 👁️ Views
- `AdvisorClientCount`: View to count clients assigned to each advisor.

### 🧮 Functions
- `GetAdvisorRating()`: Returns average feedback rating for a given advisor.

### ⚙️ Stored Procedures
- `AddAsset()`: Adds a new asset and logs it.
- `CalculateAllPortfolioValues()`: Uses a cursor to calculate each client’s total investment.

### 🔔 Triggers
- `trg_after_client_insert`: Logs new client entries.
- `trg_after_price_insert`: Logs new asset price entries.

### 📝 AuditLogs Table
Used to automatically log activities via triggers and procedures.

---

## 🔁 How to Run

1. Clone the repository:
   ```bash
   =https://github.com/KunalGupta28/Financial-Portfolio-Management.git
   cd Financial-Portfolio-Management-System
