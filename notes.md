###approach###
Create journal entries from all different object types (recreate single ledger)

####to do####
- get account_balances test to pass by inspecting quickbooks front end and finding missing transactions.
  - see if I can get brian to
- construct basic monthly financial statements
- cash burndown
- budget vs actual
- talk to brian and jake about quickbooks connector problems
  - inability to remove deleted transactions
  - failure to get all GL data (should get it through the reporting api)
    - payroll
    - taxes

####done####
- invoices
  - to AR
  - to revenue
- purchases
  - from account
  - to account
- bills
  - DR expense
  - CR AP
- bill payments
  - DR AP
  - CR payment account
- journal entries (from wherever to wherever)
- deposits
  - CR AR
  - DR cash


####questions####
- am i handling credit cards appropriately? should it look more like AP? right now i'm just doing whatever it tells me in the from/to. i'm especially concerned about the transfer from cash to credit card here--i'm not positive it's always happening correctly.
- haven't really looked into payments table at all yet. not really clear what's going on there.
- linking bill payments to bills seems imperfect. quickbooks must include logic that I can't define from the data. fortunately, it doesn't matter if all I'm trying to do is create the journal entries.

#####relationships#####
- customers.id = invoices.customerref__value

#####tests run#####
- purchases total always equals sum of purchase lines amount
- debits in the line items for a journal entry always equal the credits
- invoices total always equals sum of invoice lines amount
- the linking tables from bills to bill payments have the exact same records in them.
