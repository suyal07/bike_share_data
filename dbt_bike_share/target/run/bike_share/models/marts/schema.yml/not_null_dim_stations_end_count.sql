select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select end_count
from "bike_share"."main"."dim_stations"
where end_count is null



      
    ) dbt_internal_test