{{ dbt_utils.date_spine(
    datepart="minute",
    start_date="(select min(date_trunc('month', date_day)) from " ~ ref('quickbooks_days') ~ ")",
    end_date="current_date"
    )}}