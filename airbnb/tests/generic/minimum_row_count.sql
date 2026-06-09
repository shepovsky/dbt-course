{% test minimum_row_count(model, min_row_count) %}
{{ config(severity = 'error') }}

SELECT COUNT(*) AS cnt
FROM {{ model }}
HAVING COUNT(*) < {{ min_row_count }}
{% endtest %}