{% macro debug_cols(model) %}
{% for col in adapter.get_columns_in_relation(model) %}
{{ col.name }} => {{ col.data_type }}
{% endfor %}
{% endmacro %}