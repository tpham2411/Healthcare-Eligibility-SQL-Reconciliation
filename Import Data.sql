-- 02_Import_Data_Instructions.sql
-- Import the two CSV files into SQL Server Management Studio:
--   data/Eligibility_Previous.csv
--   data/Eligibility_Current.csv
--
-- Recommended method:
-- 1. Right-click the database.
-- 2. Select Tasks > Import Flat File.
-- 3. Import Eligibility_Previous.csv into dbo.Eligibility_Previous.
-- 4. Import Eligibility_Current.csv into dbo.Eligibility_Current.
-- 5. Confirm MemberID is INT and MonthlyBenefit is DECIMAL(10,2).
--
-- Verify row counts after import:

SELECT 'Eligibility_Previous' AS TableName, COUNT(*) AS RowCount
FROM dbo.Eligibility_Previous
UNION ALL
SELECT 'Eligibility_Current', COUNT(*)
FROM dbo.Eligibility_Current;
