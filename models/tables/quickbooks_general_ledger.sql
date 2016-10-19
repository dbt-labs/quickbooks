select id, txn_date, amount, account_id, transaction_type::varchar(16), source::varchar(16), class_id from {{ref('quickbooks_bill_transactions')}}
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
