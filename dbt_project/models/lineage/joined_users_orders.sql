{{config(
    materialized='view',
    tags=['users', 'orders']
)}}

select 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.amount,
    o.payment_method,
    u.full_name,
    u.email,
    u.user_type
from
{{ref('clean_orders')}} o
left join
{{source('my_source', 'users')}} u
on o.customer_id = u.user_id