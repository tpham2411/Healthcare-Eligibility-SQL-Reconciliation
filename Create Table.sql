-- 01_Create_Tables.sql
-- SQL Server version

IF OBJECT_ID('dbo.Eligibility_Previous', 'U') IS NOT NULL
    DROP TABLE dbo.Eligibility_Previous;

IF OBJECT_ID('dbo.Eligibility_Current', 'U') IS NOT NULL
    DROP TABLE dbo.Eligibility_Current;

CREATE TABLE dbo.Eligibility_Previous (
    MemberID INT NOT NULL PRIMARY KEY,
    ProgramName VARCHAR(30) NOT NULL,
    County VARCHAR(50) NOT NULL,
    CoverageStatus VARCHAR(20) NOT NULL,
    MonthlyBenefit DECIMAL(10,2) NOT NULL,
    CaseWorkerID VARCHAR(10) NOT NULL
);

CREATE TABLE dbo.Eligibility_Current (
    MemberID INT NOT NULL PRIMARY KEY,
    ProgramName VARCHAR(30) NOT NULL,
    County VARCHAR(50) NOT NULL,
    CoverageStatus VARCHAR(20) NOT NULL,
    MonthlyBenefit DECIMAL(10,2) NOT NULL,
    CaseWorkerID VARCHAR(10) NOT NULL
);
