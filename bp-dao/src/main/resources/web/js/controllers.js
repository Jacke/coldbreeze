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

  }]);
  

var minorityControllers =
angular.module(
  'minorityApp.controllers',
  [
    'minorityApp.services'
  ]
);

/**
 * Auth
 */
minorityControllers.controller('UserController', ['$scope', '$http', '$window', '$location', 'toaster', '$rootScope',
  function ($scope, $http, $window, $location, toaster, $rootScope) {
    $scope.signin = function(user) {
      console.log(user)
      $http.post('http://127.0.0.1:8080/auth', user)
        .success(function (data) {
            toaster.pop('success', "title", "text");
            $scope.$broadcast('show error', 'settingsPage', 'INVALID_DATE'); // to show error msg
            $rootScope.$emit("isLogged", {profile: data});

            $window.sessionStorage.setItem('token', data.token);
            $location.path('/');
        })
        .error(function () {
            $window.sessionStorage.removeItem('token');
            toaster.pop('error', "title", '<ul><li>Username or password invalid.</li></ul>', null, 'trustedHtml');
        });
    };
}]);
/*
 * Reg
 */ 
minorityControllers.controller('RegController', ['$scope', '$http', '$window', '$location', 'toaster', 
  function ($scope, $http, $window, $location, toaster) {
 
    $scope.reg = function(user) {
      $http.post('http://127.0.0.1:8080/register', user)
        .success(function (data) {
            // Stores the token until the user closes the browser window.
            console.log(data);
            $location.path('/auth');
        })
        .error(function () {
            toaster.pop('error', "title", '<ul><li>Error. Please try later.</li></ul>', null, 'trustedHtml');
        });
    };
}]);
/*
 * Profile
 */
minorityControllers.controller('ProfileController', ['$scope', '$http', '$window', '$location', 'toaster', 
  function ($rootScope, $scope, $http, $window, $location, toaster) {

    
    $scope.retrive = function(user) {
        var token = $window.sessionStorage.getItem('token')
      if (token) {
        $http.defaults.headers.common['Access_Token'] = token;
        $http.defaults.headers.common['Access_Name'] = 'John'; 
 
        $http.post('http://127.0.0.1:8080/whoami', {headers:  {'Access_Token': token, 'Access_Name': 'John'}})
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

    $scope.retrive();
}]);

minorityControllers.controller('UserInfoCtrl', function ($rootScope, $scope, $http, $window, $location) {
  $scope.isLogged = false;
  $scope.user = {};

  $scope.retrive = function(user) {
        var token = $window.sessionStorage.getItem('token')
      if (token) {
        $http.defaults.headers.common['Access_Token'] = token;
        $http.defaults.headers.common['Access_Name'] = 'John'; 
 
        $http.post('http://127.0.0.1:8080/whoami', {headers:  {'Access_Token': token, 'Access_Name': 'John'}})
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
minorityControllers.controller('BProcessListCtrl', ['$scope', 'BProcessesFactory','BProcessFactory', '$location', function ($scope, BProcessesFactory, BProcessFactory, $location) {

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
 
  $scope.bprocesses = BProcessesFactory.query();
}]);


// READ
minorityControllers.controller('BProcessDetailCtrl', ['$scope', '$routeParams', 'BProcessFactory', '$location', '$http',
function ($scope, $routeParams, BProcessFactory, $location, $http) {


  $scope.updateBP = function () {
    BProcessFactory.update($scope.bprocess);
    $location.path('/bprocesses');
  };
  $scope.cancel = function () {
    $location.path('/bprocesses');
  };
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
  $scope.bprocess = BProcessFactory.show({id: $routeParams.id});
}]);


// CREATE
minorityControllers.controller('BPCreationCtrl', ['$scope', 'BProcessesFactory', '$location',
  function ($scope, BProcessesFactory, $location) {
    $scope.createNewBP = function () {
      BProcessesFactory.create($scope.bprocess);
      $location.path('/bprocesses');
    }
}]);




/**
 * BP Elements
 */
// INDEX
minorityControllers.controller('BPelementListCtrl', ['$scope', 'BPElemsFactory','BPElemFactory', '$location', '$route', 
  function ($scope, BPElemsFactory, BPElemFactory, $location, $route) {

  /* callback for ng-click 'editUser': */
  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteElem = function (bpId) {
    BPElemFactory.delete({ id: bpId });
    $scope.bprocesses = BPElemsFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };
 
  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
}]);












/**
 * BP Station
 */
// INDEX
minorityControllers.controller('BPstationListCtrl', ['$scope', 'BPStationsFactory','BPStationFactory', '$location', '$route',
  function ($scope, BPStationsFactory, BPStationFactory, $location, $route) {

  /* callback for ng-click 'editUser': */
  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteElem = function (bpId) {
    BPStationFactory.delete({ id: bpId });
    $scope.bpstations = BPStationsFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };
  $scope.bpstations = BPStationsFactory.query({ BPid: $route.current.params.BPid });
}]);

/**
 * BP Log
 */
// INDEX
minorityControllers.controller('BPloggerListCtrl', ['$scope', 'BPLogsFactory','BPLogFactory', 'BPLogStationFactory', '$location', '$route',
  function ($scope, BPLogsFactory, BPLogFactory, BPLogStationFactory, $location, $route) {

  /* callback for ng-click 'editUser': */
  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteElem = function (bpId) {
    BPLogFactory.delete({ id: bpId });
    $scope.bplogs = BPLogsFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };
 
  $scope.bplogs = BPLogsFactory.query({ BPid: $route.current.params.BPid });
}]);



/*
minorityControllers.controller('BProcessListCtrl', ['$scope', 'BProcess', function($scope, Process){
  // Find Processes
  $scope.findProcceses = function () {
    $scope.processes = [];
    var processes = BProcess.query(function() {
      $scope.processes = processes.concat($scope.processes);
    });
  }
  
}]);
*/
/**
minorityControllers.controller('ProcessCtrl', ['$scope', 'Message', function($scope, Message) {

//$scope.messages = [{'username': "lol", "text":"textss", "value": false, "type": "Block"}, $scope.mess];
//$scope.messages = []
$scope.getMessages = function() {
   $scope.messages = []
   var messages = Message.query(function() {
    $scope.messages = messages.concat($scope.messages);
  });

  console.log(messages);
};

**/