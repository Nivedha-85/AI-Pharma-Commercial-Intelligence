CREATE TABLE staging.stg_partd_prescriptions (

    prscrbr_npi BIGINT,

    prscrbr_last_org_name VARCHAR(150),

    prscrbr_first_name VARCHAR(100),

    prscrbr_city VARCHAR(100),

    prscrbr_state_abrvtn VARCHAR(2),

    prscrbr_state_fips INTEGER,

    prscrbr_type VARCHAR(100),

    prscrbr_type_src VARCHAR(100),

    brnd_name VARCHAR(255),

    gnrc_name VARCHAR(255),

    tot_clms INTEGER,

    tot_30day_fills NUMERIC(12,2),

    tot_day_suply INTEGER,

    tot_drug_cst NUMERIC(14,2),

    tot_benes INTEGER,

    ge65_sprsn_flag VARCHAR(10),

    ge65_tot_clms INTEGER,

    ge65_tot_30day_fills NUMERIC(12,2),

    ge65_tot_drug_cst NUMERIC(14,2),

    ge65_tot_day_suply INTEGER,

    ge65_bene_sprsn_flag VARCHAR(10),

    ge65_tot_benes INTEGER,

    ge65_claims_suppression_status VARCHAR(50),

    ge65_beneficiary_suppression_status VARCHAR(50)
);