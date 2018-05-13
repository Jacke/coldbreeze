'use strict';

define(['angular', 'app', 'angularanimate', 'jsRoutes', 'services'], function (angular, minorityApp, angularanimate, jsRoutes, minorityAppServices) {


var baseUrl = jsRoutes.controllers.ProfileController.dashboard().absoluteURL(document.ssl_enabled);


// Add resource
// Add attribute
// Fetch resources
// Assign resource to current element
// Fetch assigned costs
// Show cost

minorityAppServices.factory('fastResourceCostCreation', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/element_topos', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);

});