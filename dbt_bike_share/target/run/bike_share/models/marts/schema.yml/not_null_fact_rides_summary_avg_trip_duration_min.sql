select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select avg_trip_duration_min
from "bike_share"."main"."fact_rides_summary"
where avg_trip_duration_min is null



      
    ) dbt_internal_test