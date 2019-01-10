with order_items as (
    
    select * from dbt_clawliss.order_items_upload
    
),

order_items_renamed as (
    
select
    id as order_items_id,
    order_id,
    price,
    quantity,
    nullif(size, '') as size,
    nullif(color, '') as color,
    nullif(product_id, '') as product_id    
from order_items

)

    select * from order_items_renamed