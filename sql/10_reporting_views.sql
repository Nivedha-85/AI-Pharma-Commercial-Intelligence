CREATE SCHEMA IF NOT EXISTS reporting;


CREATE OR REPLACE VIEW reporting.vw_top_drugs AS

SELECT
    d.brand_name,
    d.generic_name,

    SUM(f.tot_clms)      AS total_claims,
    SUM(f.tot_drug_cst)  AS total_drug_cost,
    SUM(f.tot_benes)     AS total_beneficiaries

FROM analytics.fact_prescriptions f

JOIN analytics.dim_drug d
ON f.drug_key = d.drug_key

GROUP BY
    d.brand_name,
    d.generic_name;



SELECT *
FROM reporting.vw_top_drugs
LIMIT 10;