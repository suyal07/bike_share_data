select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select trip_duration_in_min
from "bike_share"."main"."int_rides_enriched"
where trip_duration_in_min is null



      
    ) dbt_internal_test