SELECT current_database(), version();

SELECT current_database();


-- ============================================
-- Create Schemas
-- AI-Pharma-Commercial-Intelligence
-- ============================================

CREATE SCHEMA staging;

CREATE SCHEMA analytics;

CREATE SCHEMA reporting;


SELECT current_user;