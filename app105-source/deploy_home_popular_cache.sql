whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

begin
  execute immediate q'[
    create table imart_home_popular_cache (
      app_user       varchar2(255) not null,
      display_order  number        not null,
      page_id        number        not null,
      page_name      varchar2(4000) not null,
      visit_count    number        not null,
      refreshed_at   timestamp     not null,
      constraint imart_home_popular_cache_pk primary key (app_user, display_order)
    )]';
exception
  when others then
    if sqlcode != -955 then
      raise;
    end if;
end;
/

create or replace package imart_home_popular_cache_pkg authid definer as
  procedure refresh_user(p_app_user varchar2);
  procedure refresh_all;
end imart_home_popular_cache_pkg;
/

create or replace package body imart_home_popular_cache_pkg as
  procedure refresh_user(p_app_user varchar2) is
    l_user varchar2(255) := upper(trim(p_app_user));
  begin
    delete from imart_home_popular_cache
     where app_user = l_user;

    insert into imart_home_popular_cache (
      app_user, display_order, page_id, page_name, visit_count, refreshed_at
    )
    with activity as (
      select nvl((select max(m.pageno)
                    from module m
                   where m.entrypageno = a.page_id), a.page_id) as page_id,
             a.page_name,
             a.view_timestamp
        from apex_260100.apex_workspace_activity_log a
       where a.workspace_id = 4744311978888504
         and a.application_id = 105
         and upper(a.apex_user) = l_user
         and a.page_id not in (0, 1)
         and a.page_name is not null
    ), popular as (
      select page_id,
             max(page_name) keep (dense_rank last order by view_timestamp) as page_name,
             count(*) as visit_count,
             max(view_timestamp) as last_visit
        from activity
       group by page_id
    )
    select l_user,
           row_number() over (order by visit_count desc, last_visit desc),
           page_id,
           page_name,
           visit_count,
           systimestamp
      from popular
     order by visit_count desc, last_visit desc
     fetch first 8 rows only;
  end refresh_user;

  procedure refresh_all is
  begin
    for r in (
      select distinct upper(apex_user) as app_user
        from apex_260100.apex_workspace_activity_log
       where workspace_id = 4744311978888504
         and application_id = 105
         and apex_user is not null
    ) loop
      refresh_user(r.app_user);
    end loop;
    commit;
  end refresh_all;
end imart_home_popular_cache_pkg;
/

begin
  imart_home_popular_cache_pkg.refresh_user('BOSS');
  commit;
end;
/

begin
  dbms_scheduler.drop_job('IMART_HOME_POPULAR_CACHE_REFRESH', force => true);
exception
  when others then
    if sqlcode != -27475 then
      raise;
    end if;
end;
/

begin
  dbms_scheduler.create_job(
    job_name        => 'IMART_HOME_POPULAR_CACHE_REFRESH',
    job_type        => 'STORED_PROCEDURE',
    job_action      => 'IMART_HOME_POPULAR_CACHE_PKG.REFRESH_ALL',
    start_date      => systimestamp,
    repeat_interval => 'FREQ=MINUTELY;INTERVAL=15',
    enabled         => true,
    comments        => 'Refreshes user-specific Home Popular Pages cache.'
  );
end;
/

select app_user, display_order, page_id, page_name, visit_count
  from imart_home_popular_cache
 where app_user = 'BOSS'
 order by display_order;

exit
