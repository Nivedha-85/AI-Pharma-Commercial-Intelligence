CREATE OR REPLACE VIEW reporting.vw_ge65_summary AS

SELECT
    d.brand_name,
    d.generic_name,

    SUM(f.ge65_tot_clms) AS ge65_total_claims,
    SUM(f.ge65_tot_drug_cst) AS ge65_total_drug_cost,
    SUM(f.ge65_tot_benes) AS ge65_total_beneficiaries,

    ROUND(
        SUM(f.ge65_tot_drug_cst) /
        NULLIF(SUM(f.ge65_tot_clms), 0),
        2
    ) AS avg_ge65_cost_per_claim

FROM analytics.fact_prescriptions AS f

JOIN analytics.dim_drug AS d
    ON f.drug_key = d.drug_key

GROUP BY
    d.brand_name,
    d.generic_name

ORDER BY
    ge65_total_drug_cost DESC;