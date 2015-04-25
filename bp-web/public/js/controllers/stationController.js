
// For specific process
minorityControllers.controller('BPstationListCtrl', ['$http', '$window', '$scope', '$filter', '$rootScope','BPSessionsFactory','ObserversFactory', 'ObserverFactory', 'BProcessesFactory', 'BPInLoggersStationFactory','BPInLoggersFactory','BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($http, $window, $scope, $filter, $rootScope,BPSessionsFactory, ObserversFactory, ObserverFactory, BProcessesFactory, BPInLoggersStationFactory,BPInLoggersFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {
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

$scope.trees = undefined;
$scope.builder = function (station) {

  var isIsEnd = function (spElems) {
    _.forEach(spElems, function(val) {
       val.nodes = _.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; });
    });
    _.forEach(spElems, function(tree) {
         _.forEach(tree.nodes, function(space) {
             space.space_elem = _.filter(spaceelemsCopy, function(spelem){ return spelem.space_owned == space.id; });
             isIsEnd(space.space_elem);
        });
    });
  };
  console.log("build");
  var bpelemsCopy = angular.copy($scope.bpelems);
  var spacesCopy = angular.copy($scope.spaces);
  var spaceelemsCopy = angular.copy($scope.spaceelems);
  station.trees = _.forEach(bpelemsCopy, function(val) {
       val.nodes = _.sortBy(_.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; }), function(em){ return em.order; });
  });
  _.forEach(station.trees, function(tree) {

    var spaceFetch = function () {
      _.forEach(tree.nodes, function(space) {
         space.space_elem = _.sortBy(_.filter(spaceelemsCopy, function(spelem){ return spelem.space_owned == space.id; }), function(em){ return em.order; });
         isIsEnd(space.space_elem);
      });
    };

    spaceFetch();
    spaceFetch();
    spaceFetch();
    spaceFetch();
    spaceFetch();
  });
}

  $scope.bpelems.$promise.then(function(data) {
    $scope.spaceelems.$promise.then(function(data3) {
      $scope.elemsHash = _.object(_.map($scope.bpelems, function(x){return [x.id, x]}));
      $scope.spaceElemHash = _.object(_.map($scope.spaceelems, function(x){return [x.id, x]}));
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


  $scope.updateNote = function(station) {

    var token = $window.sessionStorage.getItem('token');
    $http.post(jsRoutes.controllers.ProcessSessionController.update_note(station.process, station.id).absoluteURL(document.ssl_enabled), {msg: station.note})
          .success(function (note_success) {
              console.log(note_success);
              console.log(station.note);
          })
          .error(function () {
          });
  }


<<<<<<< HEAD

=======
$scope.date = {startDate: null, endDate: null};
>>>>>>> HEAD@{1}
$scope.sessions = BPSessionsFactory.query({ BPid: $route.current.params.BPid });
$scope.sessions.$promise.then(function (data2) {
    _.forEach(data2.sessions, function(session) { return session.session.station = session.station })
    console.log(data2)
});




  /*
  * Observers stuff
  */
  $scope.fetchObservers = function (stations) {
    _.forEach(stations, function(station){ 
      station.newObserver = {bprocess: $scope.bpId, station_id: station.id};
      return station.obsrs = ObserversFactory.query({ process: $scope.bpId, station: station.id}); 
    });

  };
  $scope.deleteObserver = function(observe_id) {
      ObserverFactory.delete({ observe_id: observe_id }).$promise.then( function() {
          $scope.fetchObservers($scope.bpstations);
      });
  }
  $scope.createNewObserver = function(newObserver) {

      ObserversFactory.create(newObserver).$promise.then( function(data) {
         $scope.fetchObservers($scope.bpstations);
      });
      
  }



  //$scope.inputLoggers = function (stationId) {
    //_.filter($scope.allInputLogs, function(il){ return il.station == stationId; })
    //BPInLoggersStationFactory.query({BPid: $route.current.params.BPid, station_id: stationId});
  //};
  $scope.allInputLogs = BPInLoggersFactory.query({BPid: $route.current.params.BPid}).$promise.then(function(data) {
    $scope.inputLoggers = _.groupBy(data, function(x){return x.station});
  });

}]).animation('.slide', function() {
  var NgHideClassName = 'ng-hide';
  return {
    beforeAddClass: function(element, className, done) {
      if(className === NgHideClassName) {
        jQuery(element).slideUp(done);
      }
    },
    removeClass: function(element, className, done) {
      if(className === NgHideClassName) {
        jQuery(element).hide().slideDown(done);
      }
    }
  }
});
