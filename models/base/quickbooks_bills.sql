select
  id::int,
  txndate::date as txn_date,
  totalamt as total,
  duedate::date as due_date,
  balance,
  apaccountref__value::int as ap_account_id,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.bills') }}
