with lines as (

  select * from quickbooks.quickbooks_billpayments__line

), links as (

  select * from quickbooks.quickbooks_billpayments__line__linkedtxn

)

select
  lines._rjm_level_0_id::int as id,
  lines._rjm_source_key_id::int as bill_payment_id,
  amount,
  txnid::int as bill_id
from lines
  inner join links on
    links._rjm_source_key_id = lines._rjm_source_key_id and
    links._rjm_level_0_id = lines._rjm_level_0_id
