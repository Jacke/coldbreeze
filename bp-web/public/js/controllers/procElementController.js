

/**
 * BP Elements
 */
// INDEX
minorityControllers.controller('BPelementListCtrl', ['$scope', '$q', '$routeParams', 'BPElemsFactory','BPElemFactory', 'BPSpacesFactory', 'BPSpaceFactory', 'BPSpaceElemsFactory', 'BPSpaceElemFactory', '$location', '$route', 
  function ($scope, $q, $routeParams, BPElemsFactory, BPElemFactory, BPSpacesFactory, BPSpaceFactory, BPSpaceElemsFactory, BPSpaceElemFactory, $location, $route) {
  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });

  /* TREE BUILDER */
  $scope.bpelems.$promise.then(function(data) {
    $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
        $scope.builder();
  
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
  
  /* callback for ng-click 'editUser': */
  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */



  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };


  /* 
   Elements template
  */
  $scope.newBpelem = { comps: [ { "a_string" : null} ] }
  $scope.newSpaceelem = { comps: [ { "a_string" : null} ] }
  $scope.templateElem = function (template_id, elem) {
    // Confirm
    if (template_id == "confirm") {
      elem.b_type = "block"
      elem.type_title = "confirm"
      elem.comps = [ { "a_bool" : false, "b_bool": false} ]; 
    }
    // Container
    if (template_id == "container") {
      elem.b_type = "brick"
      elem.type_title = "container_brick"
      elem.comps = [ { "a_bool" : false, "b_bool": false} ]; 
    }
    // ResAct
  };
  $scope.templateSpaceelem = function (template_id) {
   // Confirm
    if (template_id == "confirm") {
      elem.b_type = "block"
      elem.type_title = "confirm"
      elem.comps = [ { "a_bool" : false, "b_bool": false} ]; 
    }
    // Container
    if (template_id == "container") {
      elem.b_type = "brick"
      elem.type_title = "container_brick"
      elem.comps = [ { "a_bool" : false, "b_bool": false} ]; 
    }
    // ResAct
  };

  $scope.newBpelem = { desc: "", bprocess: parseInt($route.current.params.BPid), business: 1 }
  $scope.newSpaceelem = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: 1 }




  /* Front CUD */
  $scope.updateElem = function (obj) {
    console.log(obj)  

    BPElemFactory.update(obj).$promise.then(function(data) {
      $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      $scope.builder();
    });
  }
  $scope.createNewElem = function () {
    console.log($scope.newBpelem);


    BPElemsFactory.create($scope.newBpelem).$promise.then(function(data) {
      console.log("DAAAAAATA");
      console.log(data);
    /* Element with spaces */
      if ($scope.newBpelem.type_title == "container_brick") {
        var space = {
            "bprocess": $scope.newBpelem.bprocess,
            "index": 1,
            "container": true,
            "subbrick": false,
            "brick_front": data.success,
            "nestingLevel": 1
        };
        BPSpacesFactory.create(space).$promise.then(function(data) {
          $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
        });
      }

      $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      $scope.builder();
    });
    
  }
  $scope.deleteElem = function (bpId) {
    BPElemFactory.delete({ id: bpId.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
       /* Element with spaces */
      $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      if (bpId.type_title == "container_brick") {
        
        var spsIds = _.filter($scope.spaces, function(space) {return space.brick_front == bpId.id});
        var spElms = _.filter($scope.spelem, function(elem) {return _.contain(spsIds, elem.space_own)});
        _.forEach(spsIds, function(sid) { BPSpaceFactory.delete({ id: sid.id, BPid: $route.current.params.BPid })});
        _.forEach(spElms, function(sid) { BPSpaceElemFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }) });
        $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
        $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
      }

      $scope.builder();
    });
  };


  /* SPACES CUD */
  $scope.updateSpace = function (obj) {
    console.log(obj)
    BPSpaceFactory.update(obj);
    $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.createNewSpace = function () {
    console.log($scope.newSpace)
    BPSpacesFactory.create($scope.newSpace);
    $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.deleteSpace = function (bpId) {
    BPSpaceFactory.delete({ id: bpId.id, BPid: $route.current.params.BPid });
    $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  }; 





  /* Space Elem CUD */
  $scope.updateSpaceElem = function (obj) {
    console.log(obj);
    BPSpaceElemFactory.update(obj);
    $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.createSpaceElem = function () {
    console.log($scope.newSpaceelem);
    BPSpaceElemsFactory.create($scope.newSpaceelem);
    $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.deleteSpaceElem = function (bpId) {
    BPSpaceElemFactory.delete({ id: bpId.id, BPid: $route.current.params.BPid });
    $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
  };





  $scope.frontSpace = function (elem_id) { // : spaceObj
    var result = _.find($scope.spaces, function(space){ return space.brick_front == elem_id; });
    console.log(result);
    result
  }
  $scope.BPid = $route.current.params.BPid;
 
}]);




minorityControllers.controller('BPelementCreationCtrl', ['$scope', 'BPElemsFactory','BPElemFactory', '$location', '$route', 
   function ($scope, BPElemsFactory, BPElemFactory, $location, $route) {
    $scope.createNewBPElem = function () {
      BPElemsFactory.create($scope.bpelem);
      $location.path('/bprocesses');
    }
}]);
