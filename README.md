# Bike Share Data Analysis Pipeline

## Overview
This project analyzes bike share data using dbt Core for transformation and Dagster for orchestration, with DuckDB as the database. The pipeline processes raw bike share trip data to generate meaningful insights on ride patterns, user behavior, and station popularity.

## Project Structure
```
bike_share_analysis/
├── data/raw/                   # Raw CSV data files
├── dbt_bike_share/            # dbt project
│   ├── models/                # dbt models
│   │   ├── staging/           # Initial data cleaning
│   │   ├── intermediate/      # Enriched data models
│   │   ├── marts/             # Business-facing models
│   │   └── macros/            # Custom macros
│   └── tests/                 # Data quality tests
├── dagster_bike_share/        # Dagster project
│   ├── assets/                # Data assets
│   ├── jobs/                  # Pipeline definitions
│   └── schedules/             # Schedule definitions
└── setup.sh                   # Setup script
```

## Prerequisites
- Python 3.8 or higher
- Git

## Setup Instructions

### 1. Clone the Repository
```bash
git clone <repository_url>
cd bike_share_analysis
```

### 2. Environment Setup
```bash
# For Linux/Mac
./setup.sh

# For Windows PowerShell
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install --upgrade pip
pip install -r requirements.txt
```

### 3. Data Preparation
Place the bike share CSV file in the `data/raw/` directory, named as `bike_share_data.csv`.

### 4. Run the Pipeline
```bash
# Activate the environment if not already activated
source venv/bin/activate  # Linux/Mac
.\venv\Scripts\Activate.ps1  # Windows

# Start Dagster webserver
dagster dev
```

Then open your browser and navigate to http://localhost:3000 to access the Dagster UI.

## Pipeline Components

### Data Ingestion (Dagster)
The pipeline starts by ingesting raw CSV data into a DuckDB database using a Dagster asset.

### Data Transformation (dbt)
The dbt models follow a layered architecture:

1. **Staging Layer**: Cleans and standardizes raw data
   - `stg_rides.sql`: Transforms raw ride data
   - `stg_stations.sql`: Extracts station information
   - `stg_users.sql`: Extracts user information

2. **Intermediate Layer**: Enriches and combines data
   - `int_rides_enriched.sql`: Enriches ride data with station and time information
   - `int_stations.sql`: Adds statistics to stations
   - `int_time.sql`: Creates a time dimension

3. **Mart Layer**: Creates business-facing models
   - `fact_rides_summary.sql`: Ride metrics and counts
   - `dim_stations.sql`: Station dimension
   - `dim_users.sql`: User dimension with demographics
   - `dim_time.sql`: Time dimension with date hierarchies

### Data Quality Tests
The project includes both schema tests and singular tests to ensure data quality and integrity.

## Business Insights
The transformed data enables several key insights:

### 1. Ride Activity Analysis
```sql
-- Daily ride patterns
SELECT 
    t.date, 
    t.day_name, 
    SUM(f.ride_count) AS total_rides,
    AVG(f.avg_trip_duration_min) AS avg_duration
FROM fact_rides_summary f
JOIN dim_time t ON f.time_key = t.time_key
GROUP BY t.date, t.day_name
ORDER BY t.date;

-- Peak hours identification
SELECT 
    t.hour, 
    SUM(f.ride_count) AS total_rides
FROM fact_rides_summary f
JOIN dim_time t ON f.time_key = t.time_key
GROUP BY t.hour
ORDER BY total_rides DESC;
```

### 2. User Behavior Analysis
```sql
-- User type comparison
SELECT 
    u.user_type, 
    COUNT(*) AS total_rides,
    AVG(f.avg_trip_duration_min) AS avg_duration
FROM fact_rides_summary f
JOIN dim_users u ON f.user_key = u.user_key
GROUP BY u.user_type;

-- Age group analysis
SELECT 
    u.age_group, 
    COUNT(*) AS total_rides,
    AVG(f.avg_trip_duration_min) AS avg_duration
FROM fact_rides_summary f
JOIN dim_users u ON f.user_key = u.user_key
GROUP BY u.age_group
ORDER BY total_rides DESC;
```

