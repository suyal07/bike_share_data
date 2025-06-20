select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_traffic
from "bike_share"."main"."int_stations"
where total_traffic is null



      
    ) dbt_internal_test