whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on
connect -name IMART

declare
  l_js clob := q'~
/* HSPL_PHASE1_FORM_CALC_SAFE_V1 */
(function(){
"use strict";
if(window.hsplPhase1SafeV1)return;window.hsplPhase1SafeV1=true;
var pid=Number(apex.env.APP_PAGE_ID||0),tries=0;
function n(v){if(v&&typeof v==="object"&&"v" in v)v=v.v;v=Number(String(v==null?0:v).replace(/,/g,""));return Number.isFinite(v)?v:0;}
function region(ids){var out=null;ids.some(function(id){try{var r=apex.region(id),m=r.widget().interactiveGrid("getViews","grid").model;if(m){out={r:r,m:m};return true;}}catch(e){}return false;});return out;}
function rows(m,fn){m.forEach(function(rec,i,id){var x=m.getRecordMetadata(id);if(!x.deleted&&!x.agg)fn(rec);});}
function sum(m,fields){var t={};fields.forEach(function(f){t[f]=0;});rows(m,function(r){fields.forEach(function(f){t[f]+=n(m.getValue(r,f));});});return t;}
function modelSet(m,r,f,v){if(m.getFieldKey(f)&&Math.abs(n(m.getValue(r,f))-n(v))>.0000001)m.setValue(r,f,v);}
function itemSet(id,v){var x=apex.item(id);if(x&&x.node&&Math.abs(n(x.getValue())-n(v))>.0000001)x.setValue(v,null,true);}
function summary(b,values){var h=b.r.element&&b.r.element[0];if(!h)return;var e=h.querySelector(".hspl-phase1-summary");if(!e){e=document.createElement("div");e.className="hspl-phase1-summary";e.setAttribute("role","status");e.style.cssText="display:flex;gap:18px;justify-content:flex-end;flex-wrap:wrap;padding:8px 12px;margin-top:6px;border:1px solid #d8dde6;border-radius:6px;background:#fff;font-variant-numeric:tabular-nums";h.appendChild(e);}e.innerHTML=values.map(function(x){return "<span>"+apex.util.escapeHTML(x[0])+": <strong>"+n(x[1]).toLocaleString("en-IN",{minimumFractionDigits:2,maximumFractionDigits:3})+"</strong></span>";}).join("");}
function bind(b,key,fn){if(!b||b.m[key])return !!b;b.m[key]=true;b.m.subscribe({viewId:key,onChange:function(t,c){fn(b,t,c||{});}});fn(b,"refresh",{});return true;}
function indent(b,t,c){var f=c.field||c.fieldName;if(c.record&&(f==="INDENTQUANTITY1"||f==="RATE"))modelSet(b.m,c.record,"AMOUNT",n(b.m.getValue(c.record,"INDENTQUANTITY1"))*n(b.m.getValue(c.record,"RATE")));var x=sum(b.m,["INDENTQUANTITY1","QUANTITY1","AMOUNT"]);summary(b,[["Indent Qty",x.INDENTQUANTITY1],["Sanction Qty",x.QUANTITY1],["Amount",x.AMOUNT]]);}
function enquiry(b){var x=sum(b.m,["QUANTITY1","QUANTITY2"]);summary(b,[["Quantity 1",x.QUANTITY1],["Quantity 2",x.QUANTITY2]]);}
function quotation(b,t,c){var f=c.field||c.fieldName;if(c.record&&(f==="WITHOUTDISCOUNTRATE"||f==="DISCOUNTPERCENTAGE")){var base=n(b.m.getValue(c.record,"WITHOUTDISCOUNTRATE")),disc=base*n(b.m.getValue(c.record,"DISCOUNTPERCENTAGE"))/100;modelSet(b.m,c.record,"DISCOUNTRATE",disc);modelSet(b.m,c.record,"RATEAFTERDISCOUNT",base-disc);modelSet(b.m,c.record,"RATE",base-disc);}var x=sum(b.m,["AMOUNT","FOOTERAMOUNT","TOTALAMOUNT"]);itemSet("P710_SUMOFAMOUNT",x.AMOUNT);itemSet("P710_SUMOFFOOTERAMOUNT",x.FOOTERAMOUNT);itemSet("P710_QUOTATIONAMOUNT",x.TOTALAMOUNT);summary(b,[["Amount",x.AMOUNT],["Other / Footer",x.FOOTERAMOUNT],["Quotation Total",x.TOTALAMOUNT]]);}
function footer(b){var ft=sum(b.m,["FOOTERVALUE"]).FOOTERVALUE;itemSet("P710_DFTOTALAMOUNT",ft);itemSet("P710_FVALUE",ft);var d=region(["QuotationDetail","quotation-detail"]),s=String(apex.item("P710_SNO").getValue()||"");if(d&&s){rows(d.m,function(r){if(String(d.m.getValue(r,"SNO")||"")===s){var a=n(d.m.getValue(r,"AMOUNT"));modelSet(d.m,r,"FOOTERAMOUNT",ft);modelSet(d.m,r,"TOTALAMOUNT",a+ft);}});quotation(d,"footer",{});}}
function start(){var ok=false;if(pid===108)ok=bind(region(["Detail","item-detail"]),"hsplP108",indent);if(pid===708)ok=bind(region(["item-detail","R179881005997839575"]),"hsplP708",enquiry);if(pid===710){ok=bind(region(["QuotationDetail","quotation-detail"]),"hsplP710",quotation);bind(region(["DetailFooter","detailfooter"]),"hsplP710Footer",footer);}if(!ok&&tries++<20)setTimeout(start,250);}
if(pid===708){document.addEventListener("click",function(ev){var b=ev.target.closest&&ev.target.closest("#GETITEM,#getitem,#B40530680715907070");if(!b)return;if(b.dataset.hsplBusy==="Y"){ev.preventDefault();ev.stopImmediatePropagation();return;}b.dataset.hsplBusy="Y";setTimeout(function(){b.disabled=true;b.setAttribute("aria-busy","true");},0);},true);apex.jQuery(document).on("apexafterrefresh.hsplP708 apexservererror.hsplP708","#item-detail,#R179881005997839575",function(){var b=document.querySelector("#GETITEM,#getitem,#B40530680715907070");if(b){b.disabled=false;b.removeAttribute("aria-busy");delete b.dataset.hsplBusy;}});}
apex.jQuery(start);apex.jQuery(document).on("apexafterrefresh.hsplPhase1Safe",function(){tries=0;setTimeout(start,0);});
})();
~';
  l_count number;
begin
  for p in (select id, javascript_code from apex_260100.wwv_flow_steps
             where flow_id=105 and id in (108,708,710)
               and security_group_id=4744311978888504 for update) loop
    if dbms_lob.instr(nvl(p.javascript_code,empty_clob()),'HSPL_PHASE1_FORM_CALC_SAFE_V1')=0 then
      update apex_260100.wwv_flow_steps
         set javascript_code=nvl(javascript_code,empty_clob())||chr(10)||l_js,
             last_updated_on=sysdate,last_updated_by=user
       where flow_id=105 and id=p.id and security_group_id=4744311978888504;
    end if;
  end loop;

  update apex_260100.wwv_flow_page_da_events
     set display_when_type='NEVER',last_updated_on=sysdate,last_updated_by=user
   where flow_id=105 and page_id=108 and name='Set Amount'
     and security_group_id=4744311978888504;
  if sql%rowcount<>1 then raise_application_error(-20001,'Page 108 Set Amount event count mismatch'); end if;

  update apex_260100.wwv_flow_step_processing
     set process_sql_clob=replace(replace(process_sql_clob,
       q'~                        :RATE,
                        :AMOUNT,~',q'~                        :RATE,
                        nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0),~'),
       '                            AMOUNT=:AMOUNT,','                            AMOUNT=nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0),'),
       last_updated_on=sysdate,last_updated_by=user
   where flow_id=105 and flow_step_id=108
     and process_name='Item Detail - Save Interactive Grid Data'
     and security_group_id=4744311978888504;
  if sql%rowcount<>1 then raise_application_error(-20002,'Page 108 save process count mismatch'); end if;

  update apex_260100.wwv_flow_page_da_events
     set triggering_element='QUANTITY1,RATE,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,RATEMEASURINGUNITCODE',
         last_updated_on=sysdate,last_updated_by=user
   where flow_id=105 and page_id=710 and name='set amount'
     and security_group_id=4744311978888504;
  if sql%rowcount<>1 then raise_application_error(-20003,'Page 710 set amount event count mismatch'); end if;

  update apex_260100.wwv_flow_page_da_actions
     set attributes=replace(attributes,'parseInt','parseFloat'),
         last_updated_on=sysdate,last_updated_by=user
   where flow_id=105 and page_id=710
     and id in (41135801765923806,41137529958923806)
     and security_group_id=4744311978888504;
  if sql%rowcount<>2 then raise_application_error(-20004,'Page 710 footer action count mismatch'); end if;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select id page_id,case when dbms_lob.instr(javascript_code,'HSPL_PHASE1_FORM_CALC_SAFE_V1')>0 then 'LIVE_CALC_OK' else 'MISSING' end status
  from apex_260100.wwv_flow_steps where flow_id=105 and id in (108,708,710) order by id;
select page_id,name,triggering_element,nvl(display_when_type,'ENABLED') display_status
  from apex_260100.wwv_flow_page_da_events where flow_id=105
   and ((page_id=108 and name='Set Amount') or (page_id=710 and name='set amount')) order by page_id;
select count(*) decimal_footer_actions from apex_260100.wwv_flow_page_da_actions
 where flow_id=105 and page_id=710 and id in (41135801765923806,41137529958923806)
   and dbms_lob.instr(attributes,'parseFloat')>0 and dbms_lob.instr(attributes,'parseInt')=0;
exit
