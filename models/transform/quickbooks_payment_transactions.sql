--payments debits either undeposited funds or cash and credits accounts receivable.
--this query creates both of those transactions.


with payments as (

  select * from {{ref('quickbooks_payments')}}

)

select
  payments.id,
  txn_date,
  total as amount,
  account_id,
  'debit' as transaction_type,
  'payment' as source,
  null::bigint as class_id
from payments

union all

select
  payments.id,
  txn_date,
  total,
  ar.id,
  'credit',
  'payment',
  null::bigint
from payments
  join (select id from {{ref('quickbooks_accounts')}} where type = 'Accounts Receivable') ar
    on 1 = 1
