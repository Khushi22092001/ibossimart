whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
connect -name IMART
-- Include added amendment/BOM items so a completed original line cannot conceal pending new items.
update imart_tx_kpi_config set classifier_sql=replace(classifier_sql,
'from purchaseorderdetail d group by d.tno,d.itemcode,d.itemspecificationcode',
q'~from (
 select tno,itemcode,itemspecificationcode,quantity1 from purchaseorderdetail
 union all
 select a.purchaseordertno,d.itemcode,d.itemspecificationcode,d.quantity1
 from poamendment a join poamendmentdetail d on d.tno=a.tno
 where a.effectivefromdate<=sysdate and d.amendmenttypecode!='CANCELATION'
 union all
 select tno,itemcode,itemspecificationcode,quantity1 from bompurchaseorderdetail
) d group by d.tno,d.itemcode,d.itemspecificationcode~') where page_id=117;
commit;
exit
