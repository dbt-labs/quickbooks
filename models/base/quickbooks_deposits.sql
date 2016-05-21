select
  id::int,
  totalamt as total,
  txndate::date as txn_date,
  deposittoaccountref__value::int as account_id,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_deposits
