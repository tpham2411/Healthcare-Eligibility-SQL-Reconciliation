-- Verify row counts after import:

SELECT 'Eligibility_Previous' AS TableName, COUNT(*) AS RecordCount
FROM dbo.Eligibility_Previous
UNION ALL
SELECT 'Eligibility_Current', COUNT(*) AS RecordCount
FROM dbo.Eligibility_Current;
