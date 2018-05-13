var jsRoutes = {}; (function(_root){
var _nS = function(c,f,b){var e=c.split(f||"."),g=b||_root,d,a;for(d=0,a=e.length;d<a;d++){g=g[e[d]]=g[e[d]]||{}}return g}
var _qS = function(items){var qs = ''; for(var i=0;i<items.length;i++) {if(items[i]) qs += (qs ? '&' : '') + items[i]}; return qs ? ('?' + qs) : ''}
var _s = function(p,s){return p+((s===true||(s&&s.secure))?'s':'')+'://'}
var _wA = function(r){return {ajax:function(c){c=c||{};c.url=r.url;c.type=r.method;return jQuery.ajax(c)}, method:r.method,type:r.method,url:r.url,absoluteURL: function(s){return _s('http',s)+'127.0.0.1:9000'+r.url},webSocketURL: function(s){return _s('ws',s)+'127.0.0.1:9000'+r.url}}}
_nS('controllers.CustomLoginController'); _root.controllers.CustomLoginController.login = 
      function() {
      return _wA({method:"GET", url:"/" + "auth/login"})
      }
   
_nS('controllers.BusinessProcessController'); _root.controllers.BusinessProcessController.frontElems = 
      function(id) {
      return _wA({method:"GET", url:"/" + "bprocess/" + (function(k,v) {return v})("id", id) + "/elements"})
      }
   
_nS('controllers.BusinessProcessController'); _root.controllers.BusinessProcessController.spaces = 
      function(id) {
      return _wA({method:"GET", url:"/" + "bprocess/" + (function(k,v) {return v})("id", id) + "/spaces"})
      }
   
_nS('controllers.BusinessProcessController'); _root.controllers.BusinessProcessController.copy = 
      function(bpId,title) {
      return _wA({method:"POST", url:"/" + "bprocess/" + (function(k,v) {return v})("bpId", bpId) + "/copy/" + (function(k,v) {return v})("title", encodeURIComponent(title))})
      }
   
_nS('controllers.users.EmployeeController'); _root.controllers.users.EmployeeController.create_new = 
      function() {
      return _wA({method:"POST", url:"/" + "people/create"})
      }
   
_nS('controllers.GroupController'); _root.controllers.GroupController.create_new = 
      function() {
      return _wA({method:"POST", url:"/" + "group/create"})
      }
   
_nS('controllers.GroupController'); _root.controllers.GroupController.destroy = 
      function(id) {
      return _wA({method:"DELETE", url:"/" + "group/destroy/" + (function(k,v) {return v})("id", id)})
      }
   
_nS('controllers.GroupController'); _root.controllers.GroupController.assign_user = 
      function(account_id,group_id) {
      return _wA({method:"POST", url:"/" + "group/assign_user/" + (function(k,v) {return v})("group_id", group_id) + "/" + (function(k,v) {return v})("account_id", encodeURIComponent(account_id))})
      }
   
_nS('controllers.GroupController'); _root.controllers.GroupController.unassign_user = 
      function(account_id,group_id) {
      return _wA({method:"POST", url:"/" + "group/unassign_user/" + (function(k,v) {return v})("group_id", group_id) + "/" + (function(k,v) {return v})("account_id", encodeURIComponent(account_id))})
      }
   
_nS('controllers.Application'); _root.controllers.Application.index = 
      function() {
      return _wA({method:"GET", url:"/" + "test"})
      }
   
_nS('controllers.Application'); _root.controllers.Application.whoami = 
      function() {
      return _wA({method:"POST", url:"/" + "whoami"})
      }
   
_nS('controllers.Application'); _root.controllers.Application.proPage = 
      function() {
      return _wA({method:"GET", url:"/" + "pro"})
      }
   
_nS('controllers.Application'); _root.controllers.Application.subscribePro = 
      function() {
      return _wA({method:"POST", url:"/" + "pro/subscribe"})
      }
   
_nS('controllers.Application'); _root.controllers.Application.subscribeEa = 
      function() {
      return _wA({method:"POST", url:"/" + "ea/subscribe"})
      }
   
_nS('controllers.ProfileController'); _root.controllers.ProfileController.dashboard = 
      function() {
      return _wA({method:"GET", url:"/"})
      }
   
_nS('controllers.ProfileController'); _root.controllers.ProfileController.profile = 
      function(profile_id) {
      return _wA({method:"GET", url:"/" + (function(k,v) {return v})("profile_id", encodeURIComponent(profile_id))})
      }
   
_nS('controllers.ProcessSessionController'); _root.controllers.ProcessSessionController.update_note = 
      function(id,station_id) {
      return _wA({method:"POST", url:"/" + "bprocess/" + (function(k,v) {return v})("id", id) + "/station/" + (function(k,v) {return v})("station_id", station_id) + "/note"})
      }
   
_nS('controllers.ProcessInputController'); _root.controllers.ProcessInputController.invokeFrom = 
      function(station_id,bpID) {
      return _wA({method:"POST", url:"/" + "bprocess/" + (function(k,v) {return v})("bpID", bpID) + "/invoke_from/" + (function(k,v) {return v})("station_id", station_id)})
      }
   
_nS('controllers.APIController'); _root.controllers.APIController.v1 = 
      function() {
      return _wA({method:"GET", url:"/" + "v1"})
      }
   
_nS('controllers.CostFillController'); _root.controllers.CostFillController.assign_element = 
      function(resource_id) {
      return _wA({method:"POST", url:"/" + "data/cost/assign/" + (function(k,v) {return v})("resource_id", resource_id)})
      }
   
_nS('controllers.CostFillController'); _root.controllers.CostFillController.update_assigned_element = 
      function(resource_id) {
      return _wA({method:"POST", url:"/" + "data/cost/up_assign/" + (function(k,v) {return v})("resource_id", resource_id)})
      }
   
_nS('controllers.CostFillController'); _root.controllers.CostFillController.delete_assigned_element = 
      function(resource_id) {
      return _wA({method:"POST", url:"/" + "data/cost/del_assign/" + (function(k,v) {return v})("resource_id", resource_id)})
      }
   
_nS('controllers.DataController'); _root.controllers.DataController.refill_slat = 
      function(entityId,launchId,resourceId,slatId) {
      return _wA({method:"POST", url:"/" + "data/refill/ent/" + (function(k,v) {return v})("entityId", encodeURIComponent(entityId)) + "/" + (function(k,v) {return v})("launchId", launchId) + "/" + (function(k,v) {return v})("resourceId", resourceId) + "/" + (function(k,v) {return v})("slatId", encodeURIComponent(slatId))})
      }
   
_nS('controllers.DataController'); _root.controllers.DataController.fill_slat = 
      function(entityId,launchId,resourceId) {
      return _wA({method:"POST", url:"/" + "data/fill/ent/" + (function(k,v) {return v})("entityId", encodeURIComponent(entityId)) + "/" + (function(k,v) {return v})("launchId", launchId) + "/" + (function(k,v) {return v})("resourceId", resourceId)})
      }
   
_nS('controllers.DataController'); _root.controllers.DataController.api_create_resource = 
      function() {
      return _wA({method:"POST", url:"/" + "api/v1/data/resources"})
      }
   
})(jsRoutes)
          