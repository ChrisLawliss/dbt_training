WITH order_items AS (
    
    SELECT * FROM dbt_clawliss.order_items_upload
    
),

order_items_renamed AS (
    
    SELECT
    
        id as order_items_id,
        order_id,
        price,
        quantity,
        nullif(size, '') AS size,
        nullif(color, '') AS color,
        nullif(product_id, '') AS product_id
        
    FROM order_items
    
)

    SELECT * from order_items_renamed