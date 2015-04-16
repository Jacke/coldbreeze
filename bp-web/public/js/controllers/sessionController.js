// For all processes
minorityControllers.controller('SessionsCtrl', ['$http', '$window', '$scope', '$filter', '$rootScope','ObserversFactory', 'ObserverFactory', 'BProcessesFactory', 'BPInLoggersStationFactory','BPInLoggersFactory','BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($http, $window, $scope, $filter, $rootScope, ObserversFactory, ObserverFactory, BProcessesFactory, BPInLoggersStationFactory,BPInLoggersFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {
  $scope.bpId = $route.current.params.BPid;
  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });


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
  $scope.bpelems.$promise.then(function(data) {
    $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
        //$scope.builder();

  });
  });
  });




$scope.stationsRefresh = function() {

  BPStationsFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {

           $scope.bpstations = data; 
           $scope.fetchObservers($scope.bpstations);     
           console.log("boom");
      $scope.bpelems.$promise.then(function(data34) {
      $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
      $scope.logs.$promise.then(function(loggg) {
              _.forEach(data, function(station) { $scope.builder(station) });
               console.log(data);  
    });
    });
    });
    });
         // Highlight


    });
};

$scope.stationsRefresh();

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

  $scope.isOnlyActive = function(station) {
    if ($scope.onlyActive && !$scope.onlyPaused && !$scope.onlyFinished) {
      return station.paused == true && station.state != false; 
    }
    if (!$scope.onlyActive && !$scope.onlyPaused && $scope.onlyFinished) {
      return station.finished == true; 
    }
    if (!$scope.onlyActive && $scope.onlyCanceled) {
      return station.canceled == true; 
    }
    
    
    else {
      return station;
    }
  }






}])










