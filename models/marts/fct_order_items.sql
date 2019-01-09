WITH orders AS (
    SELECT * from {{ref('stg_orders')}}
),
    order_items AS (
      SELECT * FROM {{ref('stg_order_items')}}
    ),
    customers AS (
      SELECT * FROM {{ref('stg_customers')}}
    ),
    fct_order_items AS (
      SELECT order_items.*,
             orders.created_at AS order_date,
             customers.email,
             customers.customer_id
      FROM order_items
      JOIN orders ON orders.order_id = order_items.order_id
      JOIN customers ON customers.customer_id = orders.customer_id
    )
    SELECT * FROM fct_order_items