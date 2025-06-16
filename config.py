from dotenv import load_dotenv
from pathlib import Path

# Pastikan path mengarah ke file .env di root project
env_path = Path(__file__).resolve().parent / '.env'
load_dotenv(dotenv_path=env_path)

import os

DB_CONFIG = {
    'host': os.getenv('POSTGRES_HOST'),
    'port': int(os.getenv('POSTGRES_PORT')),  # Ini error kalau tidak ditemukan
    'database': os.getenv('POSTGRES_DB'),
    'user': os.getenv('POSTGRES_USER'),
    'password': os.getenv('POSTGRES_PASSWORD')
}

SCHEMA_NAME = os.getenv('SCHEMA_NAME')
UPDATED_DATE = os.getenv('UPDATED_DATE')
FOLDER_PATH = os.getenv('FOLDER_PATH')
APPLICATION_FILES = os.getenv('APPLICATION_FILES').split(',')