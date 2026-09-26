whenever sqlerror exit sql.sqlcode rollback
set define off
set verify off
set feedback on

connect -name IMART

prompt Importing Purchase Bill page 143 detail/calculation fixes...
@export/f105/application/pages/page_00143.sql

commit;
prompt Purchase Bill page 143 import complete.
exit
