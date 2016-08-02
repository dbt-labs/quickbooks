select
  --only unique within a given bill_id
  id::int,
  amount,
  _rjm_source_key_id::int as bill_id,
  accountbasedexpenselinedetail__accountref__value::int as account_id
from
  quickbooks.quickbooks_bills__line
