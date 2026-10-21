# User Activity Detail header navigation

Deployed live on 21-10-2026 to APEX application 105 page 1113.

Back and Close controls sit at the right edge of the existing User Activity Detail title, using Universal Theme buttons and existing Font APEX icons. Controls wrap on narrow screens and are hidden for printing.

Back is a normal link. Where the browser Navigation API exposes a preceding distinct application page, the page initializer sets its href to that page's exact URL, preserving query filters. Duplicate visits to Activity Detail are skipped. Otherwise its server-generated fallback is Activity Monitoring page 1100. The existing application-wide Back/Exit confirmation remains active; confirming Yes, Exit follows the link. Close returns directly to Activity Monitoring. Both work through actual href navigation, without trying to close the user's browser tab.

The title region generates URLs through APEX_PAGE.GET_URL and escapes HTML attributes. Native region/component identities, existing authorizations, report queries, date masks and the previous eight-character Record History wrapping correction are preserved. No business records were changed.

Artifacts: before-pages.sql is the fresh page 1113 backup; header-actions.css and header-actions.js define styling and return-link selection; build.cjs generates page1113.sql; deploy.sql verifies schema/container and the original report region; deployed-page1113.sql is the final native live export. Apply this patch after the base Activity Monitoring module and action-column patch. A fresh backup is needed before applying over later unrelated page changes.

Browser validation: title controls visibly right-aligned; Close returned to ERP Activity & Audit Dashboard; Back returned to the dashboard after the existing exit confirmation. A separate Daily Activity Summary > Activity detail visit resolved Back to the exact activity-daily URL and returned to Daily Activity Summary after Yes, Exit. No console errors. Screenshot: header-actions-verified.png.

Navigation API reference: https://developer.mozilla.org/en-US/docs/Web/API/Navigation/entries . Browsers without this API use the server-generated dashboard fallback.
