select
  id::int,
  totalamt as total,
  txndate::date as txn_date,
  --txnsource as txn_source,
  unappliedamt as unapplied_amt,
  --creditcardpayment__creditchargeinfo__processpayment as cc_pmt_processed,
  processpayment as payment_processed,
  nullif(deposittoaccountref__value::varchar, '')::int as account_id,
  customerref__value::int as customer_id,
  nullif(paymentmethodref__value::varchar, '')::int as payment_method_id,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.payments') }}
