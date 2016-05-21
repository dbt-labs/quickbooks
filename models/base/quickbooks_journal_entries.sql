select
  id::integer,
  txndate::date as txn_date,
  adjustment,
  metadata__createtime::datetime as created_at,
  metadata__lastupdatedtime::datetime as updated_at
from
  rb_qbo_integration.quickbooks_journalentries
