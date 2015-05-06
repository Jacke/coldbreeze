
// INDEX
minorityControllers.controller('BProcessListCtrl', ['$scope','$window','$translate' ,'$rootScope', 'TreeBuilder', 'SessionsFactory' ,'ngDialog', '$http', '$routeParams', '$filter', 'BPElemsFactory','BPSpacesFactory', 'BPSpaceElemsFactory',  'BProcessesFactory','BProcessFactory', 'BPStationsFactory', 'BPServicesFactory', '$location',
  function ($scope, $window, $translate, $rootScope, TreeBuilder, SessionsFactory, ngDialog, $http, $routeParams, $filter, BPElemsFactory, BPSpacesFactory, BPSpaceElemsFactory, BProcessesFactory, BProcessFactory, BPStationsFactory, BPServicesFactory, $location) {


 $scope.changeLanguage = function () {
    $translate.use($rootScope.lang);
  };
$scope.changeLanguage();


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


/**
* Get prev and now and next element of station
* @proc_id
* @station_id
**/
$scope.aroundFetch = function (proc_id, station_id) {
$http.get('/bprocess/'+proc_id+'/station/'+station_id+'/around')
      .success(function (data) {
          // Stores the token until the user closes the browser window.
          console.log(data);
          return data;
      })
      .error(function () {
      });
}






/*
*  Thumbnail tree builder
*/
 
$scope.builderFetch = function (bp) {
  var bpelems, spaces, spaceelems;
    bpelems = BPElemsFactory.query({ BPid: bp.id });
    spaces =  BPSpacesFactory.query({ BPid: bp.id });
    spaceelems = BPSpaceElemsFactory.query({ BPid: bp.id });

  /**
   * TREE BUILDER 
   */

  bpelems.$promise.then(function(data) {
    spaces.$promise.then(function(data2) {
      spaceelems.$promise.then(function(data3) {
        $scope.builder(bp, data, data2, data3);

        bp.frontSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_front,
                   _.filter(spaces, function(n){
                      return n.brick_front == v.brick_front;
                    })
                  ]})));
        bp.nestedSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_nested,
                   _.filter(spaces, function(n){
                      return n.brick_nested == v.brick_nested;
                    })
                  ]})));


  });
  });
  });
};

$scope.showInlineLaunch = function (session) {
  if (session.inlineLaunchShow) {
    session.inlineLaunchShow = false;
  } else {
    session.inlineLaunchShow = true;
  }
  return session;
}

$scope.builder = function (bp, data, data2,data3) {

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
    console.log("build thumb");


    var bpelemsCopy = angular.copy(data);
    var spacesCopy = angular.copy(data2);
    var spaceelemsCopy = angular.copy(data3);


    bp.trees = _.forEach(bpelemsCopy, function(val) {
         val.nodes = _.sortBy(_.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; }), function(em){ return em.order; });
    });
    _.forEach(bp.trees, function(tree) {

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


/**
 * Empty checking for collection
 * @param col Collection
 */
$scope.emptyCheck = function(col, bpId) {
    var z = _.filter(col, function(col_el) { return col_el.process == bpId; })
    return z.length > 0;
};
$scope.emptyElemCheck = function(col) {
  if (col) {
    return col.length > 0;
  } else {
    false;
  }
}

  $scope.editBP = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.modalShare = function (bpId) {
    //$scope.BPid = process.id;
    $scope.bpId = bpId;
    //$scope.process = process;
    ngDialog.open({
      template: 'partials/share/share.html',
      controller: 'ProcShareCtrl',
      scope: $scope
    });


  };
  $scope.perm = function(proc_id) {
    $scope.BPid = proc_id;
    ngDialog.open({
      template: 'partials/perms/perm-list.html',
      controller: 'BPPermListCtrl',
      scope: $scope
    });
  };

  $scope.business = $rootScope.business;

  $scope.deleteBP = function (bpId) {
    BProcessFactory.delete({ id: bpId }).$promise.then(function(data) {
      $scope.bprocesses = BProcessesFactory.query();
          $scope.bprocesses.$promise.then(function (processes) {
              _.forEach(processes, function(proc) { TreeBuilder.buildFetch(proc, function(success){}); });
          });
    });
  };
  $scope.hasActiveStation = function (bprocess) {
    console.log("hasActiveStation");
    console.log(_.filter($scope.stations, function(st) { return st.paused == true && st.process == bprocess.id }).length > 0);
    _.filter($scope.stations, function(st) { return st.paused == true && st.process == bprocess.id }).length > 0;
  };
  $scope.allServices = function () {
    $routeParams.service = undefined;
    $location.search('service', null);
           $scope.service_id = null;
          $location.path('/bprocesses');

  }
  /* callback for ng-click 'createBP': */
  $scope.createNewBP = function () {
    ngDialog.open({
      template: 'partials/bprocesses/bp-new.html',
      controller: 'BPCreationCtrl',
      scope: $scope
    });
  };
  $scope.services = BPServicesFactory.query();

  if ($routeParams.service != undefined) {
      $scope.bprocesses = BProcessesFactory.query();
      $scope.bprocesses.$promise.then(function(data){
        $scope.service_id = $routeParams.service;
        $scope.bprocesses = _.filter(data, function(proc){ return proc.service == $routeParams.service });
      });

  } else {
      $scope.bprocesses = BProcessesFactory.query();
  }
  
  // Init thumb
  $scope.bprocesses.$promise.then(function (processes) {
    _.forEach(processes, function(proc) { TreeBuilder.buildFetch(proc, function(success){
        $('.process_content .tree-thumb.process-tree').dragOn();
    }); });
    
  });




  $scope.stations = BPStationsFactory.query();

  $scope.stations.$promise.then(function(data) {
    $scope.stations = _.forEach(data, function(d) { d.inlineLaunchShow = false; return d });
  });
  $scope.bpElemLength = $http.get(jsRoutes.controllers.ProfileController.profile().absoluteURL(document.ssl_enabled) + 'bprocess/elems_length')
          .success(function (data) {
              // Stores the token until the user closes the browser window.
              console.log(data);
              $scope.bpElemLength = data;
          })
          .error(function () {
          });

  $scope.stationPercent = function(proc_id) {
    //console.log(station.process);
    /*var found = $filter('filter')($scope.bpElemLength, {id: station.process});

    if (found.length) {
      console.log(found)
             return found[0];
         } else {
             100;
         }*/
         //$scope.bpElemLength.$promise.then(function(data) {
            console.log("check");
            console.log($scope.bpElemLength);
             $scope.bpElemLength[proc_id];
     //});
  };
  $scope.parsePercent = function(num) {
    return parseInt(num);
  };

  $scope.openInvoke = function(proc_id) {
    $scope.bpId = proc_id;
    ngDialog.open({
      template: 'partials/inputs/inputs.html',
      controller: 'BPRequestCtrl',
      scope: $scope
    })
  };
  $scope.filterService = function(service_id) {
         var found = $filter('filter')($scope.services, {id: service_id}, true);
         if (found.length) {
             return found[0].title;
         } else {
             '';
         }
     }






/**
*
* Services
*
**/

$scope.sessions = SessionsFactory.query();
$scope.sessions.$promise.then(function (data2) {
    _.forEach(data2.sessions, function(session) { return session.session.station = session.station })
      $scope.bprocesses.$promise.then(function (processes) { 
        _.forEach(processes, function(proc) { 
          proc.sessions = _.filter(data2, function(ses) { return ses.process.id == proc.id });
        });
      })  
});



  /**
  *
  * Run initially
  *
  **/
$scope.run = function (process) {
      $http({
      url: 'bprocess/' + process.id + '/invoke',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
        $location.path('/bprocess/' + process.id + 'elements?session=' + parseInt(response.session));

      },
      function(response) { // optional
        // failed
      }
      );
  }








}]);


// READ



minorityControllers.controller('BProcessDetailCtrl', ['$scope', '$routeParams', 'BPServicesFactory', 'BProcessFactory', '$location', '$http',
function ($scope, $routeParams, BPServicesFactory, BProcessFactory, $location, $http) {


  $scope.updateBP = function () {
    BProcessFactory.update($scope.process).$promise.then(function(){
      $scope.closeThisDialog();
      $location.path('/bprocesses');
    });
  };
  $scope.cancel = function () {
    $location.path('/bprocesses');
  };
  
  $scope.invoke_res = [];
  if ($scope.bpId == undefined) {
    $scope.bpId = $routeParams.id;
  }
  //$scope.selectedTab = 1;
  $scope.procServices = BPServicesFactory.query();
  //$scope.bprocess = BProcessFactory.show({id: $scope.bpId });
}]);





