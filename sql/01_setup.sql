-- Create tables
CREATE TABLE mql (
    mql_id            VARCHAR PRIMARY KEY,
    first_contact_date DATE,
    landing_page_id   VARCHAR,
    origin            VARCHAR
);

CREATE TABLE closed_deals (
    mql_id                        VARCHAR PRIMARY KEY,
    seller_id                     VARCHAR,
    sdr_id                        VARCHAR,
    sr_id                         VARCHAR,
    won_date                      TIMESTAMP,
    business_segment              VARCHAR,
    lead_type                     VARCHAR,
    lead_behaviour_profile        VARCHAR,
    has_company                   VARCHAR,
    has_gtin                      VARCHAR,
    average_stock                 VARCHAR,
    business_type                 VARCHAR,
    declared_product_catalog_size NUMERIC,
    declared_monthly_revenue      NUMERIC
);

-- Load data (PostgreSQL syntax)
-- Run from project root: psql -U username -d database_name -f sql/00_setup.sql
\copy closed_deals FROM 'data/olist_closed_deals_dataset.csv' CSV HEADER;
\copy mql FROM 'data/olist_marketing_qualified_leads_dataset.csv' CSV HEADER;
