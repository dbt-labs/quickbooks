select
  id::integer,
  txndate::date as txn_date,
  adjustment,
  metadata__createtime as created_at,
  metadata__lastupdatedtime as updated_at
from
  {{ var('base.journal_entries') }}
