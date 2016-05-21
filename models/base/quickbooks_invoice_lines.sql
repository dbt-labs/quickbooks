select
  --this id is only unique within a given invoice_id; may also want to create a globally unique id for this table.
  id::int,
  amount,
  description,
  _rjm_source_key_id::int as invoice_id,
  salesitemlinedetail__itemref__value::int as item_id
from
  rb_qbo_integration.quickbooks_invoices__line
where
  detailtype = 'SalesItemLineDetail'
