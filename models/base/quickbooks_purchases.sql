select
  id::int,
  paymenttype as payment_type,
  totalamt as total,
  txndate::date as txn_date,
  credit,
  accountref__value::int as account_id,
  --the following three fields contain information on who was paid for this record.
  --the payment can be made to a vendor, customer, or employee. this is found in entity_type.
  --based on entity_type, the id value should be mapped to the corresponding table to get details.
  entityref__value::int as vendor_id,
  entityref__name as entity_name,
  entityref__type as entity_type,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.purchases') }}
