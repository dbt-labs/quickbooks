select
  --this id is only unique within a given purchase_id; may also want to create a globally unique id for this table.
  id::int,
  amount,
  _rjm_source_key_id::int as purchase_id,
  accountbasedexpenselinedetail__accountref__value::int as account_id
from
  rb_qbo_integration.quickbooks_purchases__line
