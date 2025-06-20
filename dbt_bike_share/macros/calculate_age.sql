{% macro calculate_age(birth_year) %}
    CASE
        WHEN {{ birth_year }} IS NULL OR {{ birth_year }} = 0 THEN NULL
        ELSE DATE_PART('year', CURRENT_DATE()) - {{ birth_year }}
    END
{% endmacro %}
