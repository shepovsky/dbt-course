{% test expect_column_values_to_be_between_with_tolerance(
        model
        , column_name
        , min_value
        , max_value
        , tolerance_percent) %}

WITH counts AS (
    SELECT COUNT(*) AS total
    , SUM(  CASE 
                WHEN {{ column_name }} < {{ min_value }} 
                    OR {{ column_name }} > {{ max_value }}
                THEN 1 ELSE 0
            END
        ) AS outside_count
    FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
)

SELECT *
FROM counts
WHERE (outside_count * 1.0) / total > {{ tolerance_percent}}

{% endtest %}