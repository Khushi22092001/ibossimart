/* Show server-denied reference navigation without leaving the current form. */
(function () {
  'use strict';
  if (!window.apex || !apex.server || !apex.server.process || apex.server.process.imartReferenceAccess) return;
  var original = apex.server.process;
  function guardedProcess(name, data, options) {
    if (name !== 'PREPARE_URL') return original.apply(this, arguments);
    var opts = Object.assign({}, options || {}), success = opts.success;
    opts.success = function (result) {
      if (result && result.accessDenied === true) {
        apex.message.showErrors([{type:'error',location:'page',message:result.message || 'You do not have View permission for the referenced module in this company.',unsafe:false}]);
        return;
      }
      if (typeof success === 'function') return success.apply(this, arguments);
    };
    return original.call(this, name, data, opts);
  }
  guardedProcess.imartReferenceAccess = true;
  apex.server.process = guardedProcess;
}());
