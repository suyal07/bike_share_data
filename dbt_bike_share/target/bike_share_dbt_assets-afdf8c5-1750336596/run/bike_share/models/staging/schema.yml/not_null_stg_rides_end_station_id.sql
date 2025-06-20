select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select end_station_id
from "bike_share"."main"."stg_rides"
where end_station_id is null



      
    ) dbt_internal_test