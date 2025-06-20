select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ride_count
from "bike_share"."main"."fact_rides_summary"
where ride_count is null



      
    ) dbt_internal_test