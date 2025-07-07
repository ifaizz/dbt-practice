{{ config(materialized='table') }}
select
{% for i in range(1, 11) %}
    {{i}} as num_{{i}} {% if not loop.last %} , {% endif %}
{% endfor %}