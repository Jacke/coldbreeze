// For all processes
minorityControllers.controller('SessionsCtrl', ['$http', 
  '$window', 
  '$scope', 
  '$filter', 
  '$rootScope',
  'BPStationsFactory', 
  'SessionsFactory',
  'BProcessesFactory',
  'BProcessFactory', 
  'ObserversFactory', 
  'ObserverFactory', 
  'BProcessesFactory', 
  'BPInLoggersStationFactory',
  'BPInLoggersFactory',
  'BPElemsFactory',
  'BPSpacesFactory',
  'BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($http, $window, $scope, $filter, $rootScope,BPStationsFactory, SessionsFactory, BProcessesFactory, BProcessFactory, ObserversFactory, ObserverFactory, BProcessesFactory, BPInLoggersStationFactory,BPInLoggersFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {


/*
$scope.processes.$promise.then(function(data) {
  $scope.processes = data;
  _.forEach($scope.processes, function(d) { d.sessions = []; return d.stations = BPStationsFactory.query({ BPid: d.id }); });
  $scope.sessions.$promise.then(function (data2) {
      _.forEach($scope.processes, function(d) { return d.sessions = _.filter(data2, function(dd) { return dd.process == d.id }) });

      var stations = _.map($scope.processes, function(proc) { 
              return proc.stations 
            });

      _.forEach(stations, function(stan) { 
        stan.$promise.then(function(ds) {
      _.forEach(data2, function(sess) { return sess.station = _.find(ds, function(st) { 
        console.log(st); return st.session == sess.id }); 
      }) 
      })
      });

      });

});
*/

$scope.sessions = SessionsFactory.query();
$scope.sessions.$promise.then(function (data2) {
    _.forEach(data2.sessions, function(session) { return session.session.station = session.station });
    _.forEach(data2, function(d){ return TreeBuilder.buildFetch(d.process, function(success){}); });
    console.log(data2);
});





$scope.isManager = function () {
  if ($scope.isManagerVal == undefined && $rootScope.manager != undefined) {
    $scope.isManagerVal = $rootScope.manager;
    return $scope.isManagerVal;
  } else {
    return $window.localStorage.manager == "true";
  }
};

$scope.isManagerVal = $scope.isManager();
$scope.isManager();

  /* callback for ng-click 'editUser': */


  $scope.highlightActive = function (station, elem) {
     var front, nest;
     front = $scope.elemsHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].element];  
     nest = $scope.spaceElemHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].space_elem];  
     if (front != undefined && front.id == elem.id && station.finished == false) {
       return "active";
     } 
     if (nest != undefined && nest.id == elem.id && elem.space_owned != undefined && station.finished == false) {
      return "active";
     } else {
     return "passive"
     }
  }

  $scope.logs = BPLogsFactory.query({  BPid: $route.current.params.BPid });
  $scope.bprocesses = BProcessesFactory.query();
  $scope.stationByProcess = function (processId) {
        var found = $filter('filter')($scope.bprocesses, {id: processId}, true);
         if (found.length) {
             console.log(found)
             return found[0];
         } else {
             '1';
         }
  }
  $scope.haltStation = function (stationId) {
  var bpId = $route.current.params.BPid ;
    $http({
      url: '/bprocess/' + bpId + '/station/' + stationId + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        $scope.stationsRefresh();
        //$scope.invoke_res = [response];
      },
      function(response) { // optional
        // failed
      }
      );

  }
  $scope.logsByStation = function (stationId) {
         var found = $filter('filter')($scope.logs, {station: stationId}, true);
         if (found.length) {
             return found;
         } else {
             '';
         }
  }
  $scope.onlyActive = false;
  $scope.onlyCanceled = false;
  $scope.onlyFinished = false;

  $scope.isOnlyActive = function(session) {
    if ($scope.onlyActive && !$scope.onlyPaused && !$scope.onlyFinished) {
      return session.station.paused == true && session.station.state != false; 
    }
    if (!$scope.onlyActive && !$scope.onlyPaused && $scope.onlyFinished) {
      return session.station.finished == true; 
    }
    if (!$scope.onlyActive && $scope.onlyCanceled) {
      return session.station.canceled == true; 
    }
    
    
    else {
      return session;
    }
  }

$scope.date = {startDate: null, endDate: null};




}])










