# Global Search backup before 180ms debounce

Created on 2026-09-25 before changing the Page 0 Global Search debounce from 300ms to 180ms.

This backup includes both Page 0 exports and both variants of the Module and Transaction search configurations. It preserves the working 300ms debounce, permission-query optimizations, Enter-key dedupe, and keyboard-cursor restoration behavior.

Use `app105-source/rollback_global_search_before_180ms_20260925.sql` to restore the live components.
