with lineitems as (

  select * from analytics.quickbooks_invoice_lineitems

), items as (

  select * from analytics.quickbooks_items

), accounts as (

  select * from analytics.quickbooks_accounts

), invoices as (

  select * from analytics.quickbooks_invoices

), customers as (

  select * from analytics.quickbooks_customers

)

select *
from items
  inner join lineitems on items.id = lineitems.item_id
  inner join accounts on items.account_id = accounts.id
  inner join invoices on lineitems.invoice_id = invoices.id
  inner join customers on invoices.customer_id = customers.id
