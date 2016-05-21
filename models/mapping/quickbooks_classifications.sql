--this query adds standard mapping information for the different types of accounts.
--these classifications will ensure that the accounting treatment of each is appropriate.
select 'Asset' as classification, 'bs'as statement, 'debit' as account_type
union all
select 'Liability', 'bs', 'credit'
union all
select 'Equity', 'bs', 'credit'
union all
select 'Expense', 'is', 'debit'
union all
select 'Revenue', 'is', 'credit'
