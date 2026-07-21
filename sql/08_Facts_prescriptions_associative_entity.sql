INSERT INTO analytics.fact_prescriptions
(
    provider_key,
    drug_key,
    tot_clms,
    tot_30day_fills,
    tot_day_suply,
    tot_drug_cst,
    tot_benes,
    ge65_tot_clms,
    ge65_tot_30day_fills,
    ge65_tot_day_suply,
    ge65_tot_drug_cst,
    ge65_tot_benes,
    ge65_metrics_suppression_status,
    ge65_beneficiary_suppression_status
)
SELECT
    p.provider_key,
    d.drug_key,

    s.tot_clms,
    s.tot_30day_fills,
    s.tot_day_suply,
    s.tot_drug_cst,
    s.tot_benes,

    s.ge65_tot_clms,
    s.ge65_tot_30day_fills,
    s.ge65_tot_day_suply,
    s.ge65_tot_drug_cst,
    s.ge65_tot_benes,

    s.ge65_sprsn_flag,
    s.ge65_bene_sprsn_flag

FROM staging.stg_partd_prescriptions s

JOIN analytics.dim_provider p
    ON s.prscrbr_npi = p.prscrbr_npi

JOIN analytics.dim_drug d
    ON s.brnd_name = d.brand_name
   AND s.gnrc_name = d.generic_name;