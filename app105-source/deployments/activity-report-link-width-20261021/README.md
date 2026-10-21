# Activity Detail action-column width

Deployed on 21-10-2026 to application 105, User Activity Detail page 1113.

The report's first native link column previously collapsed to about one character, causing a tall vertical caption. Its minimum width now reserves eight character units plus cell padding. Each link has an 8ch text box, normal word wrapping and overflow-wrap:anywhere for longer words. Record History renders Record on the first line and History on the second. The same CSS applies to future captions in this column without hardcoded line breaks.

CSS is scoped to report region R92002610200000426. Queries, authorization, links, date formats and other columns are unchanged. No business records were changed.

Fresh backup: before-pages.sql. Source: link-column.css and build.cjs. Scoped native page import: page1113.sql. Deployment script validates schema/container and the original report region. Final live snapshot: deployed-page1113.sql. This patch is applied after the base Activity Monitoring module deployment; reapply it if regenerating/reimporting the base module.

Browser verification: the native link now measures approximately 72px wide and 35px high (two lines), in a 98px cell. Before the fix, the link was approximately 8px wide and 223px high. The caption and existing history URL are retained; console error list is empty. Evidence: report-column-verified.png.
