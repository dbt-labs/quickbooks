with lines as (

  select *,
         {{ var('source_key_id_field') }}::int as bill_payment_id,
         {{ var('level_0_id_field') }}::int as _id
  from {{ var('base.billpayments_line') }}
  

), links as (

  select *,
         {{ var('source_key_id_field') }}::int as bill_payment_id,
         {{ var('level_0_id_field') }}::int as _id
  from {{ var('base.billpayments_line__linkedtxn') }}

)

select
  lines._id as id,
  lines.bill_payment_id,
  amount,
  txnid::int as bill_id
from lines
  inner join links on links._id = lines._id and links.bill_payment_id = lines.bill_payment_id
