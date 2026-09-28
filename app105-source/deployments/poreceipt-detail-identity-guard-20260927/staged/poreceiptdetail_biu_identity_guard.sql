create or replace trigger poreceiptdetail_biu_identity_guard
for insert or update of tno, sno on poreceiptdetail
compound trigger
    type key_record is record (
        tno poreceiptdetail.tno%type,
        sno poreceiptdetail.sno%type
    );
    type key_table is table of key_record index by pls_integer;
    g_keys key_table;
    g_key_count pls_integer := 0;

    procedure remember_key(p_tno poreceiptdetail.tno%type,
                           p_sno poreceiptdetail.sno%type) is
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
    begin
        if :new.tno is null or :new.sno is null then
            raise_application_error(-20032,
                'PO Receipt detail requires a unique line identity before it can be saved.');
        end if;

        if inserting
           or :new.tno <> :old.tno
           or :new.sno <> :old.sno then
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
                  from poreceiptdetail
                 where tno = g_keys(i).tno
                   and sno = g_keys(i).sno;
                if l_duplicate_count > 1 then
                    raise_application_error(-20032,
                        'PO Receipt detail line identity is already in use in this document. Please refresh and retry.');
                end if;
            end loop;
        end if;
    end after statement;
end poreceiptdetail_biu_identity_guard;
/
show errors trigger poreceiptdetail_biu_identity_guard
