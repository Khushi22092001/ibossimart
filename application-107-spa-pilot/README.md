# App 107 isolated single-page-navigation pilot

App 107 (`IMARTSPA107`) is a fresh, separate copy of production app 105,
installed on 21 September 2026. Production 105 and the pre-existing backup 106
were not changed by this copy. The import kept the browser-frame restriction
(`D`). Its original 572 pages are still conventional APEX pages: **the clone is
not yet a single-page application and must not be presented as a fix**.

## Implemented pilot (page 900)

On 2026-09-21, the staging app 107 `hspl-theme.css` static file received a
targeted region-heading override (title and title-wrapper only) for the dark
pill seen on the pilot selector. The deployed file is based on a fresh read of
the live 349205-byte stylesheet, not the older checked-in export; staging now
has 349664 bytes. App 105 still has the original 349205-byte file. An
authenticated visual check of page 900 remains necessary before deploying the
same CSS to app 105; the staging browser session redirected to login during
verification. Do not describe this as a verified application-wide visual fix.

Page 900, `SPA Pilot - Process Registers`, was created only in app 107. It
contains a native copy of the Process TAT Interactive Report from page 717,
a native copy of the Process Routing Interactive Report from page 715, and an
APEX Region Display Selector. The routing copy uses DOM ID `spa_routing_ir`
to avoid colliding with the TAT copy's `abc` ID. No pilot page was added to
the application navigation list and no original sidebar link was changed.

Authenticated browser test: selecting Process TAT and then Process Routing
changed only the visible report region. The URL stayed on page 900 and the
native sidebar and page document were not navigated. Existing report row Edit
links still point to their original forms and therefore still perform normal
APEX page navigation. The original 715/717 sidebar links also still perform
normal navigation and can still flash. This proves the region composition
pattern only; it does **not** meet the user's app-wide acceptance criterion.

Pilot URL: `https://erp.infomatics.in:8443/ords/r/imart/imartspa107/spa-pilot-process-registers`

The copy shares the production parsing schema and business tables. Do not
submit an editable staging form or run a mutating process against real records.
It also has an independent application session; the production login does not
automatically authenticate a user to app 107.

## Migration boundary

The existing side menu is rendered in `#SIDE_GLOBAL_NAVIGATION_LIST#` for each
APEX page. A click to another page replaces the document and necessarily
destroys its tree DOM. A CSS first-paint rule or delayed TreeView initialization
cannot make the tree persistent. APEX Partial Page Refresh works for regions
within the *current* page, not arbitrary existing page definitions.

For a genuine single-page experience, build a native APEX shell page containing
the live navigation and migrated content regions. Use the existing navigation
list as the route source of truth and preserve each entry's authorization and
destination. For every supported route, migrate its page items, regions,
processes, branches, validations, dynamic actions, and associated session state
as a unit. Native cross-page links remain the explicit fallback until a route
is migrated and verified. Never fetch a complete APEX page and inject its HTML,
duplicate the menu, weaken framing, or replace business processing with a
client-only form.

## Pilot gates before production changes

The photographed path is **Process TAT List (page 717)** under Setup & Admin;
its nearby sibling **Process Routing List (page 715)** and edit target
**Process TAT Master (page 718)** are concrete pilot routes. The photo shows
page 717's report already rendered while the navigation has only HOME; after
load, the same production tab shows the full expanded native tree. This is a
transient navigation lifecycle problem, not missing menu records.

1. Select one read-only register and one editable form that can be tested with
   non-production data. Establish the shell route and verify that the exact
   sidebar DOM node, expanded parent, width, and scroll position survive
   route changes while the main content changes by supported region refresh.
2. Verify a real Interactive Report or Grid: search, pagination, downloads,
   refresh, row navigation and authorization. Verify the form's LOVs,
   validations, save/cancel/branch flow, unsaved-change warning, and modal.
3. Verify Back/Forward, direct link, expired session, failed/slow requests and
   accessibility/focus. Unsupported routes must navigate normally with their
   original APEX-generated URL and checksum.
4. Migrate page families incrementally. Do not turn on global interception in
   app 105 until all relevant routes pass equivalent tests and the user accepts
   the staged result.

The staging URL is
`https://erp.infomatics.in:8443/ords/r/imart/imartspa107/home`.
