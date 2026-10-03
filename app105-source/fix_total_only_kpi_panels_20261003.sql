whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on size unlimited
connect -name IMART

declare
  l_exists number;
begin
  select count(*)
    into l_exists
    from user_tables
   where table_name = 'IMART_RKPI_SHELL_BAK_TOTALONLY';

  if l_exists = 0 then
    execute immediate q'~
      create table imart_rkpi_shell_bak_totalonly as
      select id, flow_id, page_id, static_id, plug_source
        from apex_260100.wwv_flow_page_plugs
       where flow_id = 105
         and static_id like 'coverage-kpi-shell-%'
    ~';
  end if;
end;
/

declare
  l_old_success varchar2(32767) := q'~      success: function (data) {
        root.querySelector('[data-kpi-scope]').textContent = data.scope;
        content.replaceChildren();
        data.cards.forEach(function (card) {
          if (card.mode === 'STATUS' && (!card.status || /^NO[ _-]?STATUS$/i.test(card.label))) return;~';
  l_new_success varchar2(32767) := q'~      success: function (data) {
        var cards = data.cards.filter(function (card) {
          return card.mode !== 'STATUS' || (card.status && !/^NO[ _-]?STATUS$/i.test(card.label));
        });
        root.querySelector('[data-kpi-scope]').textContent = data.scope;
        content.replaceChildren();
        if (cards.length <= 1 && (!cards[0] || cards[0].mode === 'ALL')) {
          root.hidden = true;
          return;
        }
        root.hidden = false;
        cards.forEach(function (card) {~';
  l_old_error varchar2(32767) := q'~      error: function (request, status) {
        if (status === 'abort') return;
        if (!content.querySelector('.mr-inline-kpi')) {~';
  l_new_error varchar2(32767) := q'~      error: function (request, status) {
        if (status === 'abort') return;
        root.hidden = false;
        if (!content.querySelector('.mr-inline-kpi')) {~';
  l_total number;
  l_success_matches number;
  l_error_matches number;
  l_updated number;
begin
  select count(*),
         sum(case when dbms_lob.instr(plug_source, l_old_success) > 0 then 1 else 0 end),
         sum(case when dbms_lob.instr(plug_source, l_old_error) > 0 then 1 else 0 end)
    into l_total, l_success_matches, l_error_matches
    from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and static_id like 'coverage-kpi-shell-%';

  if l_total = 0 or l_success_matches <> l_total or l_error_matches <> l_total then
    raise_application_error(-20001,
      'Coverage shell signature mismatch. total=' || l_total ||
      ', success=' || l_success_matches || ', error=' || l_error_matches);
  end if;

  update apex_260100.wwv_flow_page_plugs
     set plug_source = replace(
                       replace(
                         replace(plug_source, l_old_success, l_new_success),
                         l_old_error, l_new_error
                       ),
                       '<section id="coverage-kpis-',
                       '<section hidden id="coverage-kpis-'
                     )
   where flow_id = 105
     and static_id like 'coverage-kpi-shell-%';

  l_updated := sql%rowcount;
  dbms_output.put_line('UPDATED_COVERAGE_SHELLS=' || l_updated);
end;
/

commit;

prompt === Post-deploy verification ===
select count(*) total_shells,
       sum(case when dbms_lob.instr(plug_source, 'var cards = data.cards.filter') > 0 then 1 else 0 end) patched_shells,
       sum(case when dbms_lob.instr(plug_source, '<section hidden id="coverage-kpis-') > 0 then 1 else 0 end) initially_hidden_shells,
       sum(case when dbms_lob.instr(plug_source, 'root.hidden = false;') > 0 then 1 else 0 end) reveal_capable_shells
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and static_id like 'coverage-kpi-shell-%';

exit
