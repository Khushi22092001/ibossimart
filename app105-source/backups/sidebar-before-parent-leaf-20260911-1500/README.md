# App 105 sidebar restore point

Created before adding parent-versus-leaf navigation behavior on 2026-09-11.

This snapshot preserves the exact sidebar implementation that was live at the
time of backup: theme/sidebar JavaScript, all active sidebar CSS, hierarchy
painting, navigation list definitions, application asset loaders, and ready
deployment scripts.

To restore this version, deploy `deploy_hspl_theme_js.sql`,
`deploy_hspl_theme_css.sql`, `deploy_app103_reference_assets.sql`,
`deploy_hspl_nav_paint.sql`, and `deploy_hspl_nav_final.sql`, then run
`activate_theme_js_cachebuster.sql`. Restore the copied source/configuration
files to their original paths as part of the same operation.

## SHA-256 manifest

```text
F20EF1BE82948184C756FE8609DEB74ECF62B735CD1E1983ADDCB4857B1749A2  activate_theme_js_cachebuster.sql
9A72CCA7D21BB861103F5CA5D8A7ACD015C3B9E269AF9E270C17EB753D98F27D  create_application.sql
7D84751588399D8B6721002D20B4B0FE39B4730D785EE9BF4A6DB7200C71BA7C  deploy_app103_reference_assets.sql
AFE63F2C4F5AA19A53B938727C0D334E8A4004FDF77C26EEAACA55ED57D52B39  deploy_hspl_nav_final.sql
C384B13862E0B6E51276745602563238351D6CB43E929F1256CED19AC1FF7C1B  deploy_hspl_nav_paint.sql
AFF7054935334807371C461710A299A2F92C820109F442DEE960A0E3BC774DFF  deploy_hspl_theme_css.sql
0F5F54C5566FEA12B976B4F8324D47092EA12769C0DB9D6CF439259CF10C3BE5  deploy_hspl_theme_js.sql
718F6585B0FCD957BD347C008634C29EDE0418A829A9399C75A4A585B1AD69AE  hspl-nav-final.css
35E41E0CCCAE2D050D32C0326BB46213E1BD74B71F251BA80AF9BB3E288A301E  hspl-nav-paint.js
2E04951AB7971FFB3281E4C1A3E9072F020B2E981AE4CF32EE73DFE7380A4862  hspl-theme.css
499DE5F264B68DA99D4479772B059DE915AAD7897D0FF015FC7C9F35E884AF79  hspl-theme.js
38746605088D081F7FE8762A64C3C801D272F16298ACDA62CE4E96AEFD26D7A4  listentry.sql
0101A6128B87FAE4D8451B8D5323D665B5BD5C6A528FAC9D810833F6518D0FD3  navigation_menu.sql
```
