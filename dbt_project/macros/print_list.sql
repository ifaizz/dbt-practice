{% macro print_list_strings() %}
{% set list= ["Faiz", "Roson", "Nitesh", "Abhishek", "Shivam", "Swain"] %}
    {% for name in list %}
        {{log(loop.index ~ " - "~ name, info=true)}}
    {%endfor%}
{%endmacro%}

{% macro generate_list_nums(start, end) %}
    {% set list= [] %}
    {% for i in range(start, end+1) %}
        {% do list.append(i) %}
    {% endfor %}
    {% for x in list %}
        {{ log(x, info=true) }}
    {% endfor %}
{% endmacro %}