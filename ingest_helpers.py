# ingest_helpers.py

import pandas as pd
import os

def load_excel_sheets(file_path):
    """Load all sheets from Excel file into a dict of DataFrames."""
    return pd.read_excel(file_path, sheet_name=None, engine='openpyxl')

def standardize_columns(df: pd.DataFrame):
    """Standardize column names to lowercase with underscores."""
    df.columns = (
        df.columns.astype(str)  # tambahkan ini agar semua kolom jadi string dulu
        .str.strip()
        .str.lower()
        .str.replace(' ', '_')
        .str.replace('[^a-z0-9_]', '', regex=True)
    )
    return df