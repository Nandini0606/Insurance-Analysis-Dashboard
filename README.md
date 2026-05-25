<!--
  ╔══════════════════════════════════════════════════════╗
  ║  BEFORE PUBLISHING: Replace the placeholders below: ║
  ║  YOUR_USERNAME  →  your GitHub username              ║
  ║  YOUR_REPO      →  your repository name              ║
  ║  YOUR_LINKEDIN  →  your LinkedIn profile slug        ║
  ║  YOUR_EMAIL     →  your email address                ║
  ╚══════════════════════════════════════════════════════╝
-->

<h1 align="center">🛡️ Insurance Analytics Project</h1>

<p align="center">
  <b>An end-to-end Data Analytics project using MySQL · Excel · Power BI · Tableau</b><br/>
  <i>Turning raw insurance data into actionable business intelligence</i>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/MySQL-Data%20Engineering-orange?style=for-the-badge&logo=mysql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Microsoft%20Excel-Dashboard-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-Analytics%20Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/Tableau-Branch%20Dashboard-1F4E79?style=for-the-badge&logo=tableau&logoColor=white"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Domain-Insurance%20%26%20Finance-blue?style=flat-square"/>
  <img src="https://img.shields.io/badge/Analysis-Policy%20%7C%20Claims%20%7C%20Branch-green?style=flat-square"/>
  <img src="https://img.shields.io/badge/Dashboards-Excel%20%7C%20Power%20BI%20%7C%20Tableau-purple?style=flat-square"/>
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square"/>
</p>

---

## 📑 Table of Contents

