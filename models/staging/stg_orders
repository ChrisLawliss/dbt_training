SELECT
id AS order_id,
nullif(email,''),
customer_id,
created_at,
total,
completed AS is_completed,
nullif(ip_address,''),
nullif(street_address,''),
nullif(billing_country_code,''),
nullif(referral_domain,''),
nullif(referral_url,'')
FROM dbt_clawliss.orders_upload
