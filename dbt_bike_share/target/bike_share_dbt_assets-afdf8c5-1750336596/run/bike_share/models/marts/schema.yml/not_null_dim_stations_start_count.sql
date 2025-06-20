select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select start_count
from "bike_share"."main"."dim_stations"
where start_count is null



      
    ) dbt_internal_test