with ledger as (

  select * from {{ref('general_ledger')}}

), accounts_map as (

  select * from {{ref('parent_accounts_map')}}

), accounts as (

  select * from {{ref('quickbooks_accounts_xf')}}

), d1 as (

  select ledger.txn_date, accounts_map.top_level_account_id,
    case
      when accounts.account_type = ledger.transaction_type
        then amount
      else
        amount * -1
    end as adj_amount
  from ledger
    inner join accounts_map on ledger.account_id = accounts_map.account_id
    inner join accounts on ledger.account_id = accounts.id

)

select
  date_trunc('month', txn_date)::date as date_month,
  top_level_account_id,
  sum(adj_amount) as amount
from d1
group by 1, 2
