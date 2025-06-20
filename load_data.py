import duckdb
import os

# Get the current directory
current_dir = os.path.dirname(os.path.abspath(__file__))

# Connect to the DuckDB database (use .duckdb extension to match dbt profile)
db_path = os.path.join(current_dir, 'dbt_bike_share', 'bike_share.duckdb')
conn = duckdb.connect(db_path)

# Drop the table if it exists (use main schema as expected by dbt sources)
conn.execute("DROP TABLE IF EXISTS main.raw_rides")

# Load the CSV data into the table in main schema
csv_path = os.path.join(current_dir, 'data', 'raw', 'bike_share_data.csv')
conn.execute(f"CREATE TABLE main.raw_rides AS SELECT * FROM read_csv_auto('{csv_path}')")

# Verify the data was loaded
result = conn.execute("SELECT COUNT(*) FROM main.raw_rides").fetchone()
print(f"Loaded {result[0]} rows into main.raw_rides")

# Show sample of column names to verify structure
columns_result = conn.execute("PRAGMA table_info('main.raw_rides')").fetchall()
print("Table columns:")
for col in columns_result:
    print(f"  {col[1]} ({col[2]})")

# Show first few rows
print("\nSample data:")
sample_data = conn.execute("SELECT * FROM main.raw_rides LIMIT 3").fetchall()
for i, row in enumerate(sample_data, 1):
    print(f"Row {i}: {row[:5]}...")  # Show first 5 columns of each row

# Close the connection
conn.close()

print("\nData loading complete!")

