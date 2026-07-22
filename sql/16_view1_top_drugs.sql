CREATE OR REPLACE VIEW reporting.vw_top_drugs AS

SELECT
    d.brand_name,
    d.generic_name,

    SUM(fp.tot_clms) AS total_claims,
    SUM(fp.tot_drug_cst) AS total_drug_cost,
    SUM(fp.tot_benes) AS total_beneficiaries,

    ROUND(
        SUM(fp.tot_drug_cst) /
        NULLIF(SUM(fp.tot_clms),0),
        2
    ) AS avg_cost_per_claim

FROM analytics.fact_prescriptions fp

JOIN analytics.dim_drug d
ON fp.drug_key = d.drug_key

GROUP BY
    d.brand_name,
    d.generic_name;



SELECT * FROM reporting.vw_top_drugs