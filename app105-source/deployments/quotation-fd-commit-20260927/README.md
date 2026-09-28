# Purchase Quotation FD commit before refresh

Page 710's `P710_PREPARE_FD` callback can rebuild the selected quotation row's tax/footer records. The DetailFooter Interactive Grid is refreshed in a separate request immediately afterward. This deployment commits the rebuild before returning the callback response, so the dialog reads the same row's committed tax records instead of an empty intermediate result.

No footer formula, tax-rule selection, detail calculation, or save validation is changed.
