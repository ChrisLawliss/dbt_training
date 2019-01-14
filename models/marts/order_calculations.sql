with orders as (
    
    select * from {{ref('stg_orders')}}
),

prev_orders as (
    
    select 
        *,
        lag(created_at) over (partition by customer_id order by created_at) as prev_order_date
    
    from orders
    
),

final_orders as (
    
    select 
        *,
        datediff(day, prev_orders.prev_order_date, created_at) as days_since_prev_order
    
    from prev_orders
)

select * from final_orders