select
  id::int,
  totalamt as total_amt,
  txndate::date as txn_date,
  duedate::date as due_date,
  balance,
  --einvoicestatus as e_status,
  --ecloudstatustimestamp::datetime as e_status_timestamp,
  --deliveryinfo__deliverytype as delivery_type,
  --deliveryinfo__deliverytime::datetime as delivery_time,
  -- shipdate?
  emailstatus as email_status,
  docnumber::int as doc_number,
  customerref__value::int as customer_id,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.invoices') }}
