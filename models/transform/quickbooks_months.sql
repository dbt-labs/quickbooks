select distinct date_trunc('month', date_day)::date as date_month
from {{ref('days')}}
where date_day <= current_date
