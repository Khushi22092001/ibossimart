whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 200
set lines 2000
set trimspool on
connect -name IMART

prompt === ATTACHMENTS FOR CURRENT NEW INDENT KEY ===
select tno,
       moduletno,
       modulesno,
       attributecode,
       filename,
       mimetype,
       dbms_lob.getlength(attachmentblob) as blob_bytes
  from moduleattachment
 where moduletno = 56984302
 order by tno desc;

prompt === RECENT ATTACHMENTS WITH NULL MODULE OR ATTRIBUTE KEY ===
select *
  from (
        select tno,
               moduletno,
               modulesno,
               attributecode,
               filename,
               mimetype,
               dbms_lob.getlength(attachmentblob) as blob_bytes
          from moduleattachment
         where moduletno is null
            or attributecode is null
         order by tno desc
       )
 where rownum <= 30;

exit
