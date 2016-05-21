--this tests the entire general ledger process to ensure that debits = credits within each transaction id.
--success is returning no records

with ledger as (

  select *
  from {{ref('quickbooks_general_ledger')}}

), debits as (

  select id, sum(amount) as total
  from ledger
  where lower(transaction_type) = 'debit'
  group by 1

), credits as (

  select id, sum(amount) as total
  from ledger
  where lower(transaction_type) = 'credit'
  group by 1

), transactions as (

  select debits.id as transaction_id, debits.total as debits, credits.total as credits,
    debits.total - credits.total as difference
  from debits
    full outer join credits on debits.id = credits.id

)

select *
  from transactions
 where difference > 0
