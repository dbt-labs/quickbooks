with ledger as (

  select * from {{ref('quickbooks_general_ledger')}}

), accounts_map as (

  select * from {{ref('quickbooks_parent_accounts_map')}}

)

select
  txn_date::date as "date",
  top_level_account_id,
  sum(adj_amount) as amount
from ledger
  inner join accounts_map on ledger.account_id = accounts_map.account_id
group by 1, 2
