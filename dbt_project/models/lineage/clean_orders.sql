{{config(
    materialized='view',
    tags=['orders', 'daily']
)}}


SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    amount,
    payment_method
FROM
    {{ source('my_source', 'orders_raw')}}
WHERE order_status!= 'CANCELLED'