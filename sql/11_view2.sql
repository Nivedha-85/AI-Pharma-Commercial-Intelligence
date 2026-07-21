CREATE OR REPLACE VIEW reporting.vw_top_prescribers AS

SELECT

    p.prscrbr_npi,
    p.prscrbr_first_name,
    p.prscrbr_last_org_name,
    p.prscrbr_type,

    SUM(f.tot_clms)     AS total_claims,
    SUM(f.tot_drug_cst) AS total_drug_cost,
    SUM(f.tot_benes)    AS total_beneficiaries

FROM analytics.fact_prescriptions f

JOIN analytics.dim_provider p
ON f.provider_key = p.provider_key

GROUP BY

    p.prscrbr_npi,
    p.prscrbr_first_name,
    p.prscrbr_last_org_name,
    p.prscrbr_type;