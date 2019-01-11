with customers as (
    
    select * from {{ref('customers_upload')}}
    
),

customers_renamed as (
    
    select 
        id as customer_id,
        created_at,
        accepts_marketing,
        nullif(email, '') as email,
        nullif(first_name, '') as first_name,
        nullif(last_name, '') as last_name,
        nullif(gender, '') as gender
        
    from customers
        
)

select * from customers_renamed