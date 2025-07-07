{{ config(materialized='table') }}
{% set numbers= [10, 20, 30, 40, 50, 60] %}
select 
{% for num in numbers %}
    {{num}} as number_list
{% if not loop.last %}
union all
select
{% endif %}
{% endfor %}
