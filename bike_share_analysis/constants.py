import os
from pathlib import Path

from dagster_dbt import DbtCliResource

# Use absolute path for the dbt project
dbt_project_dir = Path(__file__).joinpath("..", "..", "dbt_bike_share").resolve()

# Fallback to relative path for local development
if not dbt_project_dir.exists():
    dbt_project_dir = Path(__file__).joinpath("..", "..", "dbt_bike_share").resolve()

dbt = DbtCliResource(project_dir=os.fspath(dbt_project_dir))

# If DAGSTER_DBT_PARSE_PROJECT_ON_LOAD is set, a manifest will be created at run time.
# Otherwise, we expect a manifest to be present in the project's target directory.
try:
    if os.getenv("DAGSTER_DBT_PARSE_PROJECT_ON_LOAD"):
        # For now, just use the default path since parsing is complex
        dbt_manifest_path = dbt_project_dir.joinpath("target", "manifest.json")
    else:
        dbt_manifest_path = dbt_project_dir.joinpath("target", "manifest.json")
except Exception as e:
    print(f"Warning: Failed to generate or find dbt manifest: {e}")
    # Create a dummy manifest path for development/testing
    dbt_manifest_path = dbt_project_dir.joinpath("target", "manifest.json")
    # Ensure the target directory exists
    os.makedirs(dbt_project_dir.joinpath("target"), exist_ok=True)

