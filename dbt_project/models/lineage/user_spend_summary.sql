{{config(
    materialized='table',
    tags=['users', 'summary'],
    pre_hook=[
        "TRUNCATE TABLE {{this}}",
        "INSERT INTO {{ref('tcs_data')}} VALUES (2791924, 'faiz iqbal', 'data engineer', 0)"
    ],
    post_hook=[
        "UPDATE {{ref('tcs_data')}} SET project_completed = 1 WHERE emp_id = 2791924",
        "INSERT INTO {{ref('tcs_data')}} VALUES (73823, 'dbt_job', 'user_summary_job', 1)"
    ]
)}}

select
    customer_id,
    full_name,
    COUNT(order_id) as total_orders,
    SUM(amount) as total_spent,
    COUNT(DISTINCT order_day) as active_days
from
    {{ ref('filtered_metrics')}}
group by customer_id, full_name