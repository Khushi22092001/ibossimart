whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 200
set lines 240
set trimspool on
connect -name IMART

prompt === MODULEATTACHMENT COLUMNS ===
select column_id, column_name, data_type
  from user_tab_columns
 where table_name = 'MODULEATTACHMENT'
 order by column_id;

prompt === ROWS FOR CURRENT INDENT TNO 56984373 ===
select tno,
       moduletno,
       modulesno,
       attributecode,
       filename,
       mimetype,
       dbms_lob.getlength(attachmentblob) blob_bytes
  from moduleattachment
 where moduletno = 56984373
 order by tno desc;

prompt === INDENT ROW AND NEARBY INDENTS ===
select tno, indentno, indentdate, creator, creationtime
  from indent
 where tno between 56984350 and 56984450
 order by tno desc;

prompt === NEWEST ATTACHMENT ROWS ===
select *
  from (
        select tno,
               moduletno,
               modulesno,
               attributecode,
               filename,
               mimetype,
               dbms_lob.getlength(attachmentblob) blob_bytes
          from moduleattachment
         order by tno desc
       )
 where rownum <= 40;

exit
