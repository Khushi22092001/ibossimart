create or replace package imart_master_reports authid definer as
 function allowed(p_module varchar2) return number;
 function report_rows(p_mode varchar2,p_master varchar2 default null,p_days number default 90) return imart_mr_rows pipelined;
 procedure render_hub;
end;
/
create or replace package body imart_master_reports as
 function allowed(p_module varchar2) return number is n number;
 begin
   if v('APP_ID') <> '105' or v('APP_USER') is null or upper(v('APP_USER'))='NOBODY' then return 0; end if;
   select count(*) into n from moduleprivilege p
    where p.modulecode=p_module and p.bossusercode=v('GLOBAL_BOSSUSERCODE')
      and p.companycode=v('GLOBAL_COMPANYCODE') and p.viewprivilege='YES';
   return case when n>0 then 1 else 0 end;
 end;
 function lit(s varchar2) return varchar2 is begin return dbms_assert.enquote_literal(s); end;
 function ident(s varchar2) return varchar2 is begin return dbms_assert.simple_sql_name(s); end;
 function has_col(t varchar2,c varchar2) return boolean is n number;
 begin select count(*) into n from user_tab_columns where table_name=t and column_name=c; return n>0; end;
 function scope_sql(t varchar2,a varchar2) return varchar2 is s varchar2(4000):='1=1';
 begin
   if has_col(t,'COMPANYCODE') then s:=s||' and '||a||'.companycode=v(''GLOBAL_COMPANYCODE'')'; end if;
   if has_col(t,'LOCATIONCODE') and t<>'LOCATION' then
     s:=s||' and ('||a||'.locationcode=v(''GLOBAL_LOCATIONCODE'') or v(''GLOBAL_LOCATIONCODE'') is null)';
   end if;
   if has_col(t,'PANEL') then s:=s||' and (SAGAR.GetUserPanelAB_apex() is null or '||a||'.panel=SAGAR.GetUserPanelAB_apex())'; end if;
   return s;
 end;
 function report_rows(p_mode varchar2,p_master varchar2 default null,p_days number default 90) return imart_mr_rows pipelined is
   q clob; refs clob; base_q clob; rc sys_refcursor; r imart_mr_row;
   nm varchar2(1000); ky varchar2(1000); st varchar2(1000); dt varchar2(1000);
   chk varchar2(200); cond varchar2(8000); detail varchar2(4000); cnt number;
   report_mode varchar2(30):=upper(p_mode); sources number; days number:=least(greatest(nvl(p_days,90),1),3650);
   procedure add_ref(t varchar2,c varchar2,modcode varchar2) is
   begin
     if allowed(modcode)=1 and has_col(t,c) then
       if refs is not null then refs:=refs||' union all '; end if;
       refs:=refs||'select cast(x.'||ident(c)||' as varchar2(4000)) refkey,count(*) n from '||ident(t)||' x where x.'||ident(c)||' is not null and '||scope_sql(t,'x')||' group by x.'||ident(c);
       sources:=sources+1;
     end if;
   end;
 begin
   if report_mode not in ('OVERVIEW','QUALITY','DUPLICATES','USAGE','UNUSED','CHANGES','MAPPINGS','ACCESS') then raise_application_error(-20001,'Unknown report'); end if;
   if report_mode='ACCESS' then
     if allowed('MODULEPRIVILEGE')<>1 or allowed('BOSSUSER')<>1 then return; end if;
     for z in (select b.bossusername,p.bossusercode,p.modulecode,m.modulename,p.viewprivilege,p.insertprivilege,p.updateprivilege,p.deleteprivilege,p.creationtime
       from moduleprivilege p join bossuser b on b.bossusercode=p.bossusercode join module m on m.modulecode=p.modulecode
       where p.companycode=v('GLOBAL_COMPANYCODE')) loop
       pipe row(imart_mr_row('User Access',z.bossusercode,z.bossusername,z.viewprivilege,z.modulename,
       'View: '||z.viewprivilege||'; Create: '||z.insertprivilege||'; Edit: '||z.updateprivilege||'; Delete: '||z.deleteprivilege,z.creationtime,null,
       apex_page.get_url(p_page=>136,p_clear_cache=>'136')));
     end loop;
     return;
   end if;
   for c in (select * from imart_mr_catalog where (module_code=p_master or (p_master is null and report_mode='OVERVIEW')) order by master_group,master_name) loop
     if allowed(c.module_code)<>1 then continue; end if;
     nm:='cast(a.'||ident(c.name_column)||' as varchar2(4000))';
     ky:='cast(a.'||ident(c.code_column)||' as varchar2(4000))';
     st:=case when c.status_column is null then 'cast(null as varchar2(100))' else 'cast(a.'||ident(c.status_column)||' as varchar2(100))' end;
     dt:=case when c.changed_column is null then 'cast(null as date)' else 'a.'||ident(c.changed_column) end;
     if report_mode='OVERVIEW' then
       q:='select imart_mr_row('||lit(c.master_name)||','||lit(c.module_code)||','||lit(c.master_group)||',null,''Master records'',''Records visible in current company/location scope'','||'max('||dt||'),count(*),apex_page.get_url(p_page=>'||c.register_page||',p_clear_cache=>'||lit(to_char(c.register_page))||')) from '||ident(c.table_name)||' a where '||scope_sql(c.table_name,'a');
     else
       chk:=null; detail:=null; cond:='1=1'; refs:=null; sources:=0;
       if report_mode='QUALITY' then
         chk:='Missing identity'; detail:='Master code or name is blank'; cond:=ky||' is null or trim('||nm||') is null';
       elsif report_mode='DUPLICATES' then
         chk:='Possible duplicate name'; detail:='Same trimmed, case-insensitive name; review before merging';
         cond:='upper(trim('||nm||')) in (select upper(trim(b.'||ident(c.name_column)||')) from '||ident(c.table_name)||' b where '||scope_sql(c.table_name,'b')||' group by upper(trim(b.'||ident(c.name_column)||')) having count(*)>1)';
       elsif report_mode='CHANGES' then
         if c.changed_column is null then continue; end if;
         chk:='Recent master record'; detail:='Latest available date: '||c.changed_column||'. Historical before/after values are not stored here.';
         cond:=dt||'>=trunc(sysdate)-'||to_char(days);
       elsif report_mode in ('USAGE','UNUSED','MAPPINGS') then
         -- Exact authoritative business-code links only; TNO is never matched by name.
         if c.code_column='TNO' or c.code_column=c.name_column then
           pipe row(imart_mr_row(c.master_name,c.module_code,null,null,'Link coverage unavailable','No authoritative business-code link is configured for this master.',null,null,null)); continue;
         end if;
         for s in (select distinct upper(m.mastertablename) t,m.modulecode from module m join user_tab_columns u on u.table_name=upper(m.mastertablename) and u.column_name=c.code_column
                   where m.mastertablename<>c.table_name and m.isactive='YES'
                   union select distinct upper(m.detailtablename),m.modulecode from module m join user_tab_columns u on u.table_name=upper(m.detailtablename) and u.column_name=c.code_column where m.isactive='YES') loop
           add_ref(s.t,c.code_column,s.modulecode);
         end loop;
         if c.module_code='ITEMTYPE' then add_ref('ITEM','ITEMTYPE','ITEM'); end if;
         if c.module_code='PARTY' then
           add_ref('GRN','TRANSPORTERCODE','GRN'); add_ref('DESPATCHADVICE','TRANSPORTERCODE','DESPATCHADVICE');
         end if;
         if sources=0 then pipe row(imart_mr_row(c.master_name,c.module_code,null,null,'Link coverage unavailable','No authorized linked source is available.',null,null,null)); continue; end if;
         chk:=case report_mode when 'USAGE' then 'Linked records' when 'UNUSED' then 'No linked records' else 'Missing master reference' end;
         detail:='Authorized links across '||sources||' source tables, in current company/location scope.';
         if report_mode='MAPPINGS' then
           q:='with links as ('||refs||') select imart_mr_row('||lit(c.master_name)||',l.refkey,null,null,'||lit(chk)||','||lit(detail)||',null,sum(l.n),null) from links l where not exists(select 1 from '||ident(c.table_name)||' a where '||ky||'=l.refkey) group by l.refkey';
         else
           cond:=case report_mode when 'UNUSED' then 'nvl(l.n,0)=0' else '1=1' end;
         end if;
       end if;
       if report_mode<>'MAPPINGS' then
         base_q:='select imart_mr_row('||lit(c.master_name)||','||ky||','||nm||','||st||','||lit(chk)||','||lit(detail)||','||dt||','||case when refs is null then 'cast(null as number)' else 'nvl(l.n,0)' end||',apex_page.get_url(p_page=>'||c.form_page||',p_clear_cache=>'||lit(to_char(c.form_page));
         if c.context_item is not null then base_q:=base_q||',p_items=>'||lit(c.context_item)||',p_values=>cast(a.'||ident(c.key_column)||' as varchar2(4000))'; end if;
         base_q:=base_q||')) from '||ident(c.table_name)||' a ';
         if refs is not null then base_q:=base_q||' left join (select refkey,sum(n) n from ('||refs||') group by refkey) l on l.refkey='||ky; end if;
         q:=base_q||' where ('||cond||') and '||scope_sql(c.table_name,'a');
       end if;
     end if;
     open rc for q;
     loop fetch rc into r; exit when rc%notfound; pipe row(r); end loop;
     close rc;
   end loop;
   return;
 exception when no_data_needed then if rc%isopen then close rc; end if; return;
 end;
 procedure render_hub is
   procedure link(p number,title varchar2,subtitle varchar2) is
   begin htp.p('<a class="mr-card" href="'||apex_escape.html_attribute(apex_page.get_url(p_page=>p,p_clear_cache=>to_char(p)))||'"><strong>'||apex_escape.html(title)||'</strong><span>'||apex_escape.html(subtitle)||'</span></a>'); end;
 begin
   htp.p('<section class="mr-hub"><h1>Master Intelligence Reports</h1><p>Explore master records, data quality and usage within your authorized company and location.</p><div class="mr-grid">');
   link(943,'Master Overview','Record counts by master, with last available change date');
   link(944,'Data Completeness','Missing master names and business codes');
   link(945,'Duplicate Review','Possible duplicate names for manual review');
   link(946,'Master Usage','Linked rows across authorized business sources');
   link(947,'Unused Masters','No linked rows within the displayed source coverage');
   link(948,'Recent Changes','Current records by their latest available change date');
   link(949,'Mapping Exceptions','Business codes referenced without a master record');
   if allowed('MODULEPRIVILEGE')=1 and allowed('BOSSUSER')=1 then link(950,'User Access Matrix','View, create, edit and delete privileges in this company'); end if;
   htp.p('</div><h2>Business analysis</h2><div class="mr-grid">');
   if allowed('PARTY')=1 then link(935,'Supplier 360','Purchases, orders, receipts and payable analysis'); link(910,'Customer 360','Receivables, bills, receipts and customer statements'); end if;
   if allowed('ITEM')=1 then link(936,'Item 360','Stock and procurement by item, specification and unit'); end if;
   if allowed('ITEMCATEGORY')=1 then link(725,'Category 360','Category sales analysis and item drilldowns'); end if;
   htp.p('</div></section>');
 end;
end;
/
