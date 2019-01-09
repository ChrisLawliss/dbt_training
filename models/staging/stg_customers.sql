WITH customers AS (
    
    SELECT * FROM dbt_clawliss.customers_upload
    
),

customers_renamed AS (
    
    SELECT 
    
        id AS customer_id,
        created_at,
        accepts_marketing,
        nullif(email, '') AS email,
        nullif(first_name, '') AS first_name,
        nullif(last_name, '') AS last_name,
        nullif(gender, '') AS gender

    FROM customers
    
)

    SELECT * FROM customers_renamed