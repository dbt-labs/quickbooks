select
  id::int,
  totalamt as total,
  txndate::date as txn_date,
  deposittoaccountref__value::int as account_id,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.deposits') }}
