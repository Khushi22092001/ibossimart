whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
drop trigger dfreightbillreceiptdetail_biu_identity_guard;
exit
