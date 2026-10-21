# Module Flow initial focus

Updated live application 105, page 264, on 21-10-2026. The page now calls native apex.item('P264_MODULECODE').setFocus() once after APEX initialization. Only the initial focus property was added; form controls, validation, processing and business data remain unchanged.

Fresh page backup: before-pages.sql. Generator: build.cjs. Scoped native page import: page264.sql. Deployment wrapper checks schema/container and the original Module item ID. Deployed snapshot: deployed-page264.sql.

Browser verification: opening Create from Module Flow List places focus on the Module combo box (P264_MODULECODE), rather than On Getting Of Pass Marks. No console errors. No record was saved. Evidence: module-focus-verified.png.