// CREATE
minorityControllers.controller('BPCreationCtrl', ['$window', '$rootScope','$scope', '$http','$routeParams', 'TreeBuilder', 'BProcessesFactory', 'BPServicesFactory', '$location',
  function ($window, $rootScope, $scope, $http,$routeParams,  TreeBuilder, BProcessesFactory, BPServicesFactory, $location) {

    if ($routeParams.service != undefined) {
      $scope.bprocess = { service: parseInt($routeParams.service) };
    }

    $scope.procServices = BPServicesFactory.query();
    
    if ($window.sessionStorage.getItem('business') != undefined) {
      $scope.business = parseInt($window.sessionStorage.getItem('business'));
    } 
    else {
      $scope.business = $rootScope.business;
    }
    $scope.close = function(){
      $scope.closeThisDialog();
    }


    $scope.createNewBP = function () {
      BProcessesFactory.create($scope.bprocess).$promise.then(function(data) {
          $scope.bprocesses = BProcessesFactory.query();
          $routeParams.service = undefined;
          $scope.closeThisDialog();
          $scope.$parent.bprocesses = BProcessesFactory.query();
          $scope.$parent.bprocesses.$promise.then(function (processes) {
              _.forEach(processes, function(proc) { TreeBuilder.buildFetch(proc, function(success){}); })
          });
           //$location.path('/bprocesses');
    });
    }




}]);










































// Share
minorityControllers.controller('ProcShareCtrl', ['$scope', '$http', '$rootScope', '$routeParams', 'TreeBuilder','BPStationsFactory', 'ObserversFactory',
'ObserverFactory', 'BProcessesFactory', 'BPServicesFactory', '$location',
  function ($scope, $http,$rootScope, $routeParams,TreeBuilder, BPStationsFactory, ObserversFactory, ObserverFactory, BProcessesFactory, BPServicesFactory, $location) {

    $scope.hasPayingPlan = $rootScope.payed;

    $scope.close = function(){
      $scope.closeThisDialog();
    }



    $scope.observers = ObserversFactory.query({ process: $scope.bpId });
    $scope.stations = BPStationsFactory.query({ BPid: $scope.bpId });

    $scope.createNewObserver = function() {
      console.log($scope.newObserver)
      $scope.newObserver = ObserversFactory.create($scope.newObserver).$promise.then( function(data) {
         $scope.observers = ObserversFactory.query({ process: $scope.bpId, station: $scope.station});
         $scope.newObserver = {bprocess: $scope.bpId, station_id: $scope.station};
      });
      
    }

    $scope.deleteObserver = function(observe_id) {
      ObserverFactory.delete({ observe_id: observe_id }).$promise.then( function() {
          $scope.observers = ObserversFactory.query($scope.bpId, $scope.station);
      });
    }



  


  $scope.filterExpression = function(station) {
  return (station.finished != true && station.paused == true);
  }
  $scope.filterInputs = function(elem) {
    return (elem.type_title == "confirm");
  };











}]);




/*
 * Embeded
 **/
minorityControllers.controller('BPEmbededCtrl', ['$rootScope', '$scope', '$q', '$http', '$routeParams', 'ngDialog', 'BPElemsFactory','BPElemFactory', 'BPSpacesFactory', 'BPSpaceFactory', 'BPSpaceElemsFactory', 'BPSpaceElemFactory', '$location', '$route',
  function ($rootScope, $scope, $q,$http, $routeParams, ngDialog, BPElemsFactory, BPElemFactory, BPSpacesFactory, BPSpaceFactory, BPSpaceElemsFactory, BPSpaceElemFactory, $location, $route) {



 $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces.$promise.then(function(sps) {
     _.forEach(data, function(sp){ sp.newSpaceelem = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: $rootScope.business, space_owned: sp.id, space_role: "container",  comps: [ { "a_string" : null} ] }});
});

  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });

  $scope.openNewElem = function () {
    ngDialog.open({ template: 'partials/modals/newFrontElem.html' });
  };

  /* TREE BUILDER */
  $scope.bpelems.$promise.then(function(data) {
    $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
        $scope.builder();

        $scope.frontSpaces = _.object(_.uniq(_.map($scope.spaces, function(v) {
          return [v.brick_front,
                   _.filter($scope.spaces, function(n){
                      return n.brick_front == v.brick_front;
                    })
                  ]})));
        $scope.nestedSpaces = _.object(_.uniq(_.map($scope.spaces, function(v) {
          return [v.brick_nested,
                   _.filter($scope.spaces, function(n){
                      return n.brick_nested == v.brick_nested;
                    })
                  ]})));


  });
  });
  });
  $scope.elroles =
    [
        { id: 1, type: "container", name: "Container role" },
        { id: 2, type: "subbrick", name: "subbrick role" }
    ];
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
         val.nodes = _.sortBy(_.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; }), function(em){ return em.order; });
    });
    _.forEach($scope.trees, function(tree) {

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





}]);
