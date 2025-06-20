@echo off
echo Starting Dagster Development Server...
cd /d "C:\Users\Parth Suyal\Desktop\bike_share_analysis"

echo Activating virtual environment...
call venv\Scripts\activate.bat

echo Setting DAGSTER_HOME...
set DAGSTER_HOME=C:\Users\Parth Suyal\Desktop\bike_share_analysis\dagster_home

echo DAGSTER_HOME set to: %DAGSTER_HOME%
echo.
echo Starting Dagster server...
echo The Dagster UI will be available at: http://127.0.0.1:3000
echo Press Ctrl+C to stop the server
echo.

dagster dev --module-name bike_share_analysis
pause

