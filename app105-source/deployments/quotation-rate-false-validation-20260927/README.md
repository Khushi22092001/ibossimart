# Purchase Quotation false Rate validation removal

Page 710 had two legacy native `Rate must have a value` checks: the Interactive Grid column requirement and a duplicated tabular validation. They could evaluate the pre-commit editor value and reject a visible, calculated Rate.

Both are removed. The existing pre-submit calculation guard remains and blocks save with an explicit `Rate is blank` error for an actually blank Rate, as well as the existing quantity, discount, amount, footer and summary consistency checks.
