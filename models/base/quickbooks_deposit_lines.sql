with lines as (

  select *,
        {{ var('level_0_id_field') }}::int as _id,
        {{ var('source_key_id_field') }}::int as deposit_id
  from {{ var('base.deposits_line') }}

), links as (

  select *,
        {{ var('level_0_id_field') }}::int as _id,
        {{ var('source_key_id_field') }}::int as deposit_id
  from {{ var('base.deposits_line_linkedtxn') }}

)

select
  lines._id as id,
  lines.deposit_id,
  lines.amount,
  nullif(lines.depositlinedetail__classref__value::varchar, '')::bigint as class_id,
  nullif(lines.depositlinedetail__accountref__value::varchar, '')::int as account_id,
  links.txnid::int as payment_id
from lines
  left outer join links on
    lines._id = links._id and
    lines.deposit_id = links.deposit_id
