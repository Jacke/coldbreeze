
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
