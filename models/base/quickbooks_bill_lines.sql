select
  --only unique within a given bill_id
  id::int,
  amount,
  {{ var('source_key_id_field') }} as bill_id,
  {% if var('uses_classes') == "true" %}
    nullif(accountbasedexpenselinedetail__classref__value::varchar, '')::bigint as class_id,
  {% endif %}
  accountbasedexpenselinedetail__accountref__value::int as account_id
from
  {{ var('base.bills_line') }}
