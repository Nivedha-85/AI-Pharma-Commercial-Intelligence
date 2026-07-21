CREATE OR REPLACE VIEW reporting.vw_state_summary AS

SELECT

    g.state_abbreviation,

    SUM(f.tot_clms)      AS total_claims,
    SUM(f.tot_drug_cst)  AS total_drug_cost,
    SUM(f.tot_benes)     AS total_beneficiaries

FROM analytics.fact_prescriptions f

JOIN analytics.dim_provider p
ON f.provider_key = p.provider_key

JOIN analytics.dim_geography g
ON p.geography_key = g.geography_key

GROUP BY
    g.state_abbreviation;