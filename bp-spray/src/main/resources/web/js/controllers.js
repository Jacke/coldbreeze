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