with null_classification_accounts as (

  select * from {{ref('quickbooks_accounts')}}

), classifications as (

  select * from {{ref('quickbooks_classifications')}}

), missing_classifications as (

  select * from {{ref('quickbooks_missing_account_classifications')}}

), accounts as (

  select nca.id, nca.name, nca.fully_qualified_name, nca.active, nca.current_balance, nca.parent_account_id,
    nca.type, nca.subtype, nca.subaccount, nvl(nca.classification, mc.classification) as classification,
    nca.created_at, nca.updated_at
  from null_classification_accounts nca
    left outer join missing_classifications mc on nca.id = mc.account_id

)

select accounts.*, classifications.statement, classifications.account_type
from accounts
  inner join classifications on accounts.classification = classifications.classification
