{% macro get_active_premium_users() %}
    select user_id, full_name, email
    from {{ source('my_source', 'users') }}
    where is_active = true and user_type = 'premium'
{% endmacro %}