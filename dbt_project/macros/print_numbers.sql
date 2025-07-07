{% macro print_numbers(n) %}
    {{ log("Task 1 : Print Numbers", info=true) }}
    {% for i in range(1, n+1) %}
        {{ log(i, info=true) }}
    {% endfor %}
{% endmacro %}