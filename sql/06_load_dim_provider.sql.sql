INSERT INTO analytics.dim_provider
(
    prscrbr_npi,
    prscrbr_first_name,
    prscrbr_last_org_name,
    prscrbr_type,
    geography_key,
    prscrbr_type_src
)
SELECT DISTINCT ON (s.prscrbr_npi)
    s.prscrbr_npi,
    s.prscrbr_first_name,
    s.prscrbr_last_org_name,
    s.prscrbr_type,
    g.geography_key,
    s.prscrbr_type_src
FROM staging.stg_partd_prescriptions s
JOIN analytics.dim_geography g
    ON s.prscrbr_city = g.city
   AND s.prscrbr_state_abrvtn = g.state_abbreviation
ORDER BY
    s.prscrbr_npi;