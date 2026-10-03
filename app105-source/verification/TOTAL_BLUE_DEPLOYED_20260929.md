# Total-band blue palette — 29 September 2026

User requested replacing the purple palette with a slightly darker, stronger
blue, preserving the approved design and all functionality.

Updated shared `hspl-total-band.css` and imported/deployed the asset using the
existing scoped deployment script. Cache key: `20260929totalblue1`.

- Blue background gradient: `#ccdef8`, `#e0ebfc`, `#d1e2f9`.
- Blue accent: `#2563eb`; icon: `#4b8cf2` to `#1d4ed8`.
- Navy text and blue decorative waves/divider/border.
- Existing mint LIVE badge, 58px band, spacing, cell widths, icon shape,
  scrollbar ownership and all business/calculation logic unchanged.

Database read-back validation passed: replacing hex colour literals with a
common placeholder makes the previous and new stylesheet text identical.
Deployed CSS is byte-identical to source. Other stylesheet and JavaScript
references are identical to the pre-change snapshot.

Backup: `total-blue-live-before-20260929.txt` includes the previous live CSS as
base64. Read-back: `total-blue-live-after-20260929.txt`.

Live visual verification remains pending. The selected Chrome browser timed
out and reset the tool session; after reconnecting, repeated browser requests
failed with "Unable to load browser request-header policy". No protection was
bypassed, no alternate browser/UI mechanism was used, and no screenshot of
the old purple design is presented as evidence of the blue version.
