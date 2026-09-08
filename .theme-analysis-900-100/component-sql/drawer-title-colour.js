/* App 100: existing filter regions only. Generated from the live APEX inventory.
 * Names are not used at runtime; exact region IDs protect data-entry regions.
 * Native report toolbars and pages without filter panels remain unchanged.
 */
(function () {
"use strict";
var regions={"6":["R850376804415947960"],"58":["R460257923003439684"],"68":["filter"],"84":["R675829004672489239"],"107":["R454373023918407098"],"117":["R932077842059532940"],"125":["R436533936898832976"],"126":["R849612524466159953"],"129":["R501252388837381900"],"135":["R753493358357888477"],"137":["R455661128926205771"],"139":["R508660520277326633"],"141":["R676259443034147333"],"142":["R471543028822584490"],"143":["R588006393018613391"],"144":["R608989691320812615"],"145":["R454511935915570738"],"147":["R487296826495477985"],"149":["R469836060550789198"],"151":["R491630897534935472"],"153":["R369816593782720908"],"154":["R940014741807041088"],"158":["R788008257378677893"],"160":["R601598090036489013"],"165":["R850782053562049290"],"167":["R499478832466845194"],"170":["R575003988812442316"],"174":["R570649649406456598"],"178":["R470108898078046055"],"180":["R470174140895370888"],"182":["R674016304664985209"],"183":["R599423067120738466"],"186":["R481444368885977309"],"190":["R597230619932789718"],"192":["R787817818358179104"],"194":["R590761245996961734"],"196":["R17289989394747912"],"198":["R554704027264772067"],"199":["R635061721335227064"],"201":["R470052245689640046"],"210":["Bill Age Summary"],"212":["R499057488604589924"],"219":["Creditors Aging Detail Report"],"220":["R520679470144316292"],"222":["R444956616231953783"],"227":["Creditors Aging Detail Report"],"231":["R745422105006524279"],"233":["R765353097788618354"],"243":["R632463758441943244"],"245":["R708450448679169617"],"249":["R53858310323436025229"],"262":["R690837179304466320"],"265":["R588452667149532802"],"268":["R778885316450264035"],"280":["R199282025651062739"],"281":["R185118411599167315"],"282":["R53865135509287198995"],"283":["R185143532306207460"],"288":["R777351267722751123"],"290":["R201328079458173059"],"291":["R174393357782309695"],"293":["R212306900860172448"],"294":["R212317345151176740"],"295":["R202233203743820651"],"296":["R186904342368689023"],"298":["R189899871447682573"],"299":["R208960282543148302"],"300":["R369365429337789746"],"302":["R286103438053341810"],"304":["R510664331922104184"],"309":["R226182079425266784"],"314":["R534777353875628845"],"316":["R526831931490430972"],"333":["R974698034550844107"],"335":["R1018423206877626133"],"337":["R1062499638732175429"],"339":["R1106730902224003531"],"341":["R1151193709769737279"],"343":["R1108085425501938977"],"345":["R1153752918693004771"],"353":["General"],"354":["General"],"362":["R32013863132265008"],"364":["R38421786660577169"],"378":["R46377847069659378"],"400":["R53722083975737758809"],"401":["R53805944115527157970"],"402":["R53746538685179349106"],"403":["R552542887464265946"],"404":["R572438421368302446"],"405":["R576546640182074016"],"406":["R596651765149210057"],"407":["R541824818744244190"],"410":["R653419179335914643"],"411":["R460666287231806507"],"413":["General"],"414":["R519382070026121719"],"416":["General"],"417":["filter"],"419":["filter"],"505":["R437481402124592651"],"507":["R445453352115357421"],"523":["Creditors Aging Detail Report"],"619":["R880200174003574510"],"621":["R763214651994523780"],"631":["R602819050902911670"],"640":["R613179379609520376"],"644":["R464568915332753991"],"648":["R453766980910245245"],"651":["R554307232073055374"],"657":["R520789097775023822"],"659":["R487275381818070080"],"665":["R602801142935671697"],"669":["R602807102993768468"],"671":["R648450850536878264"],"673":["R458585580639983241"],"674":["R561790086247795621"],"676":["R573892843430108053"],"681":["R648617370322131608"],"691":["R699226372204726865"],"701":["R1099671209506383456"],"704":["R1165191432808429254"],"707":["R403978528299007891"],"709":["R426665564026815847"],"711":["R449220188650155446"],"713":["R1048584912060896311"]};
function adapt(){
 var pageInput=document.getElementById("pFlowStepId");
 var page=pageInput ? Number(pageInput.value) : Number((document.documentElement.className.match(/(?:^|\\s)page-(\\d+)/)||[])[1]);
 if(document.querySelector(".hspl-drawer,.js-filter-drawer"))return;
 var panels=(regions[page]||[]).map(function(id){return document.getElementById(id);}).filter(function(r){
  // A containing region must never take its report/grid into the drawer.
  return r && !r.querySelector(".a-IRR,.a-IG,.t-Report") && !r.closest(".ui-dialog");
 });
 if(!panels.length)return;
 var drawer;
 if(panels.length===1 && panels[0].classList.contains("t-Region") && panels[0].querySelector(".t-Region-header")){
  drawer=panels[0];
 }else{
  drawer=document.createElement("section");
  drawer.id="hspl-existing-filters";
  drawer.className="t-Region";
  var header=document.createElement("div");
  header.className="t-Region-header";
  var heading=document.createElement("h2");
  heading.className="t-Region-title";
  heading.textContent="Filters";
  header.appendChild(heading);
  drawer.appendChild(header);
  var body=document.createElement("div");
  body.className="t-Region-body";
  drawer.appendChild(body);
  panels[0].parentNode.insertBefore(drawer,panels[0]);
  panels.forEach(function(panel){body.appendChild(panel);});
 }
 drawer.classList.add("hspl-drawer");
 var titleStyle=document.createElement("style");
 titleStyle.id="hspl-filter-title-colours";
 titleStyle.textContent="body .t-Region.hspl-drawer > .t-Region-header .t-Region-title{background:#5b5bd6!important;color:#fff!important}body .t-Region.hspl-drawer > .t-Region-header .t-Region-titleButton,body .t-Region.hspl-drawer > .t-Region-header .t-Region-title:before,body .t-Region.hspl-drawer > .t-Region-header .t-Region-titleButton:before{color:#fff!important}body .t-Region.hspl-drawer > .t-Region-header .t-Region-titleButton:focus-visible{outline:2px solid #fff!important;outline-offset:3px}";
 document.head.appendChild(titleStyle);
 // The source theme suppresses the title on a few App 900 form IDs also used
 // by App 100 reports. Keep its Filters trigger reachable on those pages.
 function ensureTriggerVisible(){
  var trigger=document.querySelector(".hspl-filter-trigger");
  if(!trigger || trigger.getClientRects().length)return;
  var host=document.createElement("div");
  host.className="hspl-row";
  host.style.cssText="display:flex;justify-content:flex-end;margin:0 0 12px";
  drawer.parentNode.insertBefore(host,drawer);
  host.appendChild(trigger);
 }
 setTimeout(ensureTriggerVisible,0);
}
if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",adapt);
else adapt();
})();
