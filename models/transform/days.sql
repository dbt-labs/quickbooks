select (min(txn_date) over () + row_number() over ())::date as date_day
from {{ref('quickbooks_general_ledger')}}
