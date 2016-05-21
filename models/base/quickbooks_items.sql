select
  id::int,
  name,
  unitprice::numeric(38,6) as unit_price,
  type,
  taxable,
  incomeaccountref__value::int as account_id,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_items
