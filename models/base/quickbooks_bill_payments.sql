select
  id::int,
  totalamt as total,
  txndate::date as txn_date,
  vendorref__value::int as vendor_id,
  coalesce(creditcardpayment__ccaccountref__value::int,
    checkpayment__bankaccountref__value::int) as payment_account_id,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_billpayments
