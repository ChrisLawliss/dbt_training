with orders as (
    
    select * from dbt_clawliss.orders_upload
    
),

orders_renamed as (
    
    select
        id as order_id,
        customer_id,
        created_at,
        total,
        completed as is_completed,
        nullif(email, '') as email,
        nullif(ip_address, '') as ip_address,
        nullif(street_address, '') as street_address,
        nullif(billing_country_code, '') as billing_country_code,
        nullif(referral_domain, '') as referral_domain,
        nullif(referral_url, '') as referral_url
        
    from orders

)

select * from orders_renamed
