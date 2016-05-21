with journal_entries as (

  select *
  from analytics.quickbooks_adjusted_journal_entries

), accounts as (

  select *
  from analytics.quickbooks_accounts_transformed

)

select txn_date, account_id, adjusted_amount, description, account_name,
  sum(adjusted_amount) over (partition by account_id order by id rows unbounded preceding)
from journal_entries
order by account_id, id
