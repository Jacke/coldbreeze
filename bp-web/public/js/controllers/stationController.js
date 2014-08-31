/**
 * BP Station
 */
// INDEX
minorityControllers.controller('BPstationListCtrl', ['$scope', '$filter', 'BProcessesFactory','BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($scope, $filter, BProcessesFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {

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

  $scope.trees = undefined;

  $scope.builder = function () {
    var bpelemsCopy = angular.copy($scope.bpelems);
    var spacesCopy = angular.copy($scope.spaces);
    var spaceelemsCopy = angular.copy($scope.spaceelems);
    $scope.trees = _.forEach(bpelemsCopy, function(val) { 
    console.log("filtered");
    console.log(_.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; }));
    console.log(val.id);
    val.spaced = 5;
    val.nodes = _.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; });
  });
    _.forEach($scope.trees, function(tree) { 
      var spaceFetch = function () {
        _.forEach(tree.nodes, function(space) {
           space.space_elem = _.filter(spaceelemsCopy, function(spelem){ return spelem.space_owned == space.id; });
        });
      };
      spaceFetch();
      spaceFetch();
      spaceFetch();
      spaceFetch();
      spaceFetch();
      // TODO: Add recursive call
    });
  }

  $scope.bpelems.$promise.then(function(data) {
    $scope.spaceelems.$promise.then(function(data3) {
      $scope.elemsHash = _.object(_.map($scope.bpelems, function(x){return [x.id, x]}));
      $scope.spaceElemHash = _.object(_.map($scope.spaceelems, function(x){return [x.id, x]}));
   });
  });

    
  

  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteElem = function (bpId) {
    BPStationFactory.delete({ id: bpId });
    $scope.bpstations = BPStationsFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };
  $scope.bpstations = BPStationsFactory.query({ BPid: $route.current.params.BPid });
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
             console.log(found)
             return found;
         } else {
             '';
         }
     }

  
}]);

