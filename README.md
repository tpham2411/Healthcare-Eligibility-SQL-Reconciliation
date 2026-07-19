# SQL small project
Project Overview

This project demonstrates how SQL can be used to validate healthcare eligibility data before it is used for reporting and dashboard development.
The scenario simulates two Medicaid eligibility datasets received from different reporting periods. The objective is to automatically identify:
* New members
* Removed members
* Updated member information
* Field-level differences between datasets
Rather than manually comparing thousands of records in Excel, SQL provides a scalable, repeatable approach to data validation and quality assurance.
Business Scenario

Imagine DHHS receives two eligibility extracts.
* Eligibility_Previous contains last month's data.
* Eligibility_Current contains this month's data.

Before reports are built, analysts must verify that the new extract is correct.
Sample Tables
Column	Description
MemberID	Unique member identifier
ProgramName	Medicaid Program
County	County
CoverageStatus	Active / Pending / Inactive
MonthlyBenefit	Monthly benefit amount
CaseWorkerID	Assigned caseworker
SQL Techniques Demonstrated
* FULL OUTER JOIN
* CASE statements
* CONCAT_WS
* NULL handling
* Data reconciliation
* Data quality validation

Business Value
This approach:
* reduces manual comparison
* scales to large datasets
* improves data quality
* creates an audit trail
* supports reliable reporting
