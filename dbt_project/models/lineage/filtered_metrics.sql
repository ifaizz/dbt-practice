{{config(
    materialized='view',
    tags=['users', 'premium']
)}}

select
    customer_id,
    full_name,
    order_id,
    amount,
    payment_method,
    user_type,
    order_date,
    DAYNAME(order_date) as order_day
from
{{ ref('joined_users_orders') }}
where user_type = 'premium'