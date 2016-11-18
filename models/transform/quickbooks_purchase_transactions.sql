--purchases debit expense and credits the payment account (cash or credit).
--this query creates both of those transactions.

with purchases as (

  select * from {{ref('quickbooks_purchases')}}

), purchase_lines as (

  select * from {{ref('quickbooks_purchase_lines')}}

), accounts as (

  select * from {{ref('quickbooks_accounts_xf')}}

), d1 as (

  select
    purchases.id,
    purchase_lines.amount,
    purchases.txn_date,
    purchase_lines.account_id as payed_to_acct_id,
    purchases.account_id as payed_from_acct_id,
    case nvl(purchases.credit, false::bool)
      when true then 'debit'
    else 'credit'
    end as payed_from_transaction_type,
    case nvl(purchases.credit, false::bool)
      when true then 'credit'
    else 'debit'
    end as payed_to_transaction_type,
    purchase_lines.class_id
  from purchases
    inner join purchase_lines on purchases.id = purchase_lines.purchase_id

)

select
  id,
  txn_date,
  amount,
  payed_from_acct_id as account_id,
  payed_from_transaction_type as transaction_type,
  'purchase' as source,
  class_id
from d1

union all

select
  id,
  txn_date,
  amount,
  payed_to_acct_id,
  payed_to_transaction_type,
  'purchase',
  class_id
from d1
