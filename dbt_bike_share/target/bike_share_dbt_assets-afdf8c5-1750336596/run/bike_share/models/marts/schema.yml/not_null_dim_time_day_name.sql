select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select day_name
from "bike_share"."main"."dim_time"
where day_name is null



      
    ) dbt_internal_test