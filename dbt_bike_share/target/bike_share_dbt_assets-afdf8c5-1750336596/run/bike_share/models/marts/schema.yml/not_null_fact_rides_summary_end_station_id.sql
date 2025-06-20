select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select end_station_id
from "bike_share"."main"."fact_rides_summary"
where end_station_id is null



      
    ) dbt_internal_test