{% snapshot users_snapshot %}

{{config(
    target_schema='DBT_DE_USER_S02668',
    unique_key='user_id',
    strategy='check',
    check_cols=['full_name', 'email', 'user_type', 'is_active']
)}}

SELECT 
    user_id, 
    full_name,
    email,
    user_type,
    is_active
FROM {{source('my_source', 'users')}}

{% endsnapshot %}