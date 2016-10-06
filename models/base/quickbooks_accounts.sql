select
  id::int as id,
  name,
  fullyqualifiedname as fully_qualified_name,
  active,
  currentbalance as current_balance,
  nullif(parentref__value, '')::integer as parent_account_id,
  accounttype as type,
  accountsubtype as subtype,
  subaccount,
  classification,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.accounts') }}
