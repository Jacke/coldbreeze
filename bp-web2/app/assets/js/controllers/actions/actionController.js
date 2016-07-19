define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

// INDEX
return minorityControllers.controller('actionController', ['$q','$rootScope',
  '$scope',
  '$window',
  '$translate',
  '$rootScope',
  'Upload',
  'CacheFactory',
  'AllBPLogsFactory',
  'AllLaunchedElementsBulkFactory',
  'AllElementsBulkFactory',
  'InteractionsBulkFactory',
  'BPElemsFactory',
  'RefsFactory',
  'TreeBuilder',
  'NotificationBroadcaster',
  'SessionsFactory',
  'ngDialog',
  '$http',
  '$routeParams',
  '$filter',
  'BPElemsFactory',
  'BPSpacesFactory',
  'DataCostAssign',
  'DataCostElementLaunchAssign',
  'BPSpaceElemsFactory',
  'BProcessesFactory',
  'BProcessFactory',
  'BPStationsFactory',
  'BPServicesFactory',
  'DataCostLaunchAssign',
  'DataCostCollection',
  'LaunchElementTopologsFactory',
  '$location',
  function ($q, $rootScope,
    $scope, $window,
    $translate, $rootScope,Upload,
    CacheFactory,AllBPLogsFactory,
    AllLaunchedElementsBulkFactory, AllElementsBulkFactory,
    InteractionsBulkFactory, BPElemsFactory,
    RefsFactory, TreeBuilder,
    NotificationBroadcaster,SessionsFactory,
    ngDialog, $http,
    $routeParams, $filter,
    BPElemsFactory, BPSpacesFactory,DataCostAssign,DataCostElementLaunchAssign,
    BPSpaceElemsFactory, BProcessesFactory, BProcessFactory, BPStationsFactory, BPServicesFactory, DataCostLaunchAssign, DataCostCollection, LaunchElementTopologsFactory,
    $location) {

      console.log('actionController');


}]);

});
