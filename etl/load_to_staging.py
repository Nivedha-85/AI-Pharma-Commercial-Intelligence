import pandas as pd
from config import engine

df = pd.read_csv("../data/processed/cms_partd_clean.csv")

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