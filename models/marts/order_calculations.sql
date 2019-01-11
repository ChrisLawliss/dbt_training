with orders as (
    
    select * from {{ref('stg_orders')}}
),

prev_orders as (
    
    select 
        orders.order_id,
        lag(created_at) over (partition by customer_id order by created_at) as prev_order_date
    
    from orders
    
),

final_orders as (
    
    select 
        orders.*,
        datediff(day, prev_orders.prev_order_date, created_at) as days_since_prev_order
    
    from orders
    left join prev_orders using (order_id)
)

select * from final_orders