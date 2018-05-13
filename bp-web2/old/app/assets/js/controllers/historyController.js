define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

return minorityControllers.controller('HistoriesCtrl', ['$timeout','$http', 
  '$window', 
  '$translate',
  '$scope', 
  '$filter', 
  '$routeParams',
  '$rootScope',
  'ngDialog',
  'BPSessionStatesFactory',
  'LaunchReactionsFactory',
  'ProcPermissionsFactory',
  'TreeBuilder',
  'BPStationsFactory', 
  'SessionsFactory',
  'BProcessesFactory',
  'BProcessFactory', 
  'ObserversFactory', 
  'ObserverFactory', 
  'BProcessesFactory', 
  'BPElemsFactory',
  'BPSpacesFactory',
  'BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($timeout, $http, $window, $translate, $scope, $filter, $routeParams, $rootScope, ngDialog, BPSessionStatesFactory,LaunchReactionsFactory, ProcPermissionsFactory, TreeBuilder, BPStationsFactory, SessionsFactory, BProcessesFactory, BProcessFactory, ObserversFactory, ObserverFactory, BProcessesFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {

    console.log($scope);
    $scope.currentSession = $scope.history_session_id;
    $scope.currentEntity = $scope.history_entity;

    //if (ngDialogData != undefined) {
    //  $scope.data = ngDialogData.session_id;
    //}
    console.log($scope.history_session_id)


if ($scope.historyMode == "launch") {
      $scope.session_states = BPSessionStatesFactory.query({BPid: $scope.currentSession.process.id, id: $scope.currentSession.session.id });
      console.log($scope.session_states)
      // elements
      console.log($scope.currentEntity.process.logs.state_logs)
      // reaction
      LaunchReactionsFactory.query({launch_id: $scope.currentSession.session.id }).$promise.then(function(d) {
        $scope.reactionsEntity = d;
        $scope.reactions = _.map($scope.reactionsEntity, function(en) { return en.reaction });
        // Input logs
        $scope.input_logs = _.filter($scope.currentEntity.process.logs.input_logs, function(il) {
          return il.session == $scope.currentSession.session.id;
        });
        _.forEach($scope.input_logs, function(il) {
          il.react = _.find($scope.reactions, function(r){ return r.id == il.reaction});
          il.user = $scope.accFetchSessioned(il.uid);
        });
        console.log($scope.input_logs);
      });
}

if ($scope.historyMode == "process") {

}
}]);

});