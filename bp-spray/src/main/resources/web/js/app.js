
'use strict';

var myApp =
  angular.module(
    'myApp',
    [
      'myApp.services',
      'myApp.controllers',
      'ngRoute'
    ]
  );
myApp.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/process', {templateUrl: 'partials/process.html', controller: 'ProcessCtrl'});
    $routeProvider.when('/user-list', {templateUrl: 'partials/user-list.html', controller: 'UserListCtrl'});
    $routeProvider.when('/user-detail/:id', {templateUrl: 'partials/user-detail.html', controller: 'UserDetailCtrl'});
    $routeProvider.when('/user-creation', {templateUrl: 'partials/user-creation.html', controller: 'UserCreationCtrl'});
    $routeProvider.otherwise({redirectTo: '/process'});
    
  
  }]);

// Declare app level module which depends on filters, and services
//angular.module('myApp', ['myApp.filters', 'myApp.services', 'myApp.directives', 'myApp.controllers']).
//  config(['$routeProvider', function($routeProvider) {
//    $routeProvider.when('/view1', {templateUrl: 'partials/partial1.html', controller: 'MyCtrl1'});
//    $routeProvider.when('/view2', {templateUrl: 'partials/partial2.html', controller: 'MyCtrl2'});
//    $routeProvider.otherwise({redirectTo: '/view1'});
//  }]);


/* Filters 

angular.module('myApp.filters', []).
  filter('interpolate', ['version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    }
  }]);
*/