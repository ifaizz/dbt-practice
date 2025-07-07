{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
)}}

SELECT 
    order_id,
    customer_id,
    amount, 
    order_date
FROM {{source('my_source', 'orders_raw')}}
{% if is_incremental() %}
WHERE order_date > (SELECT MAX(order_date) FROM {{this}})
{% endif %}