select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select date
from "bike_share"."main"."fact_rides_summary"
where date is null



      
    ) dbt_internal_test