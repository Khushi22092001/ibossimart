create or replace package imart_purchasebill_calc authid definer as
  function footer_value(
    p_legend        varchar2,
    p_base_amount   number,
    p_percent       number,
    p_current_value number,
    p_quantity      number
  ) return number deterministic;

  procedure recalculate_line(
    p_tno                   number,
    p_sno                   number,
    p_itemcode              varchar2,
    p_itemspecificationcode varchar2,
    p_quantity1             number,
    p_quantity2             number,
    p_rate                  number,
    p_rate_uom              varchar2,
    p_partycode             varchar2,
    p_transactiontypecode   varchar2,
    o_quantity1             out number,
    o_quantity2             out number,
    o_amount                out number,
    o_footeramount          out number,
    o_totalamount           out number
  );

  procedure reconcile_bill(p_tno number);
end imart_purchasebill_calc;
/

create or replace package body imart_purchasebill_calc as
  c_manual_tolerance constant number := 0.0051;

  function normalized_legend(p_legend varchar2) return varchar2 deterministic is
  begin
    return upper(trim(p_legend));
  end normalized_legend;

  function footer_value(
    p_legend        varchar2,
    p_base_amount   number,
    p_percent       number,
    p_current_value number,
    p_quantity      number
  ) return number deterministic is
    l_legend varchar2(30) := normalized_legend(p_legend);
    l_value  number;
  begin
    l_value := nvl(p_base_amount, 0) * nvl(p_percent, 0) / 100;

    case l_legend
      when 'PRA' then return round(abs(l_value), 0);
      when 'PRD' then return -round(abs(l_value), 0);
      when 'PAA' then return abs(l_value);
      when 'PAD' then return -abs(l_value);
      when 'OQA' then return abs(nvl(p_quantity, 0) * nvl(p_percent, 0) / 100);
      when 'OQD' then return -abs(nvl(p_quantity, 0) * nvl(p_percent, 0) / 100);
      when 'LSA' then return abs(nvl(p_current_value, 0));
      when 'LSD' then return -abs(nvl(p_current_value, 0));
      else return nvl(p_current_value, 0);
    end case;
  end footer_value;

  procedure derive_line_amount(
    p_itemcode              varchar2,
    p_itemspecificationcode varchar2,
    p_quantity1             number,
    p_quantity2             number,
    p_rate                  number,
    p_rate_uom              varchar2,
    o_quantity1             out number,
    o_quantity2             out number,
    o_amount                out number
  ) is
    l_unit1  item.measuringunitcode1%type;
    l_unit2  item.measuringunitcode2%type;
    l_factor itemspecification.multiplyingfactor%type;
    l_rate_uom varchar2(100) := upper(trim(p_rate_uom));
  begin
    select measuringunitcode1, measuringunitcode2
      into l_unit1, l_unit2
      from item
     where itemcode = p_itemcode;

    select max(multiplyingfactor)
      into l_factor
      from itemspecification
     where itemspecificationcode = p_itemspecificationcode;

    o_quantity1 := round(nvl(p_quantity1, 0), getuomdecimal(l_unit1));
    o_quantity2 := case
                     when l_factor is not null then
                       round(o_quantity1 * l_factor,
                             getuomdecimal(nvl(l_unit2, l_unit1)))
                     else nvl(p_quantity2, 0)
                   end;

    if l_rate_uom is null and l_unit2 is null then
      l_rate_uom := upper(trim(l_unit1));
    end if;

    if l_rate_uom = upper(trim(l_unit1)) then
      o_amount := nvl(p_rate, 0) * o_quantity1;
    elsif l_unit2 is not null and l_rate_uom = upper(trim(l_unit2)) then
      o_amount := nvl(p_rate, 0) * o_quantity2;
    else
      raise_application_error(
        -20031,
        'Rate unit ' || nvl(p_rate_uom, '<blank>') ||
        ' does not match item ' || p_itemcode ||
        ' units (' || nvl(l_unit1, '-') || '/' || nvl(l_unit2, '-') || ').'
      );
    end if;
  exception
    when no_data_found then
      raise_application_error(-20032, 'Item ' || p_itemcode || ' is not available for Purchase Bill calculation.');
  end derive_line_amount;

  procedure generate_tax_footer(
    p_tno                 number,
    p_sno                 number,
    p_itemspecificationcode varchar2,
    p_partycode           varchar2,
    p_transactiontypecode varchar2,
    p_amount              number,
    p_quantity1           number
  ) is
    l_hsncode itemspecification.hsncode%type;
    l_count   number;
  begin
    select count(*)
      into l_count
      from purchasebilldetailfooter
     where tno = p_tno
       and sno = p_sno;

    if l_count > 0 or nvl(p_amount, 0) = 0 then
      return;
    end if;

    select max(trim(hsncode))
      into l_hsncode
      from itemspecification
     where itemspecificationcode = p_itemspecificationcode;

    for r in (
      select rownum serialno,
             x.legendscode,
             x.footerheadcode,
             x.footerpercent
        from (
          select distinct
                 a.legendscode,
                 c.footerheadcode,
                 b.taxrate footerpercent
            from taxruledetail a
            join taxruledetailfooter b
              on b.tno = a.tno and b.sno = a.sno
            join footerhead c
              on c.footerheadcode = b.footerheadcode
            join taxrule d
              on d.tno = a.tno
            join taxrulehsn e
              on e.tno = d.tno
            join party f
              on f.taxregistrationtypecode = d.taxregistrationtypecode
           where f.partycode = p_partycode
             and d.transactiontypecode = p_transactiontypecode
             and trim(e.hsncode) = trim(l_hsncode)
           order by c.footerheadcode
        ) x
    ) loop
      insert into purchasebilldetailfooter
        (tno, sno, sn, footerheadcode, footerpercent,
         footervalue, serialno, legendscode)
      values
        (p_tno, p_sno, globaltno.nextval, r.footerheadcode, r.footerpercent,
         footer_value(r.legendscode, p_amount, r.footerpercent, 0, p_quantity1),
         r.serialno, r.legendscode);
    end loop;
  end generate_tax_footer;

  procedure recalculate_existing_footer(
    p_tno        number,
    p_sno        number,
    p_old_amount number,
    p_new_amount number,
    p_old_qty1   number,
    p_new_qty1   number
  ) is
    l_old_auto number;
    l_new_value number;
    l_legend varchar2(30);
  begin
    for r in (
      select rowid rid, legendscode, footerpercent, footervalue
        from purchasebilldetailfooter
       where tno = p_tno
         and sno = p_sno
    ) loop
      l_legend := normalized_legend(r.legendscode);

      if l_legend in ('PRA','PRD','PAA','PAD','OQA','OQD') then
        l_old_auto := footer_value(
          r.legendscode, p_old_amount, r.footerpercent,
          r.footervalue, p_old_qty1
        );

        -- A value changed deliberately by the user is an override.  Automatic
        -- values (including earlier two-decimal values) follow the new base.
        if abs(nvl(r.footervalue, 0) - nvl(l_old_auto, 0)) <= c_manual_tolerance then
          l_new_value := footer_value(
            r.legendscode, p_new_amount, r.footerpercent,
            r.footervalue, p_new_qty1
          );
          update purchasebilldetailfooter
             set footervalue = l_new_value
           where rowid = r.rid;
        end if;
      elsif l_legend = 'LSA' then
        update purchasebilldetailfooter
           set footervalue = abs(nvl(footervalue, 0))
         where rowid = r.rid;
      elsif l_legend = 'LSD' then
        update purchasebilldetailfooter
           set footervalue = -abs(nvl(footervalue, 0))
         where rowid = r.rid;
      end if;
    end loop;
  end recalculate_existing_footer;

  procedure recalculate_line(
    p_tno                   number,
    p_sno                   number,
    p_itemcode              varchar2,
    p_itemspecificationcode varchar2,
    p_quantity1             number,
    p_quantity2             number,
    p_rate                  number,
    p_rate_uom              varchar2,
    p_partycode             varchar2,
    p_transactiontypecode   varchar2,
    o_quantity1             out number,
    o_quantity2             out number,
    o_amount                out number,
    o_footeramount          out number,
    o_totalamount           out number
  ) is
    l_old_amount number := 0;
    l_old_qty1   number := 0;
  begin
    begin
      select nvl(amount, 0), nvl(quantity1, 0)
        into l_old_amount, l_old_qty1
        from purchasebilldetail
       where tno = p_tno
         and sno = p_sno;
    exception
      when no_data_found then
        null;
    end;

    derive_line_amount(
      p_itemcode, p_itemspecificationcode,
      p_quantity1, p_quantity2, p_rate, p_rate_uom,
      o_quantity1, o_quantity2, o_amount
    );

    generate_tax_footer(
      p_tno, p_sno, p_itemspecificationcode,
      p_partycode, p_transactiontypecode,
      o_amount, o_quantity1
    );

    recalculate_existing_footer(
      p_tno, p_sno,
      l_old_amount, o_amount,
      l_old_qty1, o_quantity1
    );

    select nvl(sum(footervalue), 0)
      into o_footeramount
      from purchasebilldetailfooter
     where tno = p_tno
       and sno = p_sno;

    o_totalamount := nvl(o_amount, 0) + nvl(o_footeramount, 0);

    update purchasebilldetail
       set quantity1 = o_quantity1,
           quantity2 = o_quantity2,
           amount = o_amount,
           footeramount = o_footeramount,
           totalamount = o_totalamount
     where tno = p_tno
       and sno = p_sno;
  end recalculate_line;

  procedure reconcile_bill(p_tno number) is
    l_partycode           purchasebill.partycode%type;
    l_transactiontypecode purchasebill.transactiontypecode%type;
    l_bill_in_round       purchasebill.billinroundfigure%type;
    l_q1 number;
    l_q2 number;
    l_amount number;
    l_footer number;
    l_total number;
    l_sum_amount number;
    l_sum_footer number;
    l_before_round number;
    l_roundoff number;
    l_bill_amount number;
  begin
    select partycode, transactiontypecode, billinroundfigure
      into l_partycode, l_transactiontypecode, l_bill_in_round
      from purchasebill
     where tno = p_tno
     for update;

    for r in (
      select sno, itemcode, itemspecificationcode,
             quantity1, quantity2, rate, ratemeasuringunitcode
        from purchasebilldetail
       where tno = p_tno
       order by sno
    ) loop
      recalculate_line(
        p_tno, r.sno, r.itemcode, r.itemspecificationcode,
        r.quantity1, r.quantity2, r.rate, r.ratemeasuringunitcode,
        l_partycode, l_transactiontypecode,
        l_q1, l_q2, l_amount, l_footer, l_total
      );
    end loop;

    select nvl(sum(amount), 0),
           nvl(sum(footeramount), 0),
           nvl(sum(totalamount), 0)
      into l_sum_amount, l_sum_footer, l_before_round
      from purchasebilldetail
     where tno = p_tno;

    if upper(nvl(l_bill_in_round, 'NO')) = 'YES' then
      l_bill_amount := round(l_before_round, 0);
      l_roundoff := l_bill_amount - l_before_round;
    else
      l_bill_amount := l_before_round;
      l_roundoff := 0;
    end if;

    update purchasebill
       set sumofamount = l_sum_amount,
           sumoffooteramount = l_sum_footer,
           purchasebillamountbeforeround = l_before_round,
           roundoff = l_roundoff,
           purchasebillamount = l_bill_amount
     where tno = p_tno;
  exception
    when no_data_found then
      raise_application_error(-20033, 'Purchase Bill ' || p_tno || ' is not available for reconciliation.');
  end reconcile_bill;
end imart_purchasebill_calc;
/

show errors package imart_purchasebill_calc
show errors package body imart_purchasebill_calc
