select
  id::int,
  companyname as company_name,
  active,
  balance,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  quickbooks.quickbooks_customers
