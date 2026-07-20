import requests
import pandas as pd
from pathlib import Path

DATASET_ID = "d5aa71a8-dcc0-4570-8bcf-bd39deac69fe"

BASE_URL = f"https://data.cms.gov/data-api/v1/dataset/{DATASET_ID}/data"

PAGE_SIZE = 5000
MAX_ROWS = 500000

OUTPUT_FILE = Path("/Users/nivedha/AI-Pharma-Commercial-Intelligence/data/raw/cms_partd_raw.csv")


def fetch_batch(offset: int, size: int = PAGE_SIZE):
    """
    Fetch a batch of records from the CMS API.
    """
    params = {
        "size": size,
        "offset": offset
    }

    response = requests.get(BASE_URL, params=params)
    response.raise_for_status()

    return response.json()
    

def save_batch(batch, output_file, write_header=False):
    """
    Save one batch of records to a CSV file.
    """

    df = pd.DataFrame(batch)

    df.to_csv(
        output_file,
        mode="w" if write_header else "a",
        header=write_header,
        index=False
    )

def download_dataset():
    offset = 0
    first_batch = True

    while offset < MAX_ROWS:

        print(f"Fetching records {offset:,} to {offset + PAGE_SIZE:,}...")

        batch = fetch_batch(offset)

        if not batch:
            print("No more records found.")
            break

        save_batch(
            batch=batch,
            output_file=OUTPUT_FILE,
            write_header=first_batch
        )

        first_batch = False
        offset += PAGE_SIZE

        print(f"Downloaded {min(offset, MAX_ROWS):,} records\n")

    print("Download completed successfully!")


if __name__ == "__main__":
    download_dataset()