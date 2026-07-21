-- ===========================================
-- FACT TABLE INDEXES
-- ===========================================

CREATE INDEX idx_fact_provider_key
ON analytics.fact_prescriptions(provider_key);

CREATE INDEX idx_fact_drug_key
ON analytics.fact_prescriptions(drug_key);

-- ===========================================
-- DIMENSION INDEXES
-- ===========================================

CREATE INDEX idx_provider_npi
ON analytics.dim_provider(prscrbr_npi);

CREATE INDEX idx_drug_brand
ON analytics.dim_drug(brand_name);

CREATE INDEX idx_geography_state
ON analytics.dim_geography(state_abbreviation);