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
  .controller('BPCreationCtrl', [function () {

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
    'ui.select'
  ]
);

/*
 * Profile
 */
minorityControllers.controller('ProfileController', ['$scope', '$http', '$window', '$location', 'toaster', 
  function ($rootScope, $scope, $http, $window, $location, toaster) {

    
    $scope.retrive = function(user) {
        var token = "b8b656520e1f0314b3536f92ebcdd41ea5654ecb4467a56709d8e9337dd152c4ddf5470f6c130a78db7ceb5a90e8fbb96bd4da9df938443727d424b9eb56ac5b107647d3dd9c7c801ce22685294065acdaf6ca0706b05cfbdc475cc6ce48de4ced6ab1115a2d54bf7b551d13b1592b10b0b196f7e34063dc13d668b88eeac19c"//$window.localStorage.getItem('token')
      if (token) {
        console.log(token);//$http.defaults.headers.common['X-Auth-Token'] = token;
        //$http.defaults.headers.common['Access_Name'] = 'John'; 
 
        $http.post(jsRoutes.controllers.Application.index().absoluteURL() + 'whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'John'}})
          .success(function (profile) {
              // Stores the token until the user closes the browser window.
              console.log(profile);
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

minorityControllers.controller('UserInfoCtrl', function ($rootScope, $scope, $http, $window, $location) {
  $scope.isLogged = true;
  $scope.user = {};

  $scope.retrive = function(user) {
        var token = $window.sessionStorage.getItem('token')
      if (token) {
        $http.defaults.headers.common['X-Auth-Token'] = token;
        $http.defaults.headers.common['Access_Name'] = 'John'; 
 
        $http.post(jsRoutes.controllers.Application.index().absoluteURL() + 'whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'John'}})
          .success(function (profile) {
              // Stores the token until the user closes the browser window.
              console.log(profile);
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





// INDEX
minorityControllers.controller('BProcessListCtrl', ['$scope', '$http', '$filter', 'BProcessesFactory','BProcessFactory', 'BPStationsFactory', 'BPServicesFactory', '$location', 
  function ($scope, $http, $filter, BProcessesFactory, BProcessFactory, BPStationsFactory, BPServicesFactory, $location) {

  /* callback for ng-click 'editUser': */
  $scope.editBP = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showBP = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteBP = function (bpId) {
    BProcessFactory.delete({ id: bpId });
    $scope.bprocesses = BProcessesFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewBP = function () {
    $location.path('/bprocess/new');
  };
  $scope.services = BPServicesFactory.query();
  $scope.bprocesses = BProcessesFactory.query();
  $scope.stations = BPStationsFactory.query();

  $scope.bpElemLength = $http.get(jsRoutes.controllers.Application.index().absoluteURL() + 'bprocess/elems_length')
          .success(function (data) {
              // Stores the token until the user closes the browser window.
              console.log(data);
              $scope.bpElemLength = data;
          })
          .error(function () {
          });

  $scope.stationPercent = function(station) {
    console.log(station.process)
    var found = $filter('filter')($scope.bpElemLength, {id: station.process});
                 
    if (found.length) {
      console.log(found)
             return found[0];
         } else {
             100;
         }
  }

  $scope.filterService = function(service_id) {
         var found = $filter('filter')($scope.services, {id: service_id}, true);
         if (found.length) {
             return found[0].title;
         } else {
             '';
         }
     }
}]);


// READ



minorityControllers.controller('BProcessDetailCtrl', ['$scope', '$routeParams', 'BPServicesFactory', 'BProcessFactory', '$location', '$http',
function ($scope, $routeParams, BPServicesFactory, BProcessFactory, $location, $http) {


  $scope.updateBP = function () {
    BProcessFactory.update($scope.bprocess);
    $location.path('/bprocesses');
  };
  $scope.cancel = function () {
    $location.path('/bprocesses');
  };
  $scope.input = function (bpId) {
    $location.path('/bprocess/' + bPid + '/input')
  }
  $scope.invokeBP = function (bpId) {

      $http({
      url: 'process/' + bpId + '/invoke',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
      }, 
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.invoke_res = [];
  $scope.bpId = $routeParams.id;
  $scope.selectedTab = 1;
  $scope.procServices = BPServicesFactory.query();
  $scope.bprocess = BProcessFactory.show({id: $routeParams.id});
}]);





// CREATE
minorityControllers.controller('BPCreationCtrl', ['$scope', '$http', 'BProcessesFactory', 'BPServicesFactory', '$location',
  function ($scope, $http,  BProcessesFactory, BPServicesFactory, $location) {



    $scope.procServices = BPServicesFactory.query();


    $scope.createNewBP = function () {
      BProcessesFactory.create($scope.bprocess);
      $location.path('/bprocesses');
    }
}]);



