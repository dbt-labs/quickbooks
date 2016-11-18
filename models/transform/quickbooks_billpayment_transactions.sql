--paying a bill debits AP and credits cash.
--this query creates both of those transactions.

with bill_payments as (

  select * from {{ref('quickbooks_bill_payments')}}

), billpayment_lines as (

  select * from {{ref('quickbooks_billpayment_lines')}}

), d1 as (

  select
    bp.id,
    bp.txn_date,
    bpl.amount,
    payment_account_id,
    ap.id as ap_id
  from bill_payments bp
    inner join billpayment_lines bpl on bp.id = bpl.bill_payment_id
    join (select id from {{ref('quickbooks_accounts')}} where type = 'Accounts Payable') ap
      on 1 = 1

)

select
  id,
  txn_date,
  amount,
  payment_account_id as account_id,
  'credit' as transaction_type,
  'bill payment' as source,
  null::bigint as class_id
from
  d1

union all

select
  id,
  txn_date,
  amount,
  ap_id,
  'debit',
  'bill payment',
  null::bigint
from
  d1
