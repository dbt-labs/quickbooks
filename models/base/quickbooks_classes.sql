
select
  id::bigint as id,
  name,
  fullyqualifiedname as fully_qualified_name,
  active,
  nullif(parentref__value, '')::bigint as parent_class_id,
  subclass,
  sparse,
  domain,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.classes') }}
