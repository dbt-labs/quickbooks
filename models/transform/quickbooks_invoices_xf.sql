with invoices as (

    select * from {{ref('quickbooks_invoices')}}

),

payments as (

    select
        *,
        total_amt - balance as amount_paid,
        case
            when balance < .05 * total_amt then 1
            else 0
        end as paid
    from invoices

),

final as (

    select
        *,
        case
            when paid = 0 and due_date < current_date then 1
            else 0
        end as overdue
    from payments

)

select * from final
