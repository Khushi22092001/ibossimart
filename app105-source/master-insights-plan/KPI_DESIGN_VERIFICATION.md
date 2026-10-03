# KPI presentation redesign — 2026-10-01

Applied scoped presentation styles and card markup to all 70 existing App105 master KPI shells. Existing report SQL, callbacks, permissions and filtering logic were not modified by this deployment. Pre-design shell sources are preserved in IMART_MR_DESIGN_BACKUP.

Chrome verification on Item Master List:
- Total 39, Active 38 (97.4%), Preparing 1 (2.6%).
- Total click showed 1–50 of 1380 report rows; Preparing showed 1–50 of 55 specification rows for one distinct master.
- Selected card shows “Showing records”; remaining cards show “View records”.
- Close hides the panel with zero height. Explanation disclosure works.
- Verified desktop and 900px viewport visually. At 480px with the existing expanded sidebar, cards wrap individually without internal overflow. The unrelated application sidebar remains unchanged.
- Temporary viewport override reset. Live verification tab retained.

Screenshot: kpi-design-chrome.jpg.

Deployment: run build_kpi_design.ps1 then update_kpi_design.sql after the status KPI migration. Re-running the old status shell generator alone would replace this presentation layer.
