import pandas as pd
from config import engine

df = pd.read_csv(
    "../data/processed/cms_partd_clean.csv",
    dtype={"prscrbr_state_fips": str},
    low_memory=False
)

print(df.loc[
    (df["prscrbr_city"] == "Victorville") &
    (df["prscrbr_state_abrvtn"] == "CA"),
    ["prscrbr_city", "prscrbr_state_abrvtn", "prscrbr_state_fips"]
].drop_duplicates())

print(f"Loaded {len(df)} rows from CSV.")

df.to_sql(
    name="stg_partd_prescriptions",
    schema="staging",
    con=engine,
    if_exists="append",
    index=False,
    chunksize=5000,
    method="multi"
)

print("Data loaded into staging successfully!")