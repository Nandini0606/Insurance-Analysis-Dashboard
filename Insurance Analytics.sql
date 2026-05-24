CREATE DATABASE insurance_db;
USE insurance_db;

                                   ###  Insurance Policy Analysis ###
# 1. TOTAL POLICY
SELECT COUNT(DISTINCT policy_id) AS total_policy
FROM `policy details`;

# 2. TOTAL CUSTOMERS
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM `customer information`;

# 3. AGE BUCKET WISE POLICY COUNT
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_bucket,
    COUNT(p.policy_id) AS policy_count
FROM `policy details` p
JOIN `customer information` c
    ON p.customer_id = c.customer_id
GROUP BY age_bucket;

# 4. GENDER WISE POLICY COUNT
SELECT 
    c.gender,
    COUNT(p.policy_id) AS policy_count
FROM `policy details` p
JOIN `customer information` c
    ON p.customer_id = c.customer_id
GROUP BY c.gender;

# 5. POLICY TYPE WISE COUNT
SELECT 
    policy_type,
    COUNT(policy_id) AS policy_count
FROM `policy details`
GROUP BY policy_type
ORDER BY policy_count DESC;

# 6. POLICY EXPIRE THIS YEAR
SELECT COUNT(*) AS expiring_policies
FROM `policy details`
WHERE YEAR(policy_end_date) = YEAR(CURDATE());

# 7. PREMIUM GROWTH RATE
SELECT 
    YEAR(policy_start_date) AS year,
    ROUND(SUM(premium_amount), 1) AS total_premium,
    ROUND(LAG(SUM(premium_amount)) OVER (ORDER BY YEAR(policy_start_date)), 1) AS prev_year_premium,
    ROUND((SUM(premium_amount) - LAG(SUM(premium_amount)) OVER (ORDER BY YEAR(policy_start_date))) * 100.0 / LAG(SUM(premium_amount)) OVER (ORDER BY YEAR(policy_start_date)), 1) AS growth_rate_percentage
FROM `policy details`
GROUP BY YEAR(policy_start_date)
ORDER BY year;

# 8.CLAIM STATUS WISE COUNT
SELECT 
    claim_status,
    COUNT(*) AS claim_count
FROM claims
GROUP BY claim_status;

# 9.PAYMENT STATUS WISE COUNT
SELECT 
    payment_status,
    COUNT(*) AS count
FROM `payment history`
GROUP BY payment_status;

# 10.TOTAL CLAIM AMOUNT
SELECT 
    ROUND(SUM(claim_amount),1) AS total_claim_amount
FROM claims;

######################################################################################################################################################################################

                                                  ### Insurance Branch Analysis ###
# 1. NO. OF INVOICE BY ACCOUNT EXEC
SELECT 
    account_executive,
    COUNT(*) AS invoice_count
FROM invoice
GROUP BY account_executive;

# 2. YEARLY MEETING COUNT
SELECT 
    YEAR(meeting_date) AS year,
    COUNT(*) AS meeting_count
FROM meeting_list
GROUP BY YEAR(meeting_date);

# 3. TARGET vs ACHIEVEMENT
SELECT 
    b.employee_name,
    ROUND(SUM(b.new_budget),1) AS target,
    ROUND(SUM(IFNULL(br.amount,0) + IFNULL(f.amount,0)),1) AS achieved
FROM `individual budget` b
LEFT JOIN opportunity o
    ON b.account_exe_id = o.account_exe_id
LEFT JOIN brokerage br
    ON o.account_exe_id = br.account_exe_id
LEFT JOIN fees f
    ON o.account_exe_id = f.account_exe_id
GROUP BY b.employee_name;

# 4. CROSS SELL / NEW / RENEWAL
SELECT 
    income_class,
    ROUND(SUM(amount),1) AS total_amount
FROM brokerage
GROUP BY income_class;

# 5. STAGE WISE REVENUE
SELECT 
    stage,
    ROUND(SUM(revenue_amount),1) AS revenue
FROM opportunity
GROUP BY stage
ORDER BY revenue DESC;

# 6. MEETING BY ACCOUNT EXEC
SELECT 
    account_executive,
    COUNT(*) AS meeting_count
FROM meeting_list
GROUP BY account_executive;





























