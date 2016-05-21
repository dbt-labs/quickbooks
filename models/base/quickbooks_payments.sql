select
  id::int,
  totalamt as total,
  txndate::date as txn_date,
  txnsource as txn_source,
  coalesce("unappliedamt#dffe97a088445c344ddd9f50e716fd0b",
    "unappliedamt#2ac8f5125b37d58cfacf9f3cc3611ac5"::numeric(38,6)) as unapplied_amt,
  creditcardpayment__creditchargeinfo__processpayment as cc_pmt_processed,
  processpayment as payment_processed,
  deposittoaccountref__value::int as account_id,
  customerref__value::int as customer_id,
  paymentmethodref__value::int as payment_method_id,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_payments
