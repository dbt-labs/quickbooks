select
  --this id is only unique within a given purchase_id; may also want to create a globally unique id for this table.
  id::int,
  amount,
  {{ var('source_key_id_field') }}::int as purchase_id,
  nullif(accountbasedexpenselinedetail__classref__value::varchar, '')::bigint as class_id,
  accountbasedexpenselinedetail__accountref__value::int as account_id
from
  {{ var('base.purchases_line') }}
