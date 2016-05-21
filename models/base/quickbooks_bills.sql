select
  id::int,
  txndate::date as txn_date,
  totalamt as total,
  duedate::date as due_date,
  coalesce("balance#a9aa955728365cbc5e1a50509b220909",
    "balance#37d892cd51f93456dd393c30f4158740"::numeric(38,6)) as balance,
  apaccountref__value::int as ap_account_id,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_bills
