# FD Back return-route repair

The Page 710 FD modal bug originates in the shared `hspl-theme.js` register-return listener, not in the Page 710 dialog itself. It treated the dialog's accessible **Back** control as a form-level Back action and routed the user to Quotation Register.

The listener now ignores controls inside `.ui-dialog` and `.a-Dialog`. Those controls retain their own APEX dialog-close behavior; form-level Back and Cancel behavior is unchanged.

`live-before/deploy_hspl_theme_js.sql` is the exact pre-change static asset deployment script. The staged script is generated from `app105-source/hspl-theme.js`.
