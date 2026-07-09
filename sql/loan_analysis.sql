-- ======================================================
-- BANK LOAN DEFAULT RISK ANALYSIS
-- SQL ANALYSIS QUERIES
-- ======================================================

-- Legend:
-- Loan_Status:
-- Y = Loan Approved
-- N = Loan Rejected

-- Credit_History:
-- 1 = Good Credit History
-- 0 = Poor Credit History


-- ==========================================
-- 1. Total Loan Applications
-- ==========================================

-- Business Question:
-- How many loan applications has the bank received?
--
-- Business Insight:
-- Calculates the total number of loan applications available for analysis.
--
-- Business Implication:
-- Helps understand the size of the loan portfolio and serves as a baseline
-- for all subsequent analyses.

SELECT COUNT(*) AS Total_Applications
FROM bank_loan_analysis.loan_data;

-- ==========================================
-- 2. Loan Approval Distribution
-- ==========================================

-- Business Question:
-- What proportion of loan applications were approved versus rejected?
--
-- Business Insight:
-- Compares the number of approved and rejected loan applications.
--
-- Business Implication:
-- Helps evaluate the bank's approval rate and lending strategy.

SELECT
    Loan_Status,
    COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Loan_Status;

-- ==========================================
-- 3. Loan Approval Percentage
-- ==========================================

-- Business Question:
-- What percentage of loan applications are approved and rejected?
--
-- Business Insight:
-- Shows the percentage share of approved and rejected loans.
--
-- Business Implication:
-- Helps management monitor approval performance and identify changes in
-- lending patterns over time.

SELECT
    Loan_Status,
    COUNT(*) AS Applications,
    ROUND(COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM bank_loan_analysis.loan_data),2) AS Percentage
FROM bank_loan_analysis.loan_data
GROUP BY Loan_Status;

-- ==========================================
-- 4. Average Loan Amount
-- ==========================================

-- Business Question:
-- What is the average loan amount requested?

-- Business Insight:
-- Calculates the average loan amount across all applications.

-- Business Implication:
-- Helps estimate the average lending exposure per customer.

SELECT
ROUND(AVG(LoanAmount),2) AS Average_Loan_Amount
FROM bank_loan_analysis.loan_data;

-- ==========================================
-- 5. Average Applicant Income
-- ==========================================

-- Business Question:
-- What is the average income of loan applicants?

-- Business Insight:
-- Measures the average applicant income.

-- Business Implication:
-- Helps understand the financial profile of applicants.

SELECT
ROUND(AVG(ApplicantIncome),2) AS Average_Income
FROM bank_loan_analysis.loan_data;

-- ==========================================
-- 6. Average Loan Amount by Education
-- ==========================================

-- Business Question:
-- Do graduates request larger loans than non-graduates?

-- Business Insight:
-- Compares average loan amounts by education level.

-- Business Implication:
-- Helps identify whether education influences borrowing behavior.

SELECT
Education,
ROUND(AVG(LoanAmount),2) AS Avg_Loan
FROM bank_loan_analysis.loan_data
GROUP BY Education;

-- ==========================================
-- 7. Loan Approval by Gender
-- ==========================================

-- Business Question:
-- Does gender influence loan approval decisions?

-- Business Insight:
-- Compares approvals and rejections across genders.

-- Business Implication:
-- Helps assess whether approval patterns differ by gender.

SELECT
Gender,
Loan_Status,
COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Gender, Loan_Status;

-- ==========================================
-- 8. Loan Approval by Property Area
-- ==========================================

-- Business Question:
-- Which property area has the highest loan approval rate?

-- Business Insight:
-- Compares approvals across Urban, Rural, and Semiurban areas.

-- Business Implication:
-- Helps identify regions with stronger lending performance and market opportunities.

SELECT
Property_Area,
Loan_Status,
COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Property_Area, Loan_Status;

-- ==========================================
-- 9. Income vs Loan Status
-- ==========================================

-- Business Question:
-- Do approved applicants generally have higher incomes?

-- Business Insight:
-- Compares average applicant income between approved and rejected loans.

-- Business Implication:
-- Helps determine whether income significantly influences loan approval.

SELECT
Loan_Status,
ROUND(AVG(ApplicantIncome),2) AS Avg_Income
FROM bank_loan_analysis.loan_data
GROUP BY Loan_Status;

-- ==========================================
-- 10. Credit History Analysis
-- ==========================================

-- Business Question:
-- How does credit history affect loan approval?

-- Business Insight:
-- Compares loan approvals for applicants with good and poor credit history.

-- Business Implication:
-- Identifies the importance of credit history in lending decisions and risk assessment.

SELECT
Credit_History,
Loan_Status,
COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Credit_History, Loan_Status;
