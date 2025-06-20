select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select bike_id
from "bike_share"."main"."int_rides_enriched"
where bike_id is null



      
    ) dbt_internal_test