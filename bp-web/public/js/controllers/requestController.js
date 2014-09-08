



minorityControllers.controller('BPRequestCtrl', ['$scope', '$routeParams','$route','$filter','BPLogsFactory', 'BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory', 'BProcessFactory', 'BPStationsFactory', 'BPRequestFactory',  '$location', '$http',
function ($scope, $routeParams,$route,$filter,BPLogsFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BProcessFactory, BPStationsFactory, BPRequestFactory,  $location, $http) {
  console.log($routeParams.BPid)
  $scope.bpId = $routeParams.BPid;

//minorityControllers.controller('BPRequestCtrl', ['$scope', '$filter','$routeParams','BProcessesFactory','BProcessFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route', '$http',
//function ($scope, $filter, $routeParams, BProcessesFactory, BProcessFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route, $http) {

  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
  /* callback for ng-click 'editUser': */
  $scope.bpelems.$promise.then(function(data) {
    $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
        $scope.builder();
  
  });
  });
  });
  $scope.bpelems.$promise.then(function(data) {
    $scope.spaceelems.$promise.then(function(data3) {
      $scope.elemsHash = _.object(_.map($scope.bpelems, function(x){return [x.id, x]}));
      $scope.spaceElemHash = _.object(_.map($scope.spaceelems, function(x){return [x.id, x]}));
   });
  });

  $scope.trees = undefined;

  $scope.builder = function () {

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
    $scope.trees = _.forEach(bpelemsCopy, function(val) { 
         val.nodes = _.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; });
    });
    _.forEach($scope.trees, function(tree) { 
      
      var spaceFetch = function () {
        _.forEach(tree.nodes, function(space) {
           space.space_elem = _.filter(spaceelemsCopy, function(spelem){ return spelem.space_owned == space.id; });
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


  
  $scope.logs = BPLogsFactory.query({  BPid: $route.current.params.BPid });

  $scope.logsByStation = function (stationId) {
         var found = $filter('filter')($scope.logs, {station: stationId}, true);
         if (found.length) {
             console.log(found)
             return found;
         } else {
             '';
         }
  }


  $scope.params = [
     { block: 'confirm', name: 'confirmed' }
     
   ];


  $scope.updateBP = function () {
    BProcessFactory.update($scope.bprocess);
    $location.path('/bprocesses');
  };
  $scope.cancel = function () {
    $location.path('/bprocesses');
  };
  $scope.input = function (bpId) {
    $location.path('/bprocess/' + bPid + '/input')
  }
  $scope.filterExpression = function(station) {
  return (station.finished != true && station.paused == true);
  }
  $scope.haltStation = function (station_id) {
   $http({
      url: 'bprocess/' + $routeParams.BPid + '/station/' + station_id + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.stations = BPStationsFactory.query({ BPid: $routeParams.BPid });
      }, 
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.runInitially = function () {
      
      $http({
      url: 'bprocess/' + $routeParams.BPid + '/invoke',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
        $location.path('/bprocess/' + $routeParams.BPid + '/stations')
      }, 
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.runFrom = function (stationID, station) {
    console.log(station.params)
    $http({
      url: 'bprocess/' + $routeParams.BPid + '/invoke_from/' + stationID,
      method: "POST",
      data: station.params
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
        $location.path('/bprocess/' + $routeParams.BPid + '/stations')
      }, 
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.addParam = function (station) {
      if(typeof station.params === 'undefined') {
        station.params = [];
        $scope.defaultParam();
      }


      
      station.params.push({elem: '', param: 'confirmed' });
  }
  $scope.delParam = function (station) {
    station.params.pop();
  }


  $scope.defaultParam = function () {
      var targets = _.filter($scope.stations, function(station){ return station.paused == true; });
      _.each(targets, function(target) { 
        target.params = []; 
      }); 
      _.each(targets, function(target) { 
        
   
        

        BPRequestFactory.scheme({ BPid: $routeParams.BPid, station_id: target.id }).$promise.then(function(data) {
        console.log("magic happens here");
        console.log(data);

                      //target.proc_elems = [];
                     //target.space_elems = [];
                  target.proc_elems = data.proc_elems; 
                  target.space_elems = data.space_elems;
              }, function(error) {
                  console.log('error', error);
        });
        
      }); 
  }
  
  $scope.invoke_res = [];
  $scope.bpId = $routeParams.BPid;
  $scope.selectedTab = 1;
  $scope.stations = BPStationsFactory.query({ BPid: $routeParams.BPid });
  $scope.defaultParam();
  $scope.bprocess = BProcessFactory.show({ id: $routeParams.BPid });
}]);