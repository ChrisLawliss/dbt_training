SELECT
id as order_items_id,
order_id,
price,
quantity,
nullif(size,''),
nullif(color,''),
nullif(product_id,'')
FROM dbt_clawliss.order_items_upload