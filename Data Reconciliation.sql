-- 03_Data_Reconciliation.sql
-- Compares the prior and current eligibility snapshots.

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
        END AS DifferenceType,

        p.ProgramName AS PreviousProgramName,
        c.ProgramName AS CurrentProgramName,
        p.County AS PreviousCounty,
        c.County AS CurrentCounty,
        p.CoverageStatus AS PreviousCoverageStatus,
        c.CoverageStatus AS CurrentCoverageStatus,
        p.MonthlyBenefit AS PreviousMonthlyBenefit,
        c.MonthlyBenefit AS CurrentMonthlyBenefit,
        p.CaseWorkerID AS PreviousCaseWorkerID,
        c.CaseWorkerID AS CurrentCaseWorkerID,

        CONCAT_WS(', ',
            CASE WHEN ISNULL(p.ProgramName, '') <> ISNULL(c.ProgramName, '')
                 THEN 'ProgramName' END,
            CASE WHEN ISNULL(p.County, '') <> ISNULL(c.County, '')
                 THEN 'County' END,
            CASE WHEN ISNULL(p.CoverageStatus, '') <> ISNULL(c.CoverageStatus, '')
                 THEN 'CoverageStatus' END,
            CASE WHEN ISNULL(p.MonthlyBenefit, -1) <> ISNULL(c.MonthlyBenefit, -1)
                 THEN 'MonthlyBenefit' END,
            CASE WHEN ISNULL(p.CaseWorkerID, '') <> ISNULL(c.CaseWorkerID, '')
                 THEN 'CaseWorkerID' END
        ) AS ChangedColumns
    FROM dbo.Eligibility_Previous p
    FULL OUTER JOIN dbo.Eligibility_Current c
        ON p.MemberID = c.MemberID
)
SELECT *
FROM Reconciliation
WHERE DifferenceType <> 'Unchanged Record'
ORDER BY
    CASE DifferenceType
        WHEN 'New Record' THEN 1
        WHEN 'Removed Record' THEN 2
        WHEN 'Changed Record' THEN 3
        ELSE 4
    END,
    MemberID;
