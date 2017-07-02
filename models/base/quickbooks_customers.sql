select
  id::int,
  companyname as company_name,
  displayname as display_name,
  active,
  balance,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.customers') }}
