

/**
 * BP Perm
 */
// INDEX
minorityControllers.controller('BPPermListCtrl', ['$scope', '$filter', '$rootScope','EmployeesFactory','ProcPermissionsFactory','PermissionsFactory', 'PermissionFactory', 'BProcessesFactory','BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route', '$window',
  function ($scope, $filter, $rootScope,EmployeesFactory,ProcPermissionsFactory,PermissionsFactory, PermissionFactory, BProcessesFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route, $window) {

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


  $scope.bpelems = BPElemsFactory.query({ BPid: $scope.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $scope.BPid });
  EmployeesFactory.query().$promise.then( function(data) {
    $scope.employees = data.emps;
    $scope.creds = data.creds;
  });
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

  $scope.bpelems.$promise.then(function(data) {
    $scope.spaceelems.$promise.then(function(data3) {
      $scope.elemsHash = _.object(_.map($scope.bpelems, function(x){return [x.id, x]}));
      $scope.spaceElemHash = _.object(_.map($scope.spaceelems, function(x){return [x.id, x]}));
   });
  });
  $scope.credFetch = function (email) {
    var res = _.find($scope.creds, function(cr){ return cr.userId == email});
    if (res != undefined) {
      return email + " " + res.fullName;
    } else if (res == undefined) {
      return email + "  Anonymous";
    }
  };


  ProcPermissionsFactory.query({ BPid: $scope.BPid }).$promise.then(function(qu){
      console.log(qu);
      $scope.perms = qu.elemperms;
      $scope.accounts = qu.accounts;
      $scope.emps = qu.employees;
  });
  $scope.newperms = [];

  $scope.addPerm = function () {
      if(typeof $scope.perms === 'undefined') {
        $scope.perms = [];
        $scope.defaultParam();
      }



      $scope.newperms.push({});
  }
  $scope.byObjId = function(elem) {
    return function(obj) {
      if (obj.front_elem_id != undefined) {
        return obj.front_elem_id == elem.id;

      } else {
        return obj.space_elem_id == elem.id;

      }
      

    }
}
  $scope.delPerm = function (perm) {
    PermissionFactory.delete({id: perm.id}).$promise.then(function(data) {
       $scope.perms = ProcPermissionsFactory.query({ BPid: $scope.BPid });
    });
  }
  $scope.createPerm = function (perm, elem, where) {
    console.log(perm);
    if (elem != undefined) {
      if (where == "front") {
        perm.front_elem_id = elem.id;
      } else {
      perm.space_elem_id = elem.id;
      }; 
      perm.bprocess = $scope.BPid;
    PermissionsFactory.create(perm).$promise.then(function(data) {
       $scope.perms = ProcPermissionsFactory.query({ BPid: $scope.BPid });
    });

      
    }
  }

  $scope.defaultParam = function () {
      var targets = _.filter($scope.stations, function(station){ return station.paused == true; });
      _.each(targets, function(target) {
        target.params = [];
      });
      _.each(targets, function(target) {




        BPRequestFactory.scheme({ BPid: $scope.BPid, station_id: target.id }).$promise.then(function(data) {
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


  $scope.filterPerms = function(elem) {
    return (elem.type_title == "confirm");
  };


}]);



