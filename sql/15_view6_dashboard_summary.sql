CREATE OR REPLACE VIEW reporting.vw_dashboard_summary AS

SELECT

    COUNT(DISTINCT p.provider_key) AS total_providers,

    COUNT(DISTINCT d.drug_key) AS total_drugs,

    COUNT(DISTINCT g.state_abbreviation) AS total_states,

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

JOIN analytics.dim_drug AS d
    ON f.drug_key = d.drug_key

JOIN analytics.dim_geography AS g
    ON p.geography_key = g.geography_key;