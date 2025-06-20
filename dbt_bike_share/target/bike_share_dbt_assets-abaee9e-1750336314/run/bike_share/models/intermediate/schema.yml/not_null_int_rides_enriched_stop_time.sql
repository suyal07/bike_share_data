select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select stop_time
from "bike_share"."main"."int_rides_enriched"
where stop_time is null



      
    ) dbt_internal_test