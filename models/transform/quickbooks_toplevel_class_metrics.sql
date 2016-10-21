with ledger as (

  select * from {{ref('quickbooks_general_ledger')}}

), class_map as (

  select * from {{ref('quickbooks_parent_class_map')}}

)

select
  txn_date::date as "date",
  top_level_class_id,
  sum(adj_amount) as amount
from ledger
  inner join class_map on ledger.class_id = class_map.class_id
group by 1, 2
