select
  --only unique within a given bill_id
  id::int,
  amount,
  {{ var('source_key_id_field') }} as bill_id,
  case
    when {{ var('uses_classes') }} = true
      then nullif(accountbasedexpenselinedetail__classref__value::varchar, '')::bigint
    else
      null::bigint
  end as class_id,
  accountbasedexpenselinedetail__accountref__value::int as account_id
from
  {{ var('base.bills_line') }}
