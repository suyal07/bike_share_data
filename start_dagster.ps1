# Start Dagster Development Server
# This script sets up the environment and starts the Dagster development server

Write-Host "Starting Dagster Development Server..." -ForegroundColor Green

# Navigate to the project directory
Set-Location "C:\Users\Parth Suyal\Desktop\bike_share_analysis"

# Activate the virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Yellow
& ".\venv\Scripts\activate.ps1"

# Set the DAGSTER_HOME environment variable to the absolute path
$dagsterHome = Resolve-Path "dagster_home"
$env:DAGSTER_HOME = $dagsterHome.Path
Write-Host "DAGSTER_HOME set to: $env:DAGSTER_HOME" -ForegroundColor Yellow

# Start Dagster development server
Write-Host "Starting Dagster server..." -ForegroundColor Yellow
Write-Host "The Dagster UI will be available at: http://127.0.0.1:3000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Red

dagster dev --module-name bike_share_analysis

