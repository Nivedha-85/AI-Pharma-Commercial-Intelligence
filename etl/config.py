from sqlalchemy import create_engine

DB_USER = "nivedha"
DB_PASSWORD = "1234567"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "pharma_db"

engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)