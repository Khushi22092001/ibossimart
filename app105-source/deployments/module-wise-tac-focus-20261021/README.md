# Module Wise TAC initial focus

Updated live application 105, page 225, on 21-10-2026. The page now calls native apex.item('P225_MODULECODE').setFocus() once after APEX initialization. Only the initial focus property was added; form controls, validation, processing and business data remain unchanged.

Fresh page backup: before-pages.sql. Generator: build.cjs. Scoped native page import: page225.sql. Deployment wrapper checks schema/container and the original Module item ID. Deployed snapshot: deployed-page225.sql.

Browser verification: opening Add New from Module Wise TAC List places focus on the Module combo box (P225_MODULECODE), rather than Remark. No console errors. No record was saved. Evidence: module-focus-verified.png.
