# olist-sales-funnel-portfolio[README.md](https://github.com/user-attachments/files/25373335/README.md)
# Olist Sales Funnel Analysis

**From Lead to Revenue: A B2B Sales Funnel Performance Analysis**

[![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)](https://www.postgresql.org/)
[![Tableau](https://img.shields.io/badge/Visualization-Tableau-orange)](https://www.tableau.com/)
[![Dataset](https://img.shields.io/badge/Dataset-8000%2B%20Records-green)](#datasets)

---

## Project Overview

This portfolio project analyzes 8,000 marketing-qualified leads (MQLs) from Olist, a Brazilian B2B e-commerce marketplace, to understand the full sales funnel from initial contact to closed deal. The analysis identifies high-performing lead origins, sales cycle patterns, and rep/segment performance metrics.

**Key Questions Answered:**
- Which lead origins drive the most valuable conversions?
- How long does the sales cycle take across different segments?
- Which business segments and seller profiles have the highest win rates?
- How does the sales pipeline evolve month-over-month?

---

## Project Structure

```
olist-sales-funnel/
├── README.md
├── data/
│   ├── olist_marketing_qualified_leads_dataset.csv (8,000 leads)
│   └── olist_closed_deals_dataset.csv (842 closed deals)
├── sql/
│   ├── 01_setup.sql                 # Create tables & load data
│   ├── 02_exploration.sql           # Initial data exploration
│   ├── 03_funnel_analysis.sql       # Core business queries
│   └── 04_funnel_master_export.sql  # Export query for Tableau
├── tableau/
│   └── olist_funnel_dashboard.twbx  # [IN PROGRESS]
└── insights/
    └── key_findings.md
```

---

## Key Findings

- **10.5% Overall Conversion Rate** – 842 of 8,000 MQLs convert to closed deals
- **Organic search drives volume** (2,296 leads) but direct and referral traffic convert at higher rates – a classic quality vs. quantity trade-off
- **Top segments:** Home Decor and Health & Beauty dominate both deal count and revenue
- **Average sales cycle:** ~45–60 days from first contact to close, varying by lead origin
- **Online Medium sellers** represent 39% of closed deals – Olist's core customer profile

---

## Tech Stack

- **Database:** PostgreSQL (or SQLite)
- **SQL:** Complex JOINs, CTEs, window functions, date calculations
- **Visualization:** Tableau (in progress)
- **Data Format:** CSV

---

## 📋 Data Dictionary

### `mql` Table
| Column | Type | Description |
|--------|------|-------------|
| mql_id | VARCHAR | Unique lead identifier |
| first_contact_date | DATE | When the lead first engaged |
| landing_page_id | VARCHAR | Marketing landing page ID |
| origin | VARCHAR | Lead source (organic search, direct, referral, etc.) |

### `closed_deals` Table
| Column | Type | Description |
|--------|------|-------------|
| mql_id | VARCHAR | Foreign key to mql table |
| seller_id | VARCHAR | Olist seller ID |
| sr_id | VARCHAR | Sales rep ID |
| won_date | TIMESTAMP | When the deal closed |
| business_segment | VARCHAR | Industry/vertical |
| lead_type | VARCHAR | Lead classification (Online Small, Online Medium, etc.) |
| lead_behaviour_profile | VARCHAR | Buyer behavior segment |
| declared_monthly_revenue | NUMERIC | Seller's reported monthly revenue |
| business_type | VARCHAR | B2B, B2C, etc. |

---

## Quick Start

### 1. Set Up Database
```bash
psql -U your_user -d your_db -f sql/01_setup.sql
```

### 2. Load Data
```sql
COPY mql FROM '/path/to/olist_marketing_qualified_leads_dataset.csv' CSV HEADER;
COPY closed_deals FROM '/path/to/olist_closed_deals_dataset.csv' CSV HEADER;
```

### 3. Run Analysis Queries
```bash
psql -U your_user -d your_db -f sql/03_funnel_analysis.sql
```

### 4. Export for Tableau
```bash
psql -U your_user -d your_db -f sql/04_funnel_master_export.sql
```
This generates `funnel_master.csv` for your Tableau visualizations.

---

## SQL Queries Included

### Exploration (02_exploration.sql)
- Overall funnel conversion rate
- Lead volume and conversion by origin
- Monthly trends in MQL volume vs. closed deals

### Analysis (03_funnel_analysis.sql)
1. **Conversion by Lead Origin** – Which channels perform best?
2. **Sales Cycle Duration** – How long does each origin take to close?
3. **Top Business Segments** – Which verticals drive the most deals?
4. **Win Rate by Lead Type** – Are certain seller profiles more likely to convert?
5. **SDR/SR Performance** – Which sales reps close the most deals?
6. **Behaviour Profile Impact** – How does buyer behavior correlate with revenue?

### Export (04_funnel_master_export.sql)
Creates a denormalized `funnel` table with all dimensions and metrics for Tableau, including calculated fields like `is_converted` and `days_to_close`.

---

## Tableau Dashboards (In Progress)

### Dashboard 1: Executive Funnel Overview
- Total leads, conversions, and conversion rate % (KPI cards)
- MQL volume vs. closed deals over time (dual-axis trend line)
- Conversion rate by lead origin (ranked bar chart)
- Average days to close

### Dashboard 2: Segment & Product Intelligence
- Top segments by deal count (treemap)
- Revenue by segment (bar chart)
- Lead type distribution (pie chart)
- Behaviour profile impact on revenue (bar chart)

### Dashboard 3: Sales Rep Performance
- Top 10 sales reps by deals closed
- Revenue per rep
- Efficiency metric (revenue per deal)
- Monthly closed deals by rep (heatmap)

---

## Key Insights for Decision-Making

**For Marketing:**
- Organic search generates the most leads but has lower conversion – consider nurturing strategies
- Direct and referral traffic are high-quality sources – invest in these channels

**For Sales:**
- Home Decor and Health & Beauty are proven markets with strong conversion – prioritize these segments
- Average sales cycle is 45–60 days – use this to set realistic pipeline forecasts
- Top reps show 2–3x higher deal volumes – identify and train best practices from top performers

**For Product:**
- Online Medium sellers (mid-size) are the core customer – optimize onboarding for this profile
- Sellers with declared revenue and GTIN data convert at higher rates – encourage data completeness

---

## Skills Demonstrated

- **SQL:** INNER/LEFT JOINs, CTEs, window functions, date arithmetic, aggregations, filtering
- **Data Analysis:** Funnel analysis, cohort analysis, performance benchmarking
- **Data Visualization:** Multi-dashboard design, KPI tracking, trend analysis
- **Business Acumen:** Lead scoring, sales pipeline metrics, rep performance measurement

---

## How to Use This Repo

1. Clone the repo and navigate to the project folder
2. Load the CSV data into your database using `sql/01_setup.sql`
3. Run the exploration and analysis queries to understand the data
4. Export `funnel_master.csv` and connect it to Tableau
5. Build the dashboards following the specifications in the Tableau section
6. Refer to `insights/key_findings.md` for business recommendations

---

## Portfolio Context

This project was built to demonstrate:
- **SQL proficiency** in complex data modeling and exploration
- **Data visualization** skills in Tableau for executive-level reporting
- **Business analysis** ability to translate data into actionable insights
- **Project organization** with clean file structure and documentation

**Ideal for:** Data Analyst roles at B2B SaaS, marketplaces, or sales-driven organizations.

---

## 📧 Questions?

For questions about the analysis, SQL queries, or Tableau approach, feel free to reach out or check the detailed documentation in `insights/key_findings.md`.

---

**Status:** SQL analysis complete | Tableau dashboards in progress | Final report in progress
