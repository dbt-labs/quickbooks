{{ dbt_utils.date_spine(
    datepart="minute",
    start_date="(select min(txn_date) from " ~ ref('quickbooks_general_ledger') ~ ")",
    end_date="dateadd(week, 1, current_date)"
    )}}