select
  id::int,
  name,
  unitprice as unit_price,
  type,
  taxable,
  incomeaccountref__value::int as account_id,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.items') }}
