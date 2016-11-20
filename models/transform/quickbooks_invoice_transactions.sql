--the registration of an invoice debits AR and credits a specific revenue account indicated
--on the invoice line.
--this query creates both of those transactions.

with invoice_lines as (

  select * from {{ref('quickbooks_invoice_lines')}}

), invoices as (

  select * from {{ref('quickbooks_invoices')}}

), items as (

  select * from {{ref('quickbooks_items')}}

), d1 as (

  select
    invoices.id,
    invoices.txn_date,
    invoice_lines.amount,
    items.account_id,
    invoice_lines.class_id
  from invoices
    inner join invoice_lines on invoices.id = invoice_lines.invoice_id
    inner join items on invoice_lines.item_id = items.id

)

select
  id,
  txn_date,
  amount,
  account_id,
  'credit' as transaction_type,
  'invoice' as source,
  class_id
from d1

union all

select
  d1.id,
  txn_date,
  amount,
  ar.id,
  'debit' as transaction_type,
  'invoice',
  class_id
from d1
  join (select id from {{ref('quickbooks_accounts')}} where type = 'Accounts Receivable') ar
    on 1 = 1
