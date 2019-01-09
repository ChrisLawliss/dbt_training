WITH orders AS (
    
    SELECT * FROM dbt_clawliss.orders_upload
    
),

orders_renamed AS (
    
    SELECT

        id AS order_id,
        customer_id,
        created_at,
        total,
        completed AS is_completed,
        nullif(email, '') AS email,
        nullif(ip_address, '') AS ip_address,
        nullif(street_address, '') AS street_address,
        nullif(billing_country_code, '') AS billing_country_code,
        nullif(referral_domain, '') AS referral_domain,
        nullif(referral_url, '') AS referral_url
    
    FROM orders

)

    SELECT * FROM orders_renamed
