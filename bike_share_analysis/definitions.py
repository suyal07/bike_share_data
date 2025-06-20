import os
from pathlib import Path

from dagster import Definitions
from dagster_dbt import DbtCliResource

from .assets import bike_share_dbt_assets, raw_rides
from .constants import dbt_project_dir
from .schedules import schedules

# Get the project root directory for profiles
project_root = Path(__file__).parent.parent

defs = Definitions(
    assets=[raw_rides, bike_share_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(
            project_dir=os.fspath(dbt_project_dir),
            profiles_dir=os.fspath(project_root),
            global_config_flags=["--profiles-dir", os.fspath(project_root)]
        ),
    },
)

