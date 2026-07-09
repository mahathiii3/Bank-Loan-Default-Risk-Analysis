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

SELECT COUNT(*) AS Total_Applications
FROM bank_loan_analysis.loan_data;

-- ==========================================
-- 2. Loan Approval Distribution
-- ==========================================

SELECT
    Loan_Status,
    COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Loan_Status;

-- ==========================================
-- 3. Loan Approval Percentage
-- ==========================================

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

SELECT
ROUND(AVG(LoanAmount),2) AS Average_Loan_Amount
FROM bank_loan_analysis.loan_data;

-- ==========================================
-- 5. Average Applicant Income
-- ==========================================

SELECT
ROUND(AVG(ApplicantIncome),2) AS Average_Income
FROM bank_loan_analysis.loan_data;

-- ==========================================
-- 6. Average Loan Amount by Education
-- ==========================================

SELECT
Education,
ROUND(AVG(LoanAmount),2) AS Avg_Loan
FROM bank_loan_analysis.loan_data
GROUP BY Education;

-- ==========================================
-- 7. Loan Approval by Gender
-- ==========================================

SELECT
Gender,
Loan_Status,
COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Gender, Loan_Status;

-- ==========================================
-- 8. Loan Approval by Property Area
-- ==========================================

SELECT
Property_Area,
Loan_Status,
COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Property_Area, Loan_Status;

-- ==========================================
-- 9. Income vs Loan Status
-- ==========================================

SELECT
Loan_Status,
ROUND(AVG(ApplicantIncome),2) AS Avg_Income
FROM bank_loan_analysis.loan_data
GROUP BY Loan_Status;

-- ==========================================
-- 10. Credit History Analysis
-- ==========================================

SELECT
Credit_History,
Loan_Status,
COUNT(*) AS Applications
FROM bank_loan_analysis.loan_data
GROUP BY Credit_History, Loan_Status;
