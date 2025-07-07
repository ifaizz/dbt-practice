{% macro get_env_var(var) %}
    {{ log(env_var(var, 'fallback_val'), info=true) }}
{% endmacro %}