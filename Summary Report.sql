-- 04_Summary_Report.sql
-- Produces summary metrics for the reconciliation.

WITH Reconciliation AS (
    SELECT
        COALESCE(p.MemberID, c.MemberID) AS MemberID,
        CASE
            WHEN p.MemberID IS NULL THEN 'New Record'
            WHEN c.MemberID IS NULL THEN 'Removed Record'
            WHEN
                ISNULL(p.ProgramName, '') <> ISNULL(c.ProgramName, '')
                OR ISNULL(p.County, '') <> ISNULL(c.County, '')
                OR ISNULL(p.CoverageStatus, '') <> ISNULL(c.CoverageStatus, '')
                OR ISNULL(p.MonthlyBenefit, -1) <> ISNULL(c.MonthlyBenefit, -1)
                OR ISNULL(p.CaseWorkerID, '') <> ISNULL(c.CaseWorkerID, '')
            THEN 'Changed Record'
            ELSE 'Unchanged Record'
        END AS DifferenceType
    FROM dbo.Eligibility_Previous p
    FULL OUTER JOIN dbo.Eligibility_Current c
        ON p.MemberID = c.MemberID
)
SELECT
    DifferenceType,
    COUNT(*) AS RecordCount
FROM Reconciliation
GROUP BY DifferenceType
ORDER BY DifferenceType;