| # | Section |
|---|---------|
| 1 | [Project Overview](#-project-overview) |
| 2 | [Tools & Tech Stack](#-tools--tech-stack) |
| 3 | [Dataset Description](#-dataset-description) |
| 4 | [SQL Analysis & KPIs](#-sql-analysis--kpis) |
| 5 | [Excel Dashboard](#-excel-dashboard) |
| 6 | [Power BI Dashboard](#-power-bi-dashboard) |
| 7 | [Tableau Dashboard](#-tableau-dashboard) |
| 8 | [Key KPIs at a Glance](#-key-kpis-at-a-glance) |
| 9 | [Business Insights](#-business-insights) |
| 10 | [Project Structure](#-project-structure) |
| 11 | [How to Run](#-how-to-run) |

---

## 📌 Project Overview

> **Objective:** Analyze an insurance company's complete business operations — from policyholder demographics and claims to branch-level revenue and sales pipeline — and surface insights through interactive multi-tool dashboards.

This project follows a **complete end-to-end analytics pipeline** across two distinct domains:

```
insurance_db (MySQL)
  ├── Policy Details        ──► Insurance Policy Analysis
  ├── Customer Information  ──► KPIs: Premiums · Claims · Expirations
  ├── Claims                ──► Excel Dashboard
  ├── Payment History       ──► Power BI Dashboard
  │
  ├── Opportunity           ──► Insurance Branch Analysis
  ├── Meeting List          ──► KPIs: Target vs Achievement · Pipeline
  ├── Individual Budget     ──► Tableau Dashboard
  ├── Brokerage / Fees      
  └── Invoice               
```

**Key questions answered:**
- 📋 How are policies distributed across age groups and gender?
- 📅 Which policies are expiring this year?
- 📈 What is the year-over-year premium growth rate?
- ⚖️ How do claims break down by status (Approved / Pending / Rejected)?
- 🏢 Which account executives are meeting their branch targets?
- 💰 What is the split between New, Cross-sell, and Renewal income?
- 🔄 Where do opportunities sit in the sales pipeline by stage?

---

## 🛠 Tools & Tech Stack

<table>
  <tr>
    <th>Tool</th>
    <th>Version / Type</th>
    <th>Purpose</th>
  </tr>
  <tr>
    <td>🗄️ <b>MySQL</b></td>
    <td>MySQL Workbench + MySQL 8.0+</td>
    <td>Database setup, ERD modelling, all KPI queries, window functions</td>
  </tr>
  <tr>
    <td>📊 <b>Microsoft Excel</b></td>
    <td>Excel 2016+ (.xlsm)</td>
    <td>Raw data storage, pivot analysis, interactive Insurance & Branch dashboards</td>
  </tr>
  <tr>
    <td>📊 <b>Power BI</b></td>
    <td>Power BI Desktop (.pbix)</td>
    <td>Interactive insurance analytics dashboard with slicers and KPI cards</td>
  </tr>
  <tr>
    <td>📊 <b>Tableau</b></td>
    <td>Tableau Desktop / Public (.twbx)</td>
    <td>Branch performance dashboard with embedded data — no extra connection needed</td>
  </tr>
</table>

---

## 📂 Dataset Description

The project uses a MySQL database (`insurance_db`) with **10 core tables** split across two analysis tracks.

<details>
<summary><b>📋 Click to expand — Policy Analysis Tables</b></summary>

| Table | Key Fields | Description |
|-------|-----------|-------------|
| `policy details` | `policy_id`, `policy_type`, `coverage_amount`, `premium_amount`, `policy_start_date`, `policy_end_date`, `status`, `customer_id` | Core policy records — type, coverage, premiums, and lifecycle dates |
| `customer information` | `customer_id`, `name`, `gender`, `age`, `occupation`, `marital_status`, `address`, `age_bucket` | Policyholder demographics — age buckets, gender, location |
| `claims` | `claim_id`, `date_of_claim`, `claim_amount`, `claim_status`, `reason_for_claim`, `settlement_date`, `policy_id` | Claim transactions — amount, status (Approved / Pending / Rejected) |
| `payment history` | `payment_id`, `payment_status`, `policy_id` | Payment tracking — Paid / Overdue / Pending |

</details>

<details>
<summary><b>📋 Click to expand — Branch Analysis Tables</b></summary>

| Table | Key Fields | Description |
|-------|-----------|-------------|
| `opportunity` | `opportunity_id`, `account_executive`, `account_exe_id`, `premium_amount`, `revenue_amount`, `closing_date`, `stage`, `branch`, `specialty`, `product_group` | Sales pipeline — stage-wise opportunities and revenue |
| `meeting_list` | `meeting_date`, `account_executive` | Meeting activity log by executive and date |
| `individual budget` | `branch`, `account_exe_id`, `employee_name`, `new_budget`, `cross_sell_budget`, `renewal_budget` | Employee-level annual targets by income class |
| `invoice` | `invoice_id`, `account_executive` | Invoice records per account executive |
| `brokerage` | `client_name`, `policy_number`, `account_exe_id`, `branch_name`, `income_class`, `amount`, `revenue_transaction_type` | Brokerage income — New / Cross-sell / Renewal |
| `fees` | `account_exe_id`, `amount` | Fee income per executive |

</details>

---

## 🗄️ SQL Analysis & KPIs

### Database Setup
```sql
CREATE DATABASE insurance_db;
USE insurance_db;
```

### Insurance Policy Analysis

<details>
<summary><b>📊 Click to expand — All Policy KPI Queries</b></summary>

```sql
-- 1. Total Policies
SELECT COUNT(DISTINCT policy_id) AS total_policy
FROM `policy details`;

-- 2. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM `customer information`;

-- 3. Age Bucket–wise Policy Count
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_bucket,
    COUNT(p.policy_id) AS policy_count
FROM `policy details` p
JOIN `customer information` c ON p.customer_id = c.customer_id
GROUP BY age_bucket;

-- 4. Gender-wise Policy Count
SELECT c.gender, COUNT(p.policy_id) AS policy_count
FROM `policy details` p
JOIN `customer information` c ON p.customer_id = c.customer_id
GROUP BY c.gender;

-- 5. Policy Type–wise Count
SELECT policy_type, COUNT(policy_id) AS policy_count
FROM `policy details`
GROUP BY policy_type
ORDER BY policy_count DESC;

-- 6. Policies Expiring This Year
SELECT COUNT(*) AS expiring_policies
FROM `policy details`
WHERE YEAR(policy_end_date) = YEAR(CURDATE());

-- 7. Premium Growth Rate (Year-over-Year)
SELECT 
    YEAR(policy_start_date) AS year,
    ROUND(SUM(premium_amount), 1) AS total_premium,
    ROUND(LAG(SUM(premium_amount)) OVER (ORDER BY YEAR(policy_start_date)), 1) AS prev_year_premium,
    ROUND(
        (SUM(premium_amount) - LAG(SUM(premium_amount)) OVER (ORDER BY YEAR(policy_start_date)))
        * 100.0 / LAG(SUM(premium_amount)) OVER (ORDER BY YEAR(policy_start_date)), 1
    ) AS growth_rate_percentage
FROM `policy details`
GROUP BY YEAR(policy_start_date)
ORDER BY year;

-- 8. Claim Status–wise Count
SELECT claim_status, COUNT(*) AS claim_count
FROM claims
GROUP BY claim_status;

-- 9. Payment Status–wise Count
SELECT payment_status, COUNT(*) AS count
FROM `payment history`
GROUP BY payment_status;

-- 10. Total Claim Amount
SELECT ROUND(SUM(claim_amount), 1) AS total_claim_amount
FROM claims;
```

</details>

### Insurance Branch Analysis

<details>
<summary><b>📊 Click to expand — All Branch KPI Queries</b></summary>

```sql
-- 1. Invoice Count by Account Executive
SELECT account_executive, COUNT(*) AS invoice_count
FROM invoice
GROUP BY account_executive;

-- 2. Yearly Meeting Count
SELECT YEAR(meeting_date) AS year, COUNT(*) AS meeting_count
FROM meeting_list
GROUP BY YEAR(meeting_date);

-- 3. Target vs Achievement (Budget vs Brokerage + Fees)
SELECT 
    b.employee_name,
    ROUND(SUM(b.new_budget), 1) AS target,
    ROUND(SUM(IFNULL(br.amount, 0) + IFNULL(f.amount, 0)), 1) AS achieved
FROM `individual budget` b
LEFT JOIN opportunity o   ON b.account_exe_id = o.account_exe_id
LEFT JOIN brokerage br    ON o.account_exe_id = br.account_exe_id
LEFT JOIN fees f          ON o.account_exe_id = f.account_exe_id
GROUP BY b.employee_name;

-- 4. Cross-sell / New / Renewal Income Split
SELECT income_class, ROUND(SUM(amount), 1) AS total_amount
FROM brokerage
GROUP BY income_class;

-- 5. Stage-wise Pipeline Revenue
SELECT stage, ROUND(SUM(revenue_amount), 1) AS revenue
FROM opportunity
GROUP BY stage
ORDER BY revenue DESC;

-- 6. Meetings by Account Executive
SELECT account_executive, COUNT(*) AS meeting_count
FROM meeting_list
GROUP BY account_executive;
```

</details>

---

## 📊 Excel Dashboard
The Excel workbook (`Insurance_Analytics_Project.xlsm`) contains **16 sheets** including raw data, pivot analysis, and two interactive dashboards.

**Insurance Dashboard** — Policy-level analysis with filters for Policy Type, Status, Gender, and Year.
![ ](https://github.com/Nandini0606/Insurance-Analysis-Dashboard/blob/main/Excel%20Insurance%20Branch%20Analytics%20Dashboard%20Screenshot.png))

| Visual | Type | Description |
|--------|------|-------------|
| KPI Cards | Metric tiles | Total Policies · Total Customers · Total Claims · Expiring This Year |
| Age Bucket–wise Policy Count | Bar chart | Policy distribution across 18–25, 26–35, 36–50, 50+ |
| Gender-wise Policy Count | Donut chart | Male vs Female policyholder split |
| Policy Type–wise Count | Horizontal bar | Health · Life · Auto · Property breakdown |
| Premium Growth Rate | Line chart | Year-over-year premium trend |
| Claim Status Breakdown | Donut chart | Approved / Pending / Rejected claim counts |
| Payment Status Count | Bar chart | Paid / Overdue / Pending payment status |

**Branch Dashboard** — Sales and branch performance with filters for Branch and Account Executive.
![ ](https://github.com/Nandini0606/Insurance-Analysis-Dashboard/blob/main/Excel%20Insurance%20Branch%20Analytics%20Dashboard%20Screenshot.png))

| Visual | Type | Description |
|--------|------|-------------|
| Target vs Achievement | Grouped bar | Budget target vs actual brokerage + fees per executive |
| Income Class Split | Donut chart | New · Cross-sell · Renewal brokerage breakdown |
| Stage-wise Revenue | Bar chart | Pipeline revenue by opportunity stage |
| Meeting Activity | Line chart | Year-wise meeting count trend |
| Invoice by Exec | Bar chart | Invoice volume per account executive |
| Meetings by Exec | Bar chart | Meeting count per account executive |

---

## 📊 Power BI Dashboard

The Power BI file (`New_Insurance_Analytics.pbix`) delivers a fully interactive insurance analytics report with dynamic slicers and drill-through capabilities.
![ ](https://github.com/Nandini0606/Insurance-Analysis-Dashboard/blob/main/Power%20Bi%20Insurance%20Policy%20Dashboard%20Screenshot.jpg))
![ ](https://github.com/Nandini0606/Insurance-Analysis-Dashboard/blob/main/Power%20Bi%20Insurance%20Branch%20Dashboard%20Screenshot.jpg))

**KPI Header Metrics:**

| Total Policies | Total Customers | Total Claim Amount | Total Premium | Expiring This Year | Avg Premium |
|:-:|:-:|:-:|:-:|:-:|:-:|
| — | — | — | — | — | — |

> *Values populate from your connected data source after refresh.*

**Visualizations:**

| Visual | Insight |
|--------|---------|
| Age Bucket–wise Policy Count | Which age group holds the most policies |
| Gender-wise Policy Count | Gender distribution across the portfolio |
| Policy Type Distribution | Health vs Life vs Auto vs Property mix |
| Premium Growth Rate (YoY) | Trend line with growth % annotations |
| Claim Status Breakdown | Approved / Pending / Rejected split |
| Payment Status Overview | Paid vs overdue vs pending payment health |
| Target vs Achievement | Executive-level performance vs budget |
| Pipeline Stage Revenue | Funnel view of opportunity revenue |

**Filters:** `Policy Type` · `Year` · `Branch` · `Account Executive`

---

## 📊 Tableau Dashboard

The Tableau packaged workbook (`New_Insurancy_Analytics_Dashboard.twbx`) includes embedded data — no additional data connection is required.

### Insurance Policy View
![ ](https://github.com/Nandini0606/Insurance-Analysis-Dashboard/blob/main/Tableau%20Insurance%20Policy%20Dashboard%20Screenshot.jpg))

| Visual | Insight |
|--------|---------|
| Age Bucket Policy Distribution | 36–50 age group typically holds the highest policy count |
| Gender Split | Policy count and premium volume by gender |
| Policy Type Treemap | Visual size comparison of Health / Life / Auto / Property |
| Premium Growth Line | Year-over-year trend showing portfolio growth |
| Claim Amount by Status | Approved vs pending vs rejected claim values |
| Expiring Policies Flag | Count and list of policies ending in the current year |

### Branch Performance View
![ ](https://github.com/Nandini0606/Insurance-Analysis-Dashboard/blob/main/Tableau%20Insurance%20Branch%20Dashboard%20Screenshot.jpg))
| Visual | Insight |
|--------|---------|
| Target vs Achievement Table | Executive-level gap analysis — over/underperforming |
| Income Class Pie | New · Cross-sell · Renewal brokerage share |
| Stage-wise Revenue Bar | Which pipeline stage holds the most revenue value |
| Meeting Activity by Year | Annual trend of client-facing meetings |
| Invoice Count by Exec | Workload distribution across account executives |
| Meetings by Exec | Activity heatmap per account executive |

**Filters:** `Branch` · `Account Executive` · `Policy Type` · `Year`

---

## 📈 Key KPIs at a Glance

<table align="center">
  <tr>
    <td align="center"><b>Policy Types</b><br/><h3>4</h3><i>Health · Life · Auto · Property</i></td>
    <td align="center"><b>Age Groups</b><br/><h3>4</h3><i>18-25 · 26-35 · 36-50 · 50+</i></td>
    <td align="center"><b>Claim Statuses</b><br/><h3>3</h3><i>Approved · Pending · Rejected</i></td>
    <td align="center"><b>Payment Statuses</b><br/><h3>3</h3><i>Paid · Overdue · Pending</i></td>
  </tr>
  <tr>
    <td align="center"><b>Income Classes</b><br/><h3>3</h3><i>New · Cross-sell · Renewal</i></td>
    <td align="center"><b>Dashboards</b><br/><h3>3</h3><i>Excel · Power BI · Tableau</i></td>
    <td align="center"><b>SQL Queries</b><br/><h3>16</h3><i>Policy + Branch KPIs</i></td>
    <td align="center"><b>Data Tables</b><br/><h3>10</h3><i>Across 2 domains</i></td>
  </tr>
</table>

---

## 💡 Business Insights

<details>
<summary><b>1️⃣ Age Group 36–50 Likely Dominates the Policy Portfolio</b></summary>
<br/>
Mid-career professionals in the 36–50 bracket typically carry the highest financial obligations — mortgages, dependents, business exposure — making them the most policy-heavy segment. Targeted product bundling for this cohort (e.g., Life + Property) can increase per-customer revenue.
<br/><br/>
</details>

<details>
<summary><b>2️⃣ Premium Growth Rate Reveals Portfolio Health Year-on-Year</b></summary>
<br/>
Using SQL window functions (<code>LAG</code>), the premium growth rate is computed per year. A declining growth rate signals either policy lapses outpacing new issuances or pricing pressure — a critical early-warning metric for actuarial review.
<br/><br/>
</details>

<details>
<summary><b>3️⃣ Policies Expiring This Year — Retention Risk Window</b></summary>
<br/>
Policies flagged with <code>YEAR(policy_end_date) = YEAR(CURDATE())</code> represent an immediate renewal opportunity. Proactively targeting this cohort before expiry can significantly reduce churn and maintain premium revenue continuity.
<br/><br/>
</details>

<details>
<summary><b>4️⃣ Claim Approval Rate Indicates Operational Efficiency</b></summary>
<br/>
A high proportion of <i>Pending</i> claims relative to <i>Approved</i> signals a processing bottleneck. Monitoring claim status distribution in real time — as surfaced in all three dashboards — enables operations teams to prioritize backlogs and meet SLA commitments.
<br/><br/>
</details>

<details>
<summary><b>5️⃣ Target vs Achievement Exposes Executive-Level Performance Gaps</b></summary>
<br/>
By joining <code>individual budget</code> with <code>brokerage</code> and <code>fees</code>, the SQL query reveals which account executives are exceeding targets and which are consistently underperforming. This drives coaching decisions, territory reassignments, and incentive planning.
<br/><br/>
</details>

<details>
<summary><b>6️⃣ Renewal Income Dominates Brokerage — A Double-Edged Signal</b></summary>
<br/>
If Renewal income substantially outweighs New and Cross-sell, it signals a mature but stagnant book of business. Healthy insurance branches should show growing Cross-sell and New income as indicators of active client acquisition and deepening relationships.
<br/><br/>
</details>

<details>
<summary><b>7️⃣ Pipeline Stage Revenue Identifies Revenue at Risk</b></summary>
<br/>
Opportunities concentrated in early stages (e.g., <i>Qualify Opportunity</i>) with little in <i>Closed Won</i> indicate a long conversion lag. Stage-wise revenue analysis helps sales managers focus efforts on pushing deals forward — particularly high-value opportunities stalled mid-funnel.
<br/><br/>
</details>

<details>
<summary><b>8️⃣ Meeting Activity Correlates with Revenue Achievement</b></summary>
<br/>
Account executives with higher meeting counts tend to show stronger Target vs Achievement ratios. Year-wise and exec-wise meeting breakdowns serve as a leading indicator of future brokerage revenue — meetings today convert to premiums tomorrow.
<br/><br/>
</details>

---

## 📁 Project Structure

```
📦 YOUR_REPO/
│
├── 📄 README.md
│
├── 🗄️ Insurance_Analytics.sql                    ← DB setup + all 16 KPI queries (Policy & Branch)
│
├── 🗄️ Insurance_Data_Modelling_.mwb              ← MySQL Workbench ERD (entity-relationship diagram)
│
├── 📊 Insurance_Analytics_Project.xlsm           ← Excel workbook: raw data + 2 interactive dashboards
│
├── 📊 New_Insurance_Analytics.pbix               ← Power BI dashboard
│
└── 📊 New_Insurancy_Analytics_Dashboard.twbx     ← Tableau dashboard (self-contained with embedded data)
```

---

## 🚀 How to Run

### 🗄️ SQL (MySQL)
1. Open **MySQL Workbench** and create a new connection / schema.
2. Run `Insurance_Analytics.sql` to create `insurance_db` and execute all KPI queries.
3. To explore the data model, open `Insurance_Data_Modelling_.mwb` and navigate to the **EER Diagram** tab.

```sql
-- Run in MySQL Workbench or CLI
SOURCE Insurance_Analytics.sql;
```

### 📊 Excel
1. Open `Insurance_Analytics_Project.xlsm` in **Excel 2016+**.
2. Enable macros if prompted.
3. Navigate to the **`Insurance Dashboard`** sheet for policy-level insights.
4. Navigate to the **`Branch Dashboard`** sheet for sales and branch performance.
5. Use the slicers to filter by Policy Type, Status, Branch, and Account Executive.

### 📊 Power BI
1. Open `New_Insurance_Analytics.pbix` in **Power BI Desktop** (free download from Microsoft).
2. Click **Refresh** if connected to a live data source, or explore pre-loaded visuals.
3. Use the filter panel and slicers to drill into specific policy types, years, or branches.

### 📊 Tableau
1. Open `New_Insurancy_Analytics_Dashboard.twbx` in **Tableau Desktop** or **Tableau Public** (free).
2. The `.twbx` package has data embedded — no additional connection or CSV import required.
3. Use the filter controls to slice by Branch, Account Executive, Policy Type, or Year.

---

## 📋 Requirements

| Tool | Requirement |
|------|-------------|
| MySQL | 8.0+ (required for `LAG` window function support) |
| Microsoft Excel | 2016+ with macro support (`.xlsm`) |
| Power BI Desktop | Free — [Download here](https://powerbi.microsoft.com/desktop/) |
| Tableau | Desktop or Public (free) — [Download here](https://public.tableau.com/) |
| MySQL Workbench | Free — [Download here](https://www.mysql.com/products/workbench/) |

---

<h3 align="center">⭐ If this project helped you, please consider giving it a star! ⭐</h3>

<p align="center">
  <a href="https://linkedin.com/in/YOUR_LINKEDIN">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
  &nbsp;
  <a href="https://github.com/YOUR_USERNAME">
    <img src="https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
  &nbsp;
  <a href="mailto:YOUR_EMAIL@gmail.com">
    <img src="https://img.shields.io/badge/Gmail-Contact-D14836?style=for-the-badge&logo=gmail&logoColor=white"/>
  </a>
</p>
