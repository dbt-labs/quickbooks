with accounts as (

  select * from {{ref('quickbooks_accounts_xf')}}

), d1 as (

  select
    a1.id as a1_id,
    a2.id as a2_id,
    a3.id as a3_id,
    a4.id as a4_id,
    a5.id as a5_id
  from accounts a1
    left outer join accounts a2 on a1.id = a2.parent_account_id
    left outer join accounts a3 on a2.id = a3.parent_account_id
    left outer join accounts a4 on a3.id = a4.parent_account_id
    left outer join accounts a5 on a4.id = a5.parent_account_id
  where a1.parent_account_id is null

), d2 as (

  select
    a1_id as top_level_account_id,
    a1_id as account_id
  from d1

  union all

  select
    a1_id as top_level_account_id,
    a2_id as account_id
  from d1

  union all

  select
    a1_id as top_level_account_id,
    a3_id as account_id
  from d1

  union all

  select
    a1_id as top_level_account_id,
    a4_id as account_id
  from d1

  union all

  select
    a1_id as top_level_account_id,
    a5_id as account_id
  from d1

)

select distinct account_id, top_level_account_id
from d2
where account_id is not null
