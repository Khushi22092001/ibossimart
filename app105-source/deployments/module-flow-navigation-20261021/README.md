# Module Flow navigation correction

Live application 105, Setup and Admin page 259, updated 21-10-2026.

Root cause: the Module Flow card prepared a URL to page 124 (Bank Master). Its target is now page 263 (Module Flow List), whose existing Add New action opens modal page 264 (Module Flow). This follows the other setup-module navigation patterns and supports editing existing flow records.

The existing CHECK_MODULE_VIEW_ACCESS('MODULEFLOW', APP_USER, GLOBAL_COMPANYCODE) condition and denied-access fallback are preserved. No business records, grants, Module Flow pages or Bank Master components were modified.

Artifacts: before-pages.sql backs up live pages 259/263/264; build.cjs generates only page 259 import; deploy.sql validates the target region, schema/container and destination page aliases before import; deployed-page259.sql captures the deployed native page. Component-ID and target checks pass with verify.cjs. Browser verification completed after the user signed in: Setup and Admin > Module Flow opens Module Flow List (263); its Create action opens the Module Flow modal (264), with Module, Document Status, Flow Condition and Module Flow User controls. No browser console errors. No records were created or saved. Evidence: module-flow-verified.png.
