set pages 200 lines 240 long 200000 longchunksize 200000 trimspool on
connect -name IMART
column message format a180
select to_char(message_timestamp,'HH24:MI:SS.FF3') ts, message_level, message
  from apex_debug_messages
 where session_id = 22102041901353
 order by message_timestamp desc
 fetch first 80 rows only;
exit
