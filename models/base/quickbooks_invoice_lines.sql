select
  --this id is only unique within a given invoice_id; may also want to create a globally unique id for this table.
  id::int,
  amount,
  description,
  {{ var('source_key_id_field') }}::int as invoice_id,
  nullif(salesitemlinedetail__classref__value::varchar, '')::bigint as class_id,
  salesitemlinedetail__itemref__value::int as item_id
from
  {{ var('base.invoices_lines') }}
where
  detailtype = 'SalesItemLineDetail'
