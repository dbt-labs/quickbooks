with entries as (

  select * from {{ref('quickbooks_journal_entries')}}

), lines as (

  select * from {{ref('quickbooks_journal_lines')}}

)

select
  entries.id,
  entries.txn_date,
  lines.amount,
  account_id,
  lower(posting_type) as transaction_type,
  'journal' as source,
  lines.class_id
from entries
  inner join lines on entries.id = lines.entry_id
