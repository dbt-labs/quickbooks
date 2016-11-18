with unioned as (

  select
    id,
    txn_date,
    amount,
    account_id,
    transaction_type::varchar(64),
    source::varchar(64),
    class_id
  from {{ref('quickbooks_bill_transactions')}}

  union all
  select * from {{ref('quickbooks_billpayment_transactions')}}
  union all
  select * from {{ref('quickbooks_invoice_transactions')}}
  union all
  select * from {{ref('quickbooks_purchase_transactions')}}
  union all
  select * from {{ref('quickbooks_journal_transactions')}}
  union all
  select * from {{ref('quickbooks_deposit_transactions')}}
  union all
  select * from {{ref('quickbooks_payment_transactions')}}

), accounts as (

  select * from {{ref('quickbooks_accounts_xf')}}

)

select
  unioned.*,
  case
    when accounts.account_type = unioned.transaction_type
      then amount
    else
      amount * -1
  end as adj_amount
from unioned
  inner join accounts on unioned.account_id = accounts.id
