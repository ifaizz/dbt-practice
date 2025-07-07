{% macro generate_tcs_mail(full_name) %}
    {% set name= full_name | trim %}
    {% set name= name.lower().split(" ") %}
    {% set username= name | join(".") %}
    {% set email= username~"@tcs.com" %}
    {{log(email, info=true)}}
{% endmacro %}

{% macro sum_of_digits(num) %}
    {% set num_string= num | string %}
    {% set ns= namespace(total=0) %}
    {% for digit in num_string %}
        {% set ns.total= ns.total + digit | int %}
    {% endfor %}
    {{log("Sum of Digits : "~ns.total, info=true)}}
{% endmacro %}

{% macro print_dates() %}
    {% set today= modules.datetime.date.today() %}
    {% set probation_end_date= today + modules.datetime.timedelta(days=90) %}
    {{log("Today is : "~today, info=true)}}
    {{log("Your probation will end on : "~probation_end_date, info=true)}}
{% endmacro %}


