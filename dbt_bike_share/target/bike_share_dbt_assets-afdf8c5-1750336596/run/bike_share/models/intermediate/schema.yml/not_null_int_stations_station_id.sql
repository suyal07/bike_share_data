select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select station_id
from "bike_share"."main"."int_stations"
where station_id is null



      
    ) dbt_internal_test