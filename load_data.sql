-- Create raw schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS raw;

-- Drop the table if it exists
DROP TABLE IF EXISTS raw.raw_rides;

-- Import the CSV file into the raw_rides table
CREATE TABLE raw.raw_rides AS 
SELECT * FROM read_csv_auto('data/raw/bike_share_data.csv');

-- Verify data was loaded
SELECT COUNT(*) FROM raw.raw_rides;

