create or replace trigger salesorderdetail_biu_identity_guard
for insert or update of tno, sno on salesorderdetail
compound trigger
    type key_record is record (
        tno salesorderdetail.tno%type,
        sno salesorderdetail.sno%type
    );
    type key_table is table of key_record index by pls_integer;
    g_keys key_table;
    g_key_count pls_integer := 0;

    procedure remember_key(p_tno salesorderdetail.tno%type,
                           p_sno salesorderdetail.sno%type) is
    begin
        if g_key_count > 0 then
            for i in 1 .. g_key_count loop
                if g_keys(i).tno = p_tno and g_keys(i).sno = p_sno then
                    return;
                end if;
            end loop;
        end if;
        g_key_count := g_key_count + 1;
        g_keys(g_key_count).tno := p_tno;
        g_keys(g_key_count).sno := p_sno;
    end remember_key;

    before each row is
        l_header_tno salesorder.tno%type;
    begin
        if :new.tno is null or :new.sno is null then
            raise_application_error(-20031,
                'Sales Order detail requires a unique line identity before it can be saved.');
        end if;

        if inserting
           or :new.tno <> :old.tno
           or :new.sno <> :old.sno then
            /* Serialise identity allocation within the document. */
            begin
                select tno
                  into l_header_tno
                  from salesorder
                 where tno = :new.tno
                   for update;
            exception
                when no_data_found then
                    /* Receipt-driven entry can create valid detail rows before header DML. */
                    null;
            end;
            remember_key(:new.tno, :new.sno);
        end if;
    end before each row;

    after statement is
        l_duplicate_count pls_integer;
    begin
        if g_key_count > 0 then
            for i in 1 .. g_key_count loop
                select count(*)
                  into l_duplicate_count
                  from salesorderdetail
                 where tno = g_keys(i).tno
                   and sno = g_keys(i).sno;
                if l_duplicate_count > 1 then
                    raise_application_error(-20031,
                        'Sales Order detail line identity is already in use in this document. Please refresh and retry.');
                end if;
            end loop;
        end if;
    end after statement;
end salesorderdetail_biu_identity_guard;
/
show errors trigger salesorderdetail_biu_identity_guard
