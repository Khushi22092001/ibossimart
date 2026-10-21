// Test-only reference scope. Never used by deployment or application queries.
module.exports=function(sources){
 const p=sources.securityPredicate;
 if(!p||sources.base.split(p).length!==2)throw Error('Expected exactly one centralized reporting security predicate');
 return sources.base.replace(p,"e.company_code='1'");
};
