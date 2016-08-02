select distinct date_trunc('month', date_day)::date as date_month
from {{ref('quickbooks_days')}}
where date_day <= current_date
