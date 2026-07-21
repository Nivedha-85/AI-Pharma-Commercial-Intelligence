INSERT INTO analytics.dim_geography
(
    city,
    state_abbreviation,
    state_fips
)
SELECT DISTINCT ON (prscrbr_city, prscrbr_state_abrvtn)
       prscrbr_city,
       prscrbr_state_abrvtn,
       prscrbr_state_fips
FROM staging.stg_partd_prescriptions
ORDER BY
    prscrbr_city,
    prscrbr_state_abrvtn,
    prscrbr_state_fips;


SELECT * FROM analytics.dim_geography limit 10;

-- TRUNCATE TABLE analytics.dim_geography RESTART IDENTITY;

-- TRUNCATE TABLE
--     analytics.fact_prescriptions,
--     analytics.dim_provider,
--     analytics.dim_drug,
--     analytics.dim_geography
-- RESTART IDENTITY CASCADE;
