with orders as (
    
select * from {{ref('stg_orders')}}
    
),

order_items as (
        
    select * from {{ref('stg_order_items')}}
      
),
    
customers as (
        
    select * from {{ref('stg_customers')}}
      
),
    
fct_order_items as (
        
select order_items.*,
    orders.created_at as order_date,
    customers.email,
    customers.customer_id
from order_items
left join orders using (order_id)
left join customers using (customer_id)
      
)
    
select * from fct_order_items