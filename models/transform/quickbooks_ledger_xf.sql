with accounts as (

  select * from {{ref('quickbooks_accounts_xf')}}

), ledger as (

  select * from {{ref('quickbooks_general_ledger')}}

), d1 as (

  select ledger.*,
    case
      when transaction_type = account_type then 1
      else -1
    end as multiplier
  from ledger
    inner join accounts on ledger.account_id = accounts.id

)

select
  id,
  txn_date,
  amount,
  account_id,
  class_id,
  transaction_type,
  source,
  amount * multiplier as adj_amount,
  sum(amount * multiplier) over (partition by account_id order by txn_date rows unbounded preceding) as current_account_balance
from d1