### 3. Station Popularity
```sql
-- Popular starting stations
SELECT 
    s.station_name, 
    s.latitude, 
    s.longitude,
    SUM(f.ride_count) AS total_departures
FROM fact_rides_summary f
JOIN dim_stations s ON f.start_station_id = s.station_id
GROUP BY s.station_name, s.latitude, s.longitude
ORDER BY total_departures DESC
LIMIT 10;

-- High traffic stations
SELECT
    station_name,
    latitude,
    longitude,# Bike Share Data Analysis Pipeline

## Overview
This project analyzes bike share data using dbt Core for transformation and Dagster for orchestration, with DuckDB as the database. The pipeline processes raw bike share trip data to generate meaningful insights on ride patterns, user behavior, and station popularity.

## Project Structure
```
bike_share_analysis/
├── data/raw/                   # Raw CSV data files
├── dbt_bike_share/            # dbt project
│   ├── models/                # dbt models
│   │   ├── staging/           # Initial data cleaning
│   │   ├── intermediate/      # Enriched data models
│   │   ├── marts/             # Business-facing models
│   │   └── macros/            # Custom macros
│   └── tests/                 # Data quality tests
├── dagster_bike_share/        # Dagster project
│   ├── assets/                # Data assets
│   ├── jobs/                  # Pipeline definitions
│   └── schedules/             # Schedule definitions
└── setup.sh                   # Setup script
```

## Prerequisites
- Python 3.8 or higher
- Git

## Setup Instructions

### 1. Clone the Repository
```bash
git clone <repository_url>
cd bike_share_analysis
```

### 2. Environment Setup
```bash
# For Linux/Mac
./setup.sh

# For Windows PowerShell
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install --upgrade pip
pip install -r requirements.txt
```

### 3. Data Preparation
Place the bike share CSV file in the `data/raw/` directory, named as `bike_share_data.csv`.

### 4. Run the Pipeline
```bash
# Activate the environment if not already activated
source venv/bin/activate  # Linux/Mac
.\venv\Scripts\Activate.ps1  # Windows

# Start Dagster webserver
dagster dev
```

Then open your browser and navigate to http://localhost:3000 to access the Dagster UI.

## Pipeline Components

### Data Ingestion (Dagster)
The pipeline starts by ingesting raw CSV data into a DuckDB database using a Dagster asset.

### Data Transformation (dbt)
The dbt models follow a layered architecture:

1. **Staging Layer**: Cleans and standardizes raw data
   - `stg_rides.sql`: Transforms raw ride data
   - `stg_stations.sql`: Extracts station information
   - `stg_users.sql`: Extracts user information

2. **Intermediate Layer**: Enriches and combines data
   - `int_rides_enriched.sql`: Enriches ride data with station and time information
   - `int_stations.sql`: Adds statistics to stations
   - `int_time.sql`: Creates a time dimension

3. **Mart Layer**: Creates business-facing models
   - `fact_rides_summary.sql`: Ride metrics and counts
   - `dim_stations.sql`: Station dimension
   - `dim_users.sql`: User dimension with demographics
   - `dim_time.sql`: Time dimension with date hierarchies

### Data Quality Tests
The project includes both schema tests and singular tests to ensure data quality and integrity.

## Business Insights
The transformed data enables several key insights:

### 1. Ride Activity Analysis
```sql
-- Daily ride patterns
SELECT 
    t.date, 
    t.day_name, 
    SUM(f.ride_count) AS total_rides,
    AVG(f.avg_trip_duration_min) AS avg_duration
FROM fact_rides_summary f
JOIN dim_time t ON f.time_key = t.time_key
GROUP BY t.date, t.day_name
ORDER BY t.date;

-- Peak hours identification
SELECT 
    t.hour, 
    SUM(f.ride_count) AS total_rides
FROM fact_rides_summary f
JOIN dim_time t ON f.time_key = t.time_key
GROUP BY t.hour
ORDER BY total_rides DESC;
```

### 2. User Behavior Analysis
```sql
-- User type comparison
SELECT 
    u.user_type, 
    COUNT(*) AS total_rides,
    AVG(f.avg_trip_duration_min) AS avg_duration
FROM fact_rides_summary f
JOIN dim_users u ON f.user_key = u.user_key
GROUP BY u.user_type;

-- Age group analysis
SELECT 
    u.age_group, 
    COUNT(*) AS total_rides,
    AVG(f.avg_trip_duration_min) AS avg_duration
FROM fact_rides_summary f
JOIN dim_users u ON f.user_key = u.user_key
GROUP BY u.age_group
ORDER BY total_rides DESC;
```

### 3. Station Popularity
```sql
-- Popular starting stations
SELECT 
    s.station_name, 
    s.latitude, 
    s.longitude,
    SUM(f.ride_count) AS total_departures
FROM fact_rides_summary f
JOIN dim_stations s ON f.start_station_id = s.station_id
GROUP BY s.station_name, s.latitude, s.longitude
ORDER BY total_departures DESC
LIMIT 10;

-- High traffic stations
SELECT
    station_name,
    latitude,
    longitude,
    total_traffic
FROM dim_stations
ORDER BY total_traffic DESC
LIMIT 10;
```

## Troubleshooting
- If you encounter issues with file paths, ensure you're using the correct path separators for your OS
- For DuckDB connection issues, check that the database file path is correctly specified
- For dbt errors, run `dbt debug` to diagnose configuration issues
