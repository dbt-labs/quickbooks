select
  --this id is only unique within a given entry_id; may also want to create a globally unique id for this table.
  id::int,
  _rjm_source_key_id as entry_id,
  amount,
  description,
  journalentrylinedetail__accountref__value::integer as account_id,
  journalentrylinedetail__postingtype as posting_type
from
  rb_qbo_integration.quickbooks_journalentries__line
