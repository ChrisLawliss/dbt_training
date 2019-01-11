with orders as (
    
    select * from {{ref('stg_orders')}}
),

prev_orders as (
    
    select 
        orders.order_id,
        lag(created_at, 1) over (partition by customer_id order by created_at) as prev_order_date,
        datediff(month, prev_order_date, orders.created_at) as months_since_prev_order
    from orders
    
)

select * from prev_orders 