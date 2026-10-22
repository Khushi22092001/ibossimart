WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
begin apex_util.set_security_group_id(4744311978888504);end;
/
declare a clob;begin
 if user<>'IMART' or sys_context('USERENV','CON_NAME')<>'ORA26PDB' then raise_application_error(-20001,'Wrong target');end if;
 select attributes into a from apex_application_page_da_acts where application_id=105 and page_id=197 and action_id=443390428449794154;
 if dbms_lob.compare(a,q'~{"language":"PLSQL","plsql_code":"declare ack_keys clob;procedure ack_business is begin\nDECLARE\n  tModuleCode  Varchar2(30);\n  TMP          vARCHAR2(100) ;--:= :P80_PICKUPREQUESTNO;\ncursor cPassFail is\n\t\tselect\n\t\t\t\ta.TNo\n\t\tfrom PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d\n\t\twhere a.ModuleFlowTNo = b.TNo\n\t\t\t\tand b.TNo = c.TNo\n\t\t\t\tand a.BossUserCode = c.BossUserCode\n\t\t\t\tand c.BossUserCode = d.BossUserCode\n\t\t\t\tand a.ModuleTNo = ':P'||:APP_PAGE_ID||'_TNo'\n\t\t\t\tand d.LoginName = User\n\t\t\t\tand a.isPass is null\n\t\t\t\tand a.IsFail is null\n\t\t\t\tand a.IsForwarded is null\n\t\t\t\tand a.IsRebounded is null\t\t\t\t\t\t\t\t\t\t\n;\nvPassFail cPassFail%rowtype;\nBEGIN\n\n    select\n    \td.ModuleCode, ':P'||:APP_PAGE_ID||'_'||labelcolumnname \n                into tModuleCode,tmp\n    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d \n    where a.LocationCode = b.LocationCode\n    \tand b.tno = c.tno\n    \tand c.ModuleCode = d.ModuleCode --'DELIVERYCHALLANRETURN'\n    \tand c.CompanyCode = :global_CompanyCode\n        and d.EntryPageNo = :APP_PAGE_ID\n        ;\n\n\t\t\t\n\topen cPassFail;\n\tfetch cPassFail into vPassFail;\n\tif cPassFail%FOUND then\n\t\t\t\n\t\t\n\t\t\tupdate PassFail a\n\t\t\tset a.IsPass = 'YES',\n\t\t\t\ta.remark = ':P'||:APP_PAGE_ID||'_PASSFAILREMARK'\n\t\t\twhere a.TNo = vPassFail.TNo;\n\t\t\t\n\t\t\tclose cPassFail;\n\t\t\t\n\t\t\t\n\t\t\tSendPassFailForward(tModuleCode, ':P'||:APP_PAGE_ID||'_TNo' , TMP, :global_CompanyCode );\n\n             if :P197_STATUS = 'ACTIVE' then\n        \n                CREATEPAYMENTADVICEFORPO(:P197_TNO);\n\n              end if;\n\n    end if;\nEND;\nend;begin\nselect json_array(to_char(:P197_TNO) null on null returning clob) into ack_keys from dual;\nimart_save_ack.begin_v2(:P197_IMART_SAVE_OP_ID,'P197_TNO',ack_keys,'STATUS');\nack_business;\nselect json_array(to_char(:P197_TNO) null on null returning clob) into ack_keys from dual;\nimart_save_ack.finish_v2(:P197_IMART_SAVE_OP_ID,ack_keys);\n:P197_IMART_STATUS_DONE:=:P197_IMART_SAVE_OP_ID;\nend;","items_to_submit":"P197_TNO,P197_COMPANYCODE,P197_IMART_SAVE_OP_ID,P197_IMART_WORKFLOW_START","show_processing":"N","items_to_return":"P197_IMART_STATUS_DONE"}~')<>0 then raise_application_error(-20001,'Pass action changed since backup');end if;
end;
/
@page197.sql
prompt PRODUCTION_PASS_DEPLOYED
EXIT
