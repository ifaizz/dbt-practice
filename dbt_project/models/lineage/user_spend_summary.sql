select
    customer_id,
    full_name,
    COUNT(order_id) as total_orders,
    SUM(amount) as total_spent,
    COUNT(DISTINCT order_day) as active_days
from
    {{ ref('filtered_metrics')}}
group by customer_id, full_name