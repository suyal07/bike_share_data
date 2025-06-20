# Dagster Setup - Bike Share Analysis

## Problem Solved

The main issue was that **Dagster requires an absolute path for the `DAGSTER_HOME` environment variable**, but it was being set to a relative path (`"dagster_home"`).

### Error Fixed
```
DagsterInvariantViolationError: $DAGSTER_HOME "dagster_home" must be an absolute path. 
Dagster requires this environment variable to be set to an existing directory in your filesystem.
```

## Solution

### 1. Set Correct DAGSTER_HOME
The `DAGSTER_HOME` environment variable must be set to the **absolute path** of the dagster_home directory:

```powershell
$env:DAGSTER_HOME = "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dagster_home"
```

### 2. Configuration Files Created
- ✅ `dagster_home/dagster.yaml` - Instance configuration
- ✅ `start_dagster.ps1` - PowerShell script to start Dagster
- ✅ `start_dagster.bat` - Batch file to start Dagster

## How to Start Dagster

### Option 1: Use the Start Scripts (Recommended)
Run either of these scripts from the project directory:

**PowerShell:**
```powershell
.\start_dagster.ps1
```

**Command Prompt:**
```cmd
start_dagster.bat
```

### Option 2: Manual Commands
```powershell
# Navigate to project directory
cd "C:\Users\Parth Suyal\Desktop\bike_share_analysis"

# Activate virtual environment
.\venv\Scripts\activate.ps1

# Set DAGSTER_HOME to absolute path
$env:DAGSTER_HOME = "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dagster_home"

# Start Dagster
dagster dev --module-name bike_share_analysis
```

## Accessing the Dagster UI

Once started, the Dagster UI will be available at:
**http://127.0.0.1:3000**

## Testing Asset Materialization

You can test individual assets from the command line:

```powershell
# Make sure DAGSTER_HOME is set correctly
$env:DAGSTER_HOME = "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dagster_home"

# Materialize the raw_rides asset
dagster asset materialize --select raw_rides --module-name bike_share_analysis
```

## Project Structure

```
bike_share_analysis/
├── bike_share_analysis/          # Main Python package
│   ├── __init__.py               # Package initialization
│   ├── definitions.py            # Dagster definitions
│   ├── assets.py                 # Asset definitions
│   ├── constants.py              # Project constants
│   └── schedules.py              # Schedule definitions
├── dagster_home/                 # Dagster instance directory
│   ├── dagster.yaml             # Instance configuration
│   ├── storage/                 # Run and event storage
│   └── logs/                    # Compute logs
├── dbt_bike_share/              # dbt project
├── venv/                        # Virtual environment
├── start_dagster.ps1           # PowerShell start script
├── start_dagster.bat           # Batch start script
└── pyproject.toml              # Project configuration
```

## Assets Available

1. **raw_rides** - Sample bike share ride data
2. **bike_share_dbt_assets** - dbt models for data transformation

## What's Working Now

✅ Dagster server starts successfully  
✅ Assets can be materialized  
✅ dbt integration is configured  
✅ Web UI is accessible  
✅ Data is being stored in DuckDB  

## Next Steps

1. **Start Dagster**: Use one of the start scripts
2. **Open UI**: Navigate to http://127.0.0.1:3000
3. **Materialize Assets**: Use the UI to run your data pipeline
4. **View Results**: Check the materialized assets and their lineage

## Troubleshooting

If you encounter issues:

1. **Check DAGSTER_HOME**: Ensure it's set to the absolute path
2. **Virtual Environment**: Make sure the venv is activated
3. **Port Conflicts**: If port 3000 is busy, Dagster will use an alternative port
4. **File Permissions**: Ensure the dagster_home directory is writable

## Support

The system is now fully functional. The main configuration issue has been resolved, and all components are working together properly.

