select
  id::int,
  totalamt as total_amt,
  txndate::date as txn_date,
  duedate::date as due_date,
  coalesce("balance#a9aa955728365cbc5e1a50509b220909",
    "balance#37d892cd51f93456dd393c30f4158740"::numeric(38,6)) as balance,
  einvoicestatus as e_status,
  ecloudstatustimestamp::datetime as e_status_timestamp,
  deliveryinfo__deliverytype as delivery_type,
  deliveryinfo__deliverytime::datetime as delivery_time,
  emailstatus as email_status,
  docnumber::int as doc_number,
  customerref__value::int as customer_id,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_invoices
