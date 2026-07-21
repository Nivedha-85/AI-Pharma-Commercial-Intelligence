SELECT COUNT(*)
FROM staging.stg_partd_prescriptions;

ALTER TABLE staging.stg_partd_prescriptions
ALTER COLUMN prscrbr_state_fips TYPE VARCHAR(10);