{% macro learn_variables() %}

    {% set my_name_jinja = 'Vasya' %}
    {{ log("Hello, " ~ my_name_jinja, info=True) }}a
    {{ log("Hello, dbt user, " ~ var("user_name", "UNKNOWN_HREN") ~ "!", info=True) }}

{% endmacro %}