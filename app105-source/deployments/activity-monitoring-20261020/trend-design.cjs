// Real, authorized counts shared by the native chart and its companion table.
module.exports=({day,grainBind,drill})=>{
 const grain=`case when ${grainBind}='MONTH' then 'MONTH' when (${grainBind}='HOUR' and ${day('TO')}-${day('FROM')}<=6) or (${grainBind}='DAY' and ${day('TO')}=${day('FROM')}) then 'HOUR' else 'DAY' end`;
 const params=`select ${day('FROM')} f,${day('TO')} t,${grain} grain from dual`;
 const buckets=`
 select case grain when 'MONTH' then add_months(trunc(f,'MM'),level-1) when 'HOUR' then f+(level-1)/24 else f+level-1 end bucket,grain
 from (${params}) connect by level<=case grain when 'MONTH' then months_between(trunc(t,'MM'),trunc(f,'MM'))+1 when 'HOUR' then (t-f+1)*24 else t-f+1 end`;
 const counts=`select case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end bucket,e.operation series,count(*) value
 from IMART_ACTIVITY_SCOPE_V e cross join (${params}) p where e.operation in ('INSERT','UPDATE','DELETE')
 group by case p.grain when 'MONTH' then trunc(e.local_timestamp,'MM') when 'HOUR' then trunc(e.local_timestamp,'HH24') else trunc(e.local_timestamp) end,e.operation`;
 const operations=`select 'INSERT' series from dual union all select 'UPDATE' from dual union all select 'DELETE' from dual`;
 const sql=`select to_char(b.bucket,case b.grain when 'MONTH' then 'YYYY-MM' when 'HOUR' then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) label,o.series,nvl(c.value,0) value
 from (${buckets}) b cross join (${operations}) o left join (${counts}) c on c.bucket=b.bucket and c.series=o.series
 where exists(select 1 from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')) order by label,series`;
 const tableSQL=`select label,max(case when series='INSERT' then value end) inserts,max(case when series='UPDATE' then value end) updates,max(case when series='DELETE' then value end) deletes from (${sql}) group by label order by label`;
 const cell=(op,col)=>`htp.p('<td><a href="'||apex_escape.html_attribute(${drill(['PERIOD','ACTION'],['r.label',`'${op}'`])})||'">'||to_char(r.${col},'FM999G999G999G990')||'</a></td>');`;
 const tableSource=`declare n number:=0;begin
 htp.p('<div class="am-trend-table-wrap"><table class="am-trend-table"><caption>Activity trend data — same period and filters as the chart</caption><thead><tr><th scope="col">Period</th><th scope="col">Insert</th><th scope="col">Update</th><th scope="col">Delete</th></tr></thead><tbody>');
 for r in (${tableSQL}) loop
 n:=n+1;
 htp.p('<tr><th scope="row">'||apex_escape.html(case length(r.label) when 13 then to_char(to_date(substr(r.label,1,10),'YYYY-MM-DD'),'Dy, DD Mon','NLS_DATE_LANGUAGE=English')||' '||substr(r.label,12,2)||':00' when 7 then to_char(to_date(r.label||'-01','YYYY-MM-DD'),'Mon YYYY','NLS_DATE_LANGUAGE=English') else to_char(to_date(r.label,'YYYY-MM-DD'),'Dy, DD Mon','NLS_DATE_LANGUAGE=English') end)||'</th>');
 ${cell('INSERT','inserts')}${cell('UPDATE','updates')}${cell('DELETE','deletes')}
 htp.p('</tr>');end loop;
 if n=0 then htp.p('<tr><td colspan="4">No captured insert, update or delete events match the selected filters.</td></tr>');end if;
 htp.p('</tbody></table></div><p class="am-trend-note">Actual captured ERP events. Zero indicates no captured operation in that period. Select a point or count to view its events.</p>');
 end;`;
 const introSource=`declare g varchar2(10);begin select ${grain} into g from dual;
 htp.p('<div class="am-trend-intro"><h3>'||case g when 'HOUR' then 'Hourly' when 'MONTH' then 'Monthly' else 'Daily' end||' ERP operations</h3><p>Insert, update and delete events for the selected reporting period. Single-day views use hourly detail.</p></div>');end;`;
 return {sql,tableSQL,tableSource,introSource};
};
