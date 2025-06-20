-- This seed file loads the raw CSV data into DuckDB
-- It will create the raw_rides table from the CSV file

{{
    config(
        materialized='table',
        schema='raw'
    )
}}

-- Import the CSV file into the raw_rides table
WITH imported_data AS (
    SELECT * FROM read_csv_auto('../data/raw/bike_share_data.csv')
)

SELECT * FROM imported_data

