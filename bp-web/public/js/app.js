
'use strict';


var translationsEN = {
  PERMISSIONS: 'Permissions',
  DELETE: 'Delete',
  ADD: 'Add',
  PEOPLE: 'People',
  SHARE: 'Share',
  STATIONS: 'Stations',
  ALL_SERVICES: 'All services',
  SERVICE: 'Service',
  NEW_PROCESS:'New process',
  PROCESS:'Process',
  TREE: 'Tree',
  EDIT: 'Edit',
  ADD_TO_SPACE: 'Add to space',
  UPDATE: 'Update',
  CREATE: 'Create',
  CONTAINER: 'Container',
  CONFIRM: 'Confirm',
  CANCEL: 'Cancel',
  TITLE: 'Title',
  DESC: 'Description',
  CONFDESC: 'Some confirm',
  CONTDESC: 'Some container',
  CONFDESCFULL: 'Conf description',
  CONTDESCFULL: 'Container description',
  RUNNED: 'Process arleady runned, if you edit that, all stations',
  WILL_BE_SHUTDOWN:'will be shut down' ,
  CREATE_OR_COPY: 'You can create',
  CREATE_OR_COPY2: 'of that process and continue editing.',
  COPY: 'copy',
  SEARCH_PROC: 'Search processes',
  CREATE_NEW_PROC: 'Create new Process',
  AFTER_PAYING: 'This features avaliable only after paying',
  OBSERVERS: 'OBSERVERS',
  EMBEDING: 'EMBEDING',
  OBSERV_DESC: 'Client access to your process stations',
  EMB_DESC: 'Embed your processes to your website',
  STARTED: 'Started',
  FINISHED: 'Finished',
  PAUSED: 'Paused',
  LOGS: 'Logs',
  ILOGS: 'Input Logs',
  RUN: 'Launch',
  RUN_SCRATCH: 'Run from scratch',
  RUN_FROM_DESC: 'Arleady runned and paused',
  TURN_DOWN: 'Turn down',
  RUN_FROM: 'Run from',
  RUN_FROM_ANOT: 'Run from specific active point',
  // Tables
  ELEMENT: 'Element',
  DATE: 'Date',
  STEP: 'Step',
  CV: 'Values',
  USER: 'User',
  ACTION: 'Action',
  ARGIMENTS: 'Arguments',
  INVOKED: 'Invoked'
};
 
var translationsRU= {
  PERMISSIONS: 'Права',
  DELETE: 'Delete',
  ADD: 'Add',
  PEOPLE: 'People',
  SHARE: 'Share',
  STATIONS: 'Stations',
  SERVICE: 'Service',
  ALL_SERVICES: 'All services',
  NEW_PROCESS:'New process',
  PROCESS:'Process',
  TREE: 'Tree',
  EDIT: 'Edit',
  ADD_TO_SPACE: 'Add to space',
  UPDATE: 'Update',
  CREATE: 'Create',
  CONTAINER: 'Container',
  CONFIRM: 'Confirm',
  CANCEL: 'Cancel',
  TITLE: 'Title',
  DESC: 'Description',
  CONFDESC: 'Some confirm',
  CONTDESC: 'Some container',
  CONFDESCFULL: 'Conf description',
  CONTDESCFULL: 'Container description',
  RUNNED: 'Process arleady runned, if you edit that, all stations',
  WILL_BE_SHUTDOWN:'will be shut down.' ,
  CREATE_OR_COPY: 'You can create',
  CREATE_OR_COPY2: 'of that process and continue editing.',
  COPY: 'copy',
  SEARCH_PROC: 'Search processes',
  CREATE_NEW_PROC: '',
  AFTER_PAYING: 'This features avaliable only after paying',
  OBSERVERS: 'OBSERVERS',
  EMBEDING: 'EMBEDING',
  OBSERV_DESC: 'Client access to your process stations',
  EMB_DESC: 'Embed your processes to your website',
  STARTED: 'Started',
  FINISHED: 'Finished',
  PAUSED: 'Paused',
  LOGS: 'Logs',
  ILOGS: 'Input Logs',
  RUN: 'Launch',
  RUN_SCRATCH: 'Run from scratch',
  RUN_FROM_DESC: 'Arleady runned and paused',
  TURN_DOWN: 'Turn down',
  RUN_FROM: 'Run from',
  RUN_FROM_ANOT: 'Run from specific active point',
  // Tables
  ELEMENT: 'Element',
  DATE: 'Date',
  STEP: 'Step',
  CV: 'Values',
  USER: 'User',
  ACTION: 'Action',
  ARGIMENTS: 'Arguments',
  INVOKED: 'Invoked'
};




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
      'ngAnimate',
      'toaster',
      'angular-underscore',
      'ui.bootstrap',
      'ui.select',
      'ui.sortable',
      'ngDialog',
      'angularMoment',
      'ui.tree',
      'pascalprecht.translate'
    ]
  );
minorityApp.filter('slice', function() {
  return function(arr, start, end) {
    return arr.slice(arr.length-start, end);
  };
});
minorityApp.config(['$translateProvider', function ($translateProvider) {
  // add translation tables
  $translateProvider.translations('en', translationsEN);
  $translateProvider.translations('ru', translationsRU);
  //$translateProvider.useLocalStorage();
  $translateProvider.preferredLanguage('en');
  
  $translateProvider.fallbackLanguage('en');
}]);
minorityApp.directive('loading', ['$http' , function ($http) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            var oldNgClick = attrs.ngClick;
            scope.isLoading = function () {
                return $http.pendingRequests.length > 0;
            };
 
            scope.$watch(scope.isLoading, function (value) {
                if (value) {
                    element.attr("disabled", "disabled");
                    $(element).click(function (event) {
                        event.preventDefault();
                    });
 
                } else {
 
                    if (oldNgClick) {
                        attrs.$set('ngClick', oldNgClick);
                        element.bind('click', function () {
                            scope.$apply(attrs.ngClick);
                        });
                    } else {
                        $(element).unbind('click');
                    }
                    element.removeAttr("disabled");
 
                }
            });
        }
    };
 
}]);
minorityApp.config(['$routeProvider','$httpProvider', function($routeProvider) {
/*Credentials managment*/
     $routeProvider.when('/profile', {templateUrl: 'partials/forms/profile.html', controller: 'ProfileController'});
    // BProcess
/*I*/$routeProvider.when('/bprocesses', {templateUrl: 'partials/forms/bprocesses/bp-list.html', controller: 'BProcessListCtrl'});
/*C*/$routeProvider.when('/bprocess/new', {templateUrl: 'partials/forms/bprocesses/bp-new.html', controller: 'BPCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:id/show', {templateUrl: 'partials/forms/bprocesses/bp-detail.html', controller: 'BProcessDetailCtrl'});
/*a*/
    // Embed
/*I*/$routeProvider.when('/bprocess/:BPid/embed', {templateUrl: 'partials/forms/bp_elements/embeded.html', controller: 'BPEmbededCtrl'});
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

   // Permissions
/*I*/$routeProvider.when('/bprocess/:BPid/perms', {templateUrl: 'partials/forms/perms/perm-list.html', controller: 'BPPermListCtrl'});
/*C*/$routeProvider.when('/bprocess/:BPid/perm/new', {templateUrl: 'partials/forms/perms/perm-new.html', controller: 'BPPermCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/perm/:id/show', {templateUrl: 'partials/forms/perms/perm-detail.html', controller: 'BPPermDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/perm/:id/edit', {templateUrl: 'partials/forms/perms/perm-edit.html', controller: 'BPPermDetailCtrl'});
     // Inputs
/*C*/$routeProvider.when('/bprocess/:BPid/input', {templateUrl: 'partials/forms/inputs/inputs.html', controller: 'BPRequestCtrl'});

     $routeProvider.otherwise({redirectTo: '/bprocesses'});



}]).run(['$window', '$rootScope', '$injector', function($window, $rootScope,$injector) {
    var token = $window.sessionStorage.getItem('token');
    $injector.get("$http").defaults.transformRequest = function(data, headersGetter) {
        //if ($rootScope.oauth)
        headersGetter()['X-Auth-Token'] = $window.sessionStorage.getItem('token');
        if (data) {
            return angular.toJson(data);
        }
    };
}]);




/* Filters

angular.module('myApp.filters', []).
  filter('interpolate', ['version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    }
  }]);
*/
