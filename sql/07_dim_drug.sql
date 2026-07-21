INSERT INTO analytics.dim_drug
(
    brand_name,
    generic_name
)
SELECT DISTINCT
    brnd_name,
    gnrc_name
FROM staging.stg_partd_prescriptions;

SELECT COUNT(*)
FROM analytics.dim_drug;