'use strict';

/* Controllers */
  /*.run(function ($rootScope, $templateCache) {
  $rootScope.$on('$viewContentLoaded', function () {
    $templateCache.removeAll();
  });
});*/
angular.module('minorityApp.controllers', []).
  controller('BProcessListCtrl', [function () {

  }])
  .controller('UserController', [function () {

  }])
  .controller('BProcessDetailCtrl', [function () {

  }])
  .controller('BPEmbededCtrl', [function () {

  }])
  .controller('ProcShareCtrl', [function () {
    
  }])
  .controller('BPCreationCtrl', [function () {

  }])
  .controller('BPPermListCtrl', [function () {

  }])
  .controller('BPRequestCtrl', [function () {

  }]);

minorityApp.filter('propsFilter', function() {
  return function(items, props) {
    var out = [];

    if (angular.isArray(items)) {
      items.forEach(function(item) {
        var itemMatches = false;

        var keys = Object.keys(props);
        for (var i = 0; i < keys.length; i++) {
          var prop = keys[i];
          var text = props[prop].toLowerCase();
          if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
            itemMatches = true;
            break;
          }
        }

        if (itemMatches) {
          out.push(item);
        }
      });
    } else {
      // Let the output be the input untouched
      out = items;
    }

    return out;
  }
});

var minorityControllers =
angular.module(
  'minorityApp.controllers',
  [
    'minorityApp.services',
    'angular-underscore',
    'ui.select',
    'ngDialog', 
    'toaster'
  ]
);

/*
 * Profile
 *//*
minorityControllers.controller('ProfileController', ['$rootScope', '$scope', '$http', '$window', '$location', 'toaster',
  function ($rootScope, $scope, $http, $window, $location, toaster) {


    $scope.retrive = function(user) {
        var token = ""//$window.localStorage.getItem('token')
      if (token) {
        console.log(token);//$http.defaults.headers.common['X-Auth-Token'] = token;
        //$http.defaults.headers.common['Access_Name'] = 'user';

        $http.post(jsRoutes.controllers.ProfileController.profile().absoluteURL(document.ssl_enabled) + 'whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'user'}})
          .success(function (profile) {
              // Stores the token until the user closes the browser window.
              console.log(profile);
              $rootScope.manager = profile.manager;
              $scope.profile = profile;

          })
          .error(function () {
          });
      }
      else {
        toaster.pop('error', "title", '<ul><li>Forbidden</li></ul>', null, 'trustedHtml');
      };
    }

    //$scope.retrive();
}]);
*/
minorityControllers.controller('UserInfoCtrl', function ($rootScope, $translate, $scope, $http, $window, $location) {
  $scope.isLogged = true;
  $scope.user = {};

  $scope.retrive = function(user) {
        var token = $window.sessionStorage.getItem('token');
      if (token) {
        $http.defaults.headers.common['X-Auth-Token'] = token;
        $http.defaults.headers.common['Access_Name'] = 'user';

        $http.post(jsRoutes.controllers.ProfileController.profile().absoluteURL(document.ssl_enabled) + 'whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'user'}})
          .success(function (profile) {
              // Stores the token until the user closes the browser window.
              console.log(profile);
              $rootScope.manager = profile.manager;
              $window.sessionStorage.setItem('manager', profile.manager);

              $rootScope.employee = profile.employee;
              $rootScope.payed = profile.payed;
              $window.sessionStorage.setItem('business', profile.business);
              if (!$window.sessionStorage.getItem('lang')) {
                $window.sessionStorage.setItem('lang', profile.lang);

              }
              $translate.use(profile.lang);
              $rootScope.business = profile.business;
              $scope.user = profile;
              $scope.isLogged = true;
          })
          .error(function () {
          });
      };
      }

  $rootScope.$on("isLogged", function (event, args) {
     console.log(">>>>>>>>>>>>>>>>>");
     $scope.user = args.profile;
     $scope.isLogged = true;
  });
  $scope.logout = function() {
      $window.sessionStorage.removeItem('token');
      $scope.isLogged = false;
      $scope.user = {};
      $location.path('/');
  }

  $scope.retrive();
});




















