-- create tables--
--1. Dimesion Geography tabel ---
CREATE TABLE analytics.dim_geography (
    geography_key INTEGER
        GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    city VARCHAR(100) NOT NULL,

    state VARCHAR(2) NOT NULL,

    state_fips INTEGER NOT NULL,

    CONSTRAINT uq_dim_geography
        UNIQUE (city, state)
);

-- 2. create dimension provider table---

CREATE TABLE analytics.dim_provider (

    provider_key INTEGER
        GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    prscrbr_npi BIGINT NOT NULL,

    prscrbr_first_name VARCHAR(100) NOT NULL,

    prscrbr_last_org_name VARCHAR(150) NOT NULL,

    prscrbr_type VARCHAR(100) NOT NULL,

    geography_key INTEGER NOT NULL,

    CONSTRAINT uq_dim_provider_npi
        UNIQUE (prscrbr_npi),

    CONSTRAINT fk_provider_geography
        FOREIGN KEY (geography_key)
        REFERENCES analytics.dim_geography (geography_key)
);


--3. create table for the dimension drug

CREATE TABLE analytics.dim_drug (

    drug_key INTEGER
        GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    brand_name VARCHAR(255) NOT NULL,

    generic_name VARCHAR(255) NOT NULL,

    CONSTRAINT uq_dim_drug
        UNIQUE (brand_name, generic_name)
);

--4. create a table(associative entity) between provider and drug, 
--called Fact_Prescriptions

CREATE TABLE analytics.fact_prescriptions (

    prescription_fact_key BIGINT
        GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    provider_key INTEGER NOT NULL,

    drug_key INTEGER NOT NULL,

    tot_clms INTEGER,

    tot_30day_fills NUMERIC(12,2),

    tot_day_suply INTEGER,

    tot_drug_cst NUMERIC(14,2),

    tot_benes INTEGER,

    ge65_tot_clms INTEGER,

    ge65_tot_30day_fills NUMERIC(12,2),

    ge65_tot_day_suply INTEGER,

    ge65_tot_drug_cst NUMERIC(14,2),

    ge65_tot_benes INTEGER,

    ge65_metrics_suppression_status VARCHAR(50),

    ge65_beneficiary_suppression_status VARCHAR(50),

    CONSTRAINT fk_fact_provider
        FOREIGN KEY (provider_key)
        REFERENCES analytics.dim_provider(provider_key),

    CONSTRAINT fk_fact_drug
        FOREIGN KEY (drug_key)
        REFERENCES analytics.dim_drug(drug_key),

    CONSTRAINT uq_fact_provider_drug
        UNIQUE(provider_key, drug_key)
);

--alter dim_provider

ALTER TABLE analytics.dim_provider
ADD COLUMN prscrbr_type_src VARCHAR(100) NOT NULL;

ALTER TABLE analytics.dim_geography
ALTER COLUMN state_fips TYPE VARCHAR(10);
