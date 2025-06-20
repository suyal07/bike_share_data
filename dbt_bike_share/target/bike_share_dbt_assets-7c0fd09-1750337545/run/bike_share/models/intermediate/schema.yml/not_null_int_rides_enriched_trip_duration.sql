select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select trip_duration
from "bike_share"."main"."int_rides_enriched"
where trip_duration is null



      
    ) dbt_internal_test