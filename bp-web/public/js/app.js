
'use strict';

var minorityApp =
  angular.module(
    'minorityApp',
    [
      'minorityApp.services',
      'minorityApp.controllers',
      'ngRoute',
      'ngResource',
      'chieffancypants.loadingBar',
      'ngCookies',
      'angularLocalStorage',
      'classy',
      'ngAngularError',
      'ngAnimate', 'toaster',
      'angular-underscore',
      'ui.bootstrap'
    ]
  );

minorityApp.config(['$routeProvider', function($routeProvider) {
/*Credentials managment*/
     $routeProvider.when('/profile', {templateUrl: 'partials/forms/profile.html', controller: 'ProfileController'});
    // BProcess
/*I*/$routeProvider.when('/bprocesses', {templateUrl: 'partials/forms/bprocesses/bp-list.html', controller: 'BProcessListCtrl'});
/*C*/$routeProvider.when('/bprocess/new', {templateUrl: 'partials/forms/bprocesses/bp-new.html', controller: 'BPCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:id/show', {templateUrl: 'partials/forms/bprocesses/bp-detail.html', controller: 'BProcessDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:id/edit', {templateUrl: 'partials/forms/bprocesses/bp-edit.html', controller: 'BProcessDetailCtrl'});
/*a*/

    // Proc Elements
/*I*/$routeProvider.when('/bprocess/:BPid/elements', {templateUrl: 'partials/forms/bp_elements/bpelem-list.html', controller: 'BPelementListCtrl'});
/*C*/$routeProvider.when('/bprocess/:BPid/element/new', {templateUrl: 'partials/forms/bp_elements/bpelem-new.html', controller: 'BPelementCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/element/:id/show', {templateUrl: 'partials/forms/bp_elements/bpelem-detail.html', controller: 'BPelementDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/element/:id/edit', {templateUrl: 'partials/forms/bp_elements/bpelem-edit.html', controller: 'BPelementDetailCtrl'});
   
    // Stations
/*I*/$routeProvider.when('/bprocess/:BPid/stations', {templateUrl: 'partials/forms/bpstations/bpstation-list.html', controller: 'BPstationListCtrl'});
/*C*/$routeProvider.when('/bprocess/:BPid/station/new', {templateUrl: 'partials/forms/bpstations/bpstation-new.html', controller: 'BPstationCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/station/:id/show', {templateUrl: 'partials/forms/bpstations/bpstation-detail.html', controller: 'BPstationDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/station/:id/edit', {templateUrl: 'partials/forms/bpstations/bpstation-edit.html', controller: 'BPstationDetailCtrl'});    
    
    // Loggers
/*I*/$routeProvider.when('/bprocess/:BPid/logs', {templateUrl: 'partials/forms/bploggers/logger-list.html', controller: 'BPloggerListCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/log/:id/show', {templateUrl: 'partials/forms/bploggers/logger-detail.html', controller: 'BPloggerDetailCtrl'});
/*C  $routeProvider.when('/bprocess/:BPid/log/new', {templateUrl: 'partials/bp_elements/bp-new.html', controller: 'BPCreationCtrl'}); */
/*U$routeProvider.when('/bprocess/:BPid/log/:id/edit', {templateUrl: 'partials/bp_elements/bp-edit.html', controller: 'BProcessDetailCtrl'});*/
     
     // Inputs
/*C*/$routeProvider.when('/bprocess/:BPid/input', {templateUrl: 'partials/forms/inputs/inputs.html', controller: 'BPRequestCtrl'}); 
    
     $routeProvider.otherwise({redirectTo: '/bprocesses'});
    
  
  }]);


/* Filters 

angular.module('myApp.filters', []).
  filter('interpolate', ['version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    }
  }]);
*/