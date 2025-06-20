select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select longitude
from "bike_share"."main"."int_stations"
where longitude is null



      
    ) dbt_internal_test