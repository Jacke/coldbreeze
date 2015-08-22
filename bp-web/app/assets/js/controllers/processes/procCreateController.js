
// CREATE
define(['angular', 'app', 'angularanimate', 'controllers'], function (angular, minorityApp, angularanimate, minorityControllers) {

minorityControllers.controller('BPCreationCtrl', ['$window', '$rootScope','$scope', '$http','$routeParams', 'TreeBuilder', 'BProcessesFactory', 'BPServicesFactory', '$location',
  function ($window, $rootScope, $scope, $http,$routeParams,  TreeBuilder, BProcessesFactory, BPServicesFactory, $location) {

    if ($routeParams.service != undefined) {
      $scope.bprocess = { service: parseInt($routeParams.service) };
    }

    $scope.procServices = BPServicesFactory.query();
    
    if ($window.sessionStorage.getItem('business') != undefined) {
      $scope.business = parseInt($window.sessionStorage.getItem('business'));
    } 
    else {
      $scope.business = $rootScope.business;
    }
    $scope.close = function(){
      $scope.closeThisDialog();
    }


    $scope.createNewBP = function () {
      BProcessesFactory.create($scope.bprocess).$promise.then(function(data) {
          $scope.bprocesses = BProcessesFactory.query();
          $routeParams.service = undefined;
          $scope.closeThisDialog();
          $scope.$parent.bprocesses = BProcessesFactory.query();
          $scope.$parent.bprocesses.$promise.then(function (processes) {
              _.forEach(processes, function(proc) { TreeBuilder.buildFetch(proc, function(success){}); })
          });
           //$location.path('/bprocesses');
    });
    }




}]);

});