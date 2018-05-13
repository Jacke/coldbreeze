define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {


return minorityControllers.controller('BProcessDetailCtrl', ['$scope', '$routeParams', 'BPServicesFactory', 'BProcessFactory', '$location', '$http',
function ($scope, $routeParams, BPServicesFactory, BProcessFactory, $location, $http) {


  $scope.updateBP = function () {
    BProcessFactory.update($scope.process).$promise.then(function(){
      $scope.closeThisDialog();
      $location.path('/bprocesses');
    });
  };
  $scope.cancel = function () {
    $location.path('/bprocesses');
  };
  
  $scope.invoke_res = [];
  if ($scope.bpId == undefined) {
    $scope.bpId = $routeParams.id;
  }
  //$scope.selectedTab = 1;
  $scope.procServices = BPServicesFactory.query();
  //$scope.bprocess = BProcessFactory.show({id: $scope.bpId });
}]);

});
