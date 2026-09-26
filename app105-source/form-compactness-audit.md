# Form compactness and whitespace audit

Status: Phase 1 complete — application-source inventory and shared-rule audit.
No form layout or behaviour was changed by this audit.

## Inventory

The APEX export has **203 pages with a `NATIVE_FORM` region**.  The shared
`COMPACT_FORM_PAGE_IDS` inventory in `hspl-theme.js` contains all 202 of those
pages other than page 69 (Material In), which is intentionally kept as the
reference form.  The page list is therefore not the cause of incomplete
coverage: every standard APEX form is already eligible for the shared compact
CSS at runtime.

There are 486 pages containing items, but 283 of those are not standard form
pages (reports, lists, dialogs, helper pages, or pages with custom item
layouts).  They must not be automatically treated as transaction/master forms
merely because they contain page items.

## Verified shared rules

The current shared compact-form treatment is safely scoped behind
`html.hspl-compact-form` and supplies the intended vertical density:

- 34px standard controls;
- 4px label-to-control spacing;
- 10px item rhythm;
- compact form-region padding;
- responsive layout unchanged below the existing breakpoint;
- no application of the rule to reports, filter drawers, dialogs, or Material
  In.

This means a screenshot where a form still looks spread out is not evidence
that the page was omitted.  The cause is likely one of the structural cases
below and needs per-layout inspection rather than another global height or
padding override.

## Root-cause groups to verify visually

1. **APEX grid rows and spans** — the server-side New Row / column-span
   configuration can reserve a half or whole row even when a later field is
   short.  CSS should not reorder these grids globally.
2. **Unequal sibling section cards** — a short card may be stretched by a
   taller card in the same APEX row, leaving blank space below the short card.
   This is a row/cross-axis alignment issue, not field padding.
3. **Empty or conditionally hidden layout cells** — a hidden item or empty
   region can retain a grid slot.  This must be corrected in Page Designer,
   not with negative margins.
4. **Fixed/min-height region configuration** — region templates, custom page
   CSS, or a declared minimum can keep a section taller than its content.
5. **Custom/non-NATIVE_FORM pages** — their markup can legitimately differ;
   they require a safe structure check before receiving the shared treatment.

## Safety finding

The shared files contain legacy experimental card-canvas rules using grid
re-parenting/`display: contents` and transform-based stacking, plus
page-specific Purchase Order offsets.  Those techniques are too broad for the
current visual-safety requirement and must not be expanded to additional forms.
They need visual regression testing before any removal or replacement because
some existing pages may currently depend on them.

## Safe implementation sequence

1. Capture representative desktop and laptop screenshots for each form
   architecture: master, simple transaction, multi-card transaction, and
   custom-layout form.
2. For each failing page, inspect the APEX region/item grid metadata and
   identify the exact empty row, span, stretch, or min-height responsible.
3. Group only identical structures under a narrowly scoped shared selector;
   use Page Designer layout correction for true page-specific grid errors.
4. Compare before/after at desktop and smaller widths.  Preserve item order,
   widths needed for data entry, controls, labels, and all existing behaviour.

## Acceptance evidence required per change

- no clipped/overlapping labels or controls;
- no altered item order, validation, LOV, Dynamic Action, process, or button;
- no new horizontal overflow;
- natural section height with a consistent, visible section gap;
- unchanged mobile stacking behaviour.

## Final structural-regression guard

Compactness may change only vertical density within the APEX structure.  It
must never turn an intentional `2 + 2` or `3 + 3` arrangement into a single
row, move fields between regions, or infer a new grouping from spare width.

Static review confirms that the core `hspl-compact-form` rules only alter
control height, label rhythm, padding, and margins; they do not write APEX item
grid metadata, item order, validation, LOVs, Dynamic Actions, or processes.

Two **legacy structural-risk adapters** require visual regression evidence
before this work can be declared complete:

1. The `hspl-card-canvas` adapter can convert an outer card row to CSS grid
   and translate a later short card upward (`hspl-card-stack`).  Although it
   does not move form fields inside a card, this can visually defeat an
   intentional row hierarchy.
2. Purchase Order has an older page-specific `#POAMENDMENTDETAIL { top:-35px
   }` adjustment.  It is a positional workaround, not a general compactness
   rule, and must be checked against the original region flow.

Neither adapter should be copied to more forms.  For each existing page that
uses one, compare the original APEX grid with the rendered layout and retain
it only if field grouping, row breaks, region order, and responsive stacking
remain exactly intact.  Otherwise remove that adapter for the affected
architecture and keep only the vertical-density rules.
