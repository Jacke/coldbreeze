



minorityControllers.controller('BPRequestCtrl', ['$scope', '$routeParams','$route','$filter','BPLogsFactory', 'BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory', 'BProcessFactory', 'BPStationsFactory', 'BPRequestFactory',  '$location', '$http',
function ($scope, $routeParams,$route,$filter,BPLogsFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BProcessFactory, BPStationsFactory, BPRequestFactory,  $location, $http) {

  console.log($routeParams.BPid);
  console.log($scope.bpId);
  if ($routeParams.BPid != undefined) {
   $scope.bpId = $routeParams.BPid;
  }

  $scope.bpelems = BPElemsFactory.query({ BPid: $scope.bpId }); 
  $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.bpId });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $scope.bpId });
  /* callback for ng-click 'editUser': */
  $scope.bpelems.$promise.then(function(data) {
    $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
        //$scope.builder();

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


    $scope.byObjId = function(elem) {
    return function(obj) {
      if (obj.f_elem != undefined) {
        return obj.f_elem == elem.id;

      } else {
        return obj.sp_elem == elem.id;

      }
      

    }
}



  $scope.logs = BPLogsFactory.query({  BPid: $scope.bpId });

  $scope.logsByStation = function (stationId) {
         var found = $filter('filter')($scope.logs, {station: stationId}, true);
         if (found.length) {
             //console.log(found)
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
  $scope.filterInputs = function(elem) {
    return (elem.type_title == "confirm");
  }
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
  $scope.haltStation = function (station_id) {
   $http({
      url: 'bprocess/' + $scope.bpId + '/station/' + station_id + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.bpstations = BPStationsFactory.query({ BPid: $scope.bpId });
      },
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.runInitially = function () {

      $http({
      url: 'bprocess/' + $scope.bpId + '/invoke',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
        $scope.closeThisDialog();
        $location.path('/bprocess/' + $scope.bpId + '/stations');

      },
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.runFrom = function (stationID, station) {
    var front_params = _.filter(station.proc_elems,  function(obj) { return obj.param != undefined });
    var space_params = _.filter(station.space_elems, function(obj) { return obj.param != undefined });
    var params_output = _.flatten(_.map(front_params, function(v) { return {"f_elem": v.id, "param": v.param} }), _.map(space_params, function(v) { return {"sp_elem": v.id, "param": v.param} }));
    // TODO: Add arguments
    console.log(front_params);
    console.log(space_params);
    console.log(params_output);
    console.log("/\ params")
    $http({
      url: 'bprocess/' + $scope.bpId + '/invoke_from/' + stationID,
      method: "POST",
      data: params_output//station.params
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
        $scope.closeThisDialog();
        $location.path('/bprocess/' + $scope.bpId + '/stations')
      },
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.addParam = function (station, bpelem, spaceelem, param) {
      if(typeof station.params === 'undefined') {
        station.params = [];
        $scope.defaultParam();
      } else {
      // TODO: Multiple params
      console.log(param);
      if (bpelem != null) {
      station.params.push({bpelem: bpelem.id, param: param });
      };
      if (spaceelem != null) {
      station.params.push({spaceelem: spaceelem.id, param: param });
      };
      };
  }
  $scope.delParam = function (station) {
    station.params.pop();
  }


  $scope.defaultParam = function () {
      var targets = _.filter($scope.bpstations, function(station){ return station.paused == true; });
      _.each(targets, function(target) {
        target.params = [];
      });
      _.each(targets, function(target) {




        BPRequestFactory.scheme({ BPid: $scope.bpId, station_id: target.id }).$promise.then(function(data) {
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
  };

  

  $scope.invoke_res = [];
  $scope.selectedTab = 1;
  BPStationsFactory.query({ BPid: $scope.bpId }).$promise.then(function(data) {
         $scope.bpstations = data;      
         console.log("boom");

         _.forEach($scope.bpstations, function (st) { $scope.addParam(st); });

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


  });
  $scope.defaultParam();
  $scope.bprocess = BProcessFactory.show({ id: $scope.bpId });
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