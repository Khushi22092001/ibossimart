# Phase 1 unchanged-focusout backup

Live APEX pages 108 (Indent), 708 (Purchase Enquiry), and 710 (Purchase Quotation), exported immediately before converting enabled detail calculation handlers from `focusout` to `change`.

The intended fix only prevents calculations/server calls when Tab or Shift+Tab leaves an unchanged detail value. Formulas, save logic, and navigation focusout handlers are unchanged.

