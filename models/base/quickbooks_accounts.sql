select
  id::int as id,
  name,
  fullyqualifiedname as fully_qualified_name,
  active,
  coalesce("currentbalance#393e9a29743b22f711b6140cf4db53e8",
    "currentbalance#0160c3a3e95f837efd1da1532b93bf3a"::numeric(38,6)) as current_balance,
  parentref__value::integer as parent_account_id,
  accounttype as type,
  accountsubtype as subtype,
  subaccount,
  classification,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_accounts
