whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/*
  Purchase Order Page 118 only.
  Keep the existing General-region order and move no business controls. On
  desktop, render its existing left and right card tracks independently so a
  taller card on one side cannot leave blank space below a shorter neighbour.
*/
declare
  l_js     clob;
  l_css    clob;
  l_marker constant varchar2(80) := 'HSPL_P118_COMPACT_GENERAL_V1';
begin
  select javascript_code_onload, inline_css
    into l_js, l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504
   for update;

  if l_js is null or dbms_lob.instr(l_js, l_marker) = 0 then
    l_js := nvl(l_js, to_clob('')) || to_clob(chr(10)) || q'~
/* HSPL_P118_COMPACT_GENERAL_V1
   Preserve the authored Purchase Order General order while removing only the
   desktop whitespace caused by unequal card heights in paired APEX rows. */
(function () {
    var state;
    var leftNames = ['Currency', 'Texts', 'Other Informations'];
    var rightNames = ['Select Indent', 'GST In Nature And Transaction', 'PO Amendment Detail'];
    var allNames = leftNames.concat(rightNames);

    function regionName(slot) {
        var region = Array.prototype.find.call(slot.children, function (child) {
            return child.classList && child.classList.contains('t-Region');
        });
        var title = region && region.querySelector('.t-Region-title');
        return title ? title.textContent.replace(/\s+/g, ' ').trim() : '';
    }

    function restore() {
        if (!state) return;
        state.rows.forEach(function (row) {
            state.slots.get(row).forEach(function (slot) { row.appendChild(slot); });
            state.board.parentNode.insertBefore(row, state.board);
        });
        state.board.remove();
        state = null;
    }

    function compact() {
        if (window.innerWidth < 768) {
            restore();
            return;
        }
        if (state) return;

        var root = document.getElementById('General') || document.getElementById('general');
        var container = root && root.querySelector(':scope > .t-Region-bodyWrap > .t-Region-body > .container');
        if (!container) return;

        var rows = Array.prototype.filter.call(container.children, function (child) {
            return child.classList && child.classList.contains('row');
        });
        var slotsByName = {};
        var compactRows = [];
        var slotsByRow = new Map();

        rows.forEach(function (row) {
            var slots = Array.prototype.filter.call(row.children, function (child) {
                return child.classList && child.classList.contains('col') && allNames.indexOf(regionName(child)) !== -1;
            });
            if (slots.length && slots.length === row.children.length) {
                compactRows.push(row);
                slotsByRow.set(row, slots);
                slots.forEach(function (slot) { slotsByName[regionName(slot)] = slot; });
            }
        });

        if (compactRows.length !== 3 || allNames.some(function (name) { return !slotsByName[name]; })) return;

        var board = document.createElement('div');
        var left = document.createElement('div');
        var right = document.createElement('div');
        board.className = 'hspl-p118-compact-board';
        left.className = 'hspl-p118-compact-track';
        right.className = 'hspl-p118-compact-track';
        leftNames.forEach(function (name) { left.appendChild(slotsByName[name]); });
        rightNames.forEach(function (name) { right.appendChild(slotsByName[name]); });
        board.appendChild(left);
        board.appendChild(right);
        container.insertBefore(board, compactRows[0]);
        compactRows.forEach(function (row) { row.remove(); });
        state = { board: board, rows: compactRows, slots: slotsByRow };
    }

    var timer;
    function schedule() {
        window.clearTimeout(timer);
        timer = window.setTimeout(compact, 0);
    }

    [0, 180, 700, 1400].forEach(function (delay) { window.setTimeout(compact, delay); });
    window.addEventListener('resize', schedule, { passive: true });
    document.addEventListener('apexafterrefresh', schedule, true);
})();~';
  end if;

  if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || to_clob(chr(10)) || q'~
/* HSPL_P118_COMPACT_GENERAL_V1 */
@media (min-width: 768px) {
    #General .hspl-p118-compact-board,
    #general .hspl-p118-compact-board {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 12px;
        margin-top: 12px;
    }

    #General .hspl-p118-compact-track,
    #general .hspl-p118-compact-track {
        display: flex;
        min-width: 0;
        flex-direction: column;
        gap: 12px;
    }

    #General .hspl-p118-compact-track > .col,
    #general .hspl-p118-compact-track > .col {
        float: none;
        width: auto;
        max-width: none;
        margin: 0;
        padding: 0;
    }
}~';
  end if;

  update apex_260100.wwv_flow_steps
     set javascript_code_onload = l_js,
         inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected exactly one Purchase Order Page 118 update.');
  end if;

  commit;
end;
/

exit
