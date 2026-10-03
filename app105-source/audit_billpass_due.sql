set define off
connect -name IMART
select count(*) documents,count(duedate) explicit_due from pbpass;
select tno,duedate from pbpass where tno in(57068232,57065535,57065217);
exit
