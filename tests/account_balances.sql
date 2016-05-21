--this query tests the total of the general ledger process by making sure that the sum of all of the transactions
--for a given account total up to the balance reported on that account.
-- successful tests return zero rows.
--NOTE: I'm not actually confident that this will always work, although theoretically it should. Quickbooks seems to report 0 balances
--on all income statement accounts via the API, although in the front end they do show non-zero balances... No idea.

with accounts as (

  select * from analytics.quickbooks_accounts_xf

), ledger as (

  select * from analytics.quickbooks_ledger_xf

)

select account_id, accounts.name,
  accounts.current_balance, accounts.type, sum(adj_amount) journal_total
from ledger
  inner join accounts on ledger.account_id = accounts.id
group by 1, 2, 3, 4
having abs(accounts.current_balance) != abs(sum(adj_amount))
