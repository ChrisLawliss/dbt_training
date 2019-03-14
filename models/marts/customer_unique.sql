with customers as (
    
    select * from {{ref('stg_customers')}}
    
)

select
    *,
    ({{dbt_utils.surrogate_key('customer_id','created_at')}}) as unique_id
    
from customers 