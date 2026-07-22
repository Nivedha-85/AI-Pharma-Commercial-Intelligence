CREATE OR REPLACE VIEW reporting.vw_specialty_summary AS

SELECT
    p.prscrbr_type AS provider_specialty,

    SUM(f.tot_clms) AS total_claims,
    SUM(f.tot_drug_cst) AS total_drug_cost,
    SUM(f.tot_benes) AS total_beneficiaries,

    ROUND(
        SUM(f.tot_drug_cst) /
        NULLIF(SUM(f.tot_clms), 0),
        2
    ) AS avg_cost_per_claim

FROM analytics.fact_prescriptions AS f

JOIN analytics.dim_provider AS p
    ON f.provider_key = p.provider_key

GROUP BY
    p.prscrbr_type

ORDER BY
    total_drug_cost DESC;


SELECT * FROM reporting.vw_specialty_summary;