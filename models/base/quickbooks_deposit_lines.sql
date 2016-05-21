select
  lines._rjm_level_0_id::int as id,
  lines._rjm_source_key_id::int as deposit_id,
  lines.amount,
  lines.depositlinedetail__accountref__value::int as account_id,
  links.txnid::int as payment_id
from rb_qbo_integration.quickbooks_deposits__line lines
  left outer join rb_qbo_integration.quickbooks_deposits__line__linkedtxn links on
    lines._rjm_source_key_id = links._rjm_source_key_id and
    lines._rjm_level_0_id = links._rjm_level_0_id
