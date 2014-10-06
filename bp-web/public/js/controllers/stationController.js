/**
 * BP Station
 */
// INDEX
minorityControllers.controller('BPstationListCtrl', ['$http','$scope', '$filter', 'BProcessesFactory', 'BPInLoggersStationFactory','BPInLoggersFactory','BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($http, $scope, $filter, BProcessesFactory, BPInLoggersStationFactory,BPInLoggersFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {

  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
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






BPStationsFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {

         $scope.bpstations = data;      
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


  $scope.highlightActive = function (station, elem_id) {
     var front, nest;
     front = $scope.elemsHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].element];  
     nest = $scope.spaceElemHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].space_elem];  
     if (front != undefined && front.id == elem_id) {
       return "active";
     } 
     if (nest != undefined && nest.id == elem_id) {
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
        console.log(response);
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

  /*
  * Observers stuff
  */
  $scope.fetchObservers = function (stations) {
    _.forEach(stations, function(station){ return station.obsrs = {"email": "test@mail.ru"} });

  };
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
