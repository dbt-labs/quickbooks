select
  id::int,
  displayname as name,
  balance,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.vendors') }}
