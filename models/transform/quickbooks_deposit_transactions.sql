--deposits debit cash and credit either undeposited funds or a specific other account indicated in the deposit line.
--this query creates both of those transactions.

with lines as (

  select * from {{ref('quickbooks_deposit_lines')}}

), deposits as (

  select * from {{ref('quickbooks_deposits')}}

), d1 as (

  select
    deposits.id,
    deposits.txn_date,
    lines.amount,
    deposits.account_id as deposit_to_acct_id,
    coalesce(lines.account_id, udf.id) as deposit_from_acct_id,
    lines.class_id
  from deposits
    inner join lines on deposits.id = lines.deposit_id
    join (select id from {{ref('quickbooks_accounts')}} where subtype = 'UndepositedFunds') udf
      on 1 = 1

)

select
  id,
  txn_date,
  amount,
  deposit_to_acct_id as account_id,
  'debit' as transaction_type,
  'deposit' as source,
  class_id
from d1

union all

select
  id,
  txn_date,
  amount,
  deposit_from_acct_id,
  'credit',
  'deposit',
  class_id
from d1
