select
  --only unique within a given bill_id
  id::int,
  amount,
  {{ var('source_key_id_field') }} as bill_id,
  nullif(accountbasedexpenselinedetail__classref__value::varchar, '')::bigint as class_id,
  accountbasedexpenselinedetail__accountref__value::int as account_id
from
  {{ var('base.bills_line') }}
