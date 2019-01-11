with orders as (
    
    select * from {{ref('stg_orders')}}
),

prev_orders as (
    
    select 
        orders.*,
        lag(created_at) over (partition by customer_id order by created_at) as prev_order_date,
        datediff(day, prev_order_date, created_at) as days_since_prev_order
    from orders
    
)

select * from prev_orders 