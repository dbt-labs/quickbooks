--the registration of a bill debits expense and credits AP.
--this query creates both of those transactions.

with bills as (

  select * from {{ref('quickbooks_bills')}}

), bill_lines as (

  select * from {{ref('quickbooks_bill_lines')}}

), d1 as (

  select bills.id, bills.txn_date, bill_lines.amount,
    bill_lines.account_id as payed_to_acct_id,
    ap_account_id,
    bill_lines.class_id
  from bills
    inner join bill_lines on bills.id = bill_lines.bill_id

)

select id,
  txn_date,
  amount,
  payed_to_acct_id as account_id,
  'debit'::varchar(16) as transaction_type,
  'bill'::varchar(16) as source,
  class_id::bigint

from d1

union all

select
  id,
  txn_date,
  amount,
  ap_account_id,
  'credit' as transaction_type,
  'bill',
  class_id::bigint
from d1
