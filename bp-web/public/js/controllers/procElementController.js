

/**
 * BP Elements
 */
// INDEX
minorityControllers.controller('BPelementListCtrl', ['$scope', '$q', '$http', '$routeParams', 'ngDialog', 'BPElemsFactory','BPElemFactory', 'BPSpacesFactory', 'BPSpaceFactory', 'BPSpaceElemsFactory', 'BPSpaceElemFactory', '$location', '$route', 
  function ($scope, $q,$http, $routeParams, ngDialog, BPElemsFactory, BPElemFactory, BPSpacesFactory, BPSpaceFactory, BPSpaceElemsFactory, BPSpaceElemFactory, $location, $route) {
  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
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

  $scope.options = {
      accept: function(sourceNode, destNodes, destIndex) {
        var data = sourceNode.$modelValue;
        var destType = destNodes.$element.attr('data-type');
        return (data.type == destType); // only accept the same type
      },
      dropped: function(event) {
        console.log(event);
        var sourceNode = event.source.nodeScope;
        var destNodes = event.dest.nodesScope;
        // update changes to server
        /*if (destNodes.isParent(sourceNode)
          && destNodes.$element.attr('data-type') == 'category') { // If it moves in the same group, then only update group
          var group = destNodes.$nodeScope.$modelValue;
          //group.save();
        } else { // save all
          //$scope.saveGroups();
        }*/
      }
    };




  
  /* callback for ng-click 'editUser': */
  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */






  /* 
   Elements template
  */
  $scope.newSpace = { bprocess: $route.current.params.BPid, nestingLevel: 1, container:false,subbrick:false }
  $scope.newBpelem = { desc: "", bprocess: parseInt($route.current.params.BPid), business: 1, comps: [ { "a_string" : null} ] }
  $scope.newSpaceelem = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: 1,  comps: [ { "a_string" : null} ] }



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


  /* Number generator */
  $scope.orderFrontGen = function (elem) {
        if (elem != undefined) {
    if (_.last($scope.bpelems) != undefined && _.last($scope.bpelems).order != undefined) {
      elem.order = (_.max(_.map($scope.bpelems, function(l){return l.order})) + 1);
      return elem.order;
    }
    else {
      elem.order = 1;
      return 1;
    }
  };
  }
    
  $scope.orderNestedGen = function (elem) {
    if (elem != undefined) {
    if (_.last($scope.spaceelems) != undefined && _.last($scope.spaceelems).order != undefined) {
      elem.order = (_.max(_.map($scope.spaceelems, function(l){return l.order})) + 1);
      return elem.order;
    }
    else {
      elem.order = 1;
      return 1;
    }
  };
  }
  $scope.indexSpaceGen = function (space) {
    if (space != undefined) {
    if (_.last($scope.spaces) != undefined && _.last($scope.spaces).index != undefined) {
      space.index = _.last($scope.spaces).index + 1;
      return space.index;
    }
    else {
      space.index = 1;
      return 1;
    }
  };
  }




  /* Front CUD */
  $scope.moveUpElem = function (obj) {
    $http({
      url: 'bprocess/' + $routeParams.BPid + '/element/' + obj.id + '/up',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      }, 
      function(response) { // optional
        // failed
      }
      );
  };
  $scope.moveDownElem = function (obj) {
    $http({
     
      url: 'bprocess/' + $routeParams.BPid + '/element/' + obj.id + '/down',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      }, 
      function(response) { // optional
        // failed
      }
      );
  };



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
            "container": true,
            "subbrick": false,
            "brick_front": data.success,
            "nestingLevel": 1
        };
        $scope.indexSpaceGen(space);

        BPSpacesFactory.create(space).$promise.then(function(data) {
          BPSpacesFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {
                $scope.spaces = data;
                $scope.frontSpaces = _.object(_.uniq(_.map($scope.spaces, function(v) {
                return [v.brick_front, 
                         _.filter($scope.spaces, function(n){ 
                            return n.brick_front == v.brick_front;
                          })
                        ]})));
          });
        });
      };

      $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      $scope.newBpelem = { desc: "", bprocess: parseInt($route.current.params.BPid), business: 1 }      
      $scope.trees = undefined;
      $scope.newselected = 0;
      console.log("builder");
      $scope.builder();
    });
    
  }

_.findDeep = function(items, attrs) {

  function match(value) {
    for (var key in attrs) {
      if(!_.isUndefined(value)) {
        if (attrs[key] !== value[key]) {
          return false;
        }
      }
    }

    return true;
  }

  function traverse(value) {
    var result;

    _.forEach(value, function (val) {
      if (match(val)) {
        result = val;
        return false;
      }

      if (_.isObject(val) || _.isArray(val)) {
        result = traverse(val);
      }

      if (result) {
        return false;
      }
    });

    return result;
  }

  return traverse(items);

}

$scope.nestedIterator = function(tree) {
var nod_ids = [];
var nsd_ids = [];
_.forEach(tree, function(tr1) {
  _.forEach(tr1.nodes, function(tr2) {
               nod_ids.push(tr2);
    _.forEach(tr2.space_elem, function(tr3) {
               nsd_ids.push(tr3)
      _.forEach(tr3.nodes, function(tr4) {
               nod_ids.push(tr4);
        _.forEach(tr4.space_elem, function(tr5) {
               nsd_ids.push(tr5);
          _.forEach(tr5.nodes, function(tr6) {
               nod_ids.push(tr6);      
            _.forEach(tr6.space_elem, function(tr7){
               nsd_ids.push(tr7);
});
});
});
});
});
});
});
return [nod_ids, nsd_ids];
}

  function filteringNested(obj){
      var deferred = $q.defer();
      var pms = [];
      
      var IDS = $scope.nestedIterator([_.findDeep($scope.trees, {'id': obj.id})]);
      var spsIds = IDS[0];//_.filter($scope.spaces, function(space) {return space.brick_front == obj.id});
      var spElms = IDS[1];//_.filter($scope.spelem, function(elem) {return _.contain(spsIds, elem.space_own)});

      angular.forEach(spsIds, function(sid) { 
        pms.push(BPSpaceFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }).$promise); 
      });

      angular.forEach(spElms, function(sid) { 
        pms.push(BPSpaceElemFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }).$promise);  
      }); 
      

      //var z = _.map(spsIds, function(sid) { BPSpaceFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }) });
      //var zz = _.map(spElms, function(sid) { BPSpaceElemFactory.delete({ id: sid.id, BPid: $route.current.params.BPid })  });
    console.log(pms);
    //deferred.resolve(zz);
  return $q.all(pms);
  //return deferred.promise;

  }; 

  function filteringNestedInNested(obj){
      var deferred = $q.defer();
      var pms = [];
      


      var IDS = $scope.nestedIterator([_.findDeep($scope.trees, {'id': obj.id})]);
      var spsIds = IDS[0]; //_.filter($scope.spaces, function(space) {return space.brick_nested == obj.id});
      var spElms = IDS[1]; //_.filter($scope.spelem, function(elem) {return _.contain(spsIds, elem.space_own)});           
      

      angular.forEach(spsIds, function(sid) { 
        pms.push(BPSpaceFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }).$promise); 
      });

      angular.forEach(spElms, function(sid) { 
        pms.push(BPSpaceElemFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }).$promise);  
      }); 
      

      //var z = _.map(spsIds, function(sid) { BPSpaceFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }) });
      //var zz = _.map(spElms, function(sid) { BPSpaceElemFactory.delete({ id: sid.id, BPid: $route.current.params.BPid })  });
    console.log(pms);
    //deferred.resolve(zz);
  return $q.all(pms);
  //return deferred.promise;

  }; 
  $scope.deleteElem = function (obj) {
    BPElemFactory.delete({ id: bpId.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
       /* Element with spaces */
      $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      if (obj.type_title == "container_brick") {
        
        filteringNested(obj).then(function(data) {
            console.log(">>>>>>>>");
            console.log(data);
            $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid }); 
            $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
         });
        
      };

      $scope.builder();
    });
  };


  /* SPACES CUD */
  $scope.updateSpace = function (obj) {
    console.log(obj)
    BPSpaceFactory.update(obj).$promise.then(function(data) {
      $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
    });
  }
  $scope.createNewSpace = function () {
    BPSpacesFactory.create($scope.newSpace).$promise.then(function(data) {

      $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
    });
  }
  $scope.deleteSpace = function (obj) {
    BPSpaceFactory.delete({ id: obj.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
      $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
    });
  }; 





  /* Space Elem CUD */
  $scope.moveUpSpaceElem = function (obj) {
    $http({
      url: 'bprocess/' + $routeParams.BPid + '/space_elem/' + obj.id + '/' + obj.space_owned + '/up',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
      }, 
      function(response) { // optional
        // failed
      }
      );
  };
  $scope.moveDownSpaceElem = function (obj) {
    $http({
      url: 'bprocess/' + $routeParams.BPid + '/space_elem/' + obj.id + '/' + obj.space_owned + '/down',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
      }, 
      function(response) { // optional
        // failed
      }
      );
  };


$scope.createSpaceElem = function () {
    console.log($scope.newSpaceelem);
    BPSpaceElemsFactory.create($scope.newSpaceelem).$promise.then(function(elem_data) {

      if ($scope.newSpaceelem.type_title == "container_brick") {
        console.log("elem data");
        console.log(elem_data);

        var space = {
            "bprocess": $scope.newBpelem.bprocess,
            "container": true,
            "subbrick": false,
            "brick_nested": elem_data.success,
            "nestingLevel": _.find($scope.spaces, function(sp){ return sp.id == $scope.newSpaceelem.space_owned }).nestingLevel+1
        };
        $scope.indexSpaceGen(space);

        BPSpacesFactory.create(space).$promise.then(function(space_data) {
          BPSpacesFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {
                /* Update space id for container */
                $scope.newSpaceelem.space_own = space_data.success;
                $scope.newSpaceelem.id = elem_data.success;
                BPSpaceElemFactory.update($scope.newSpaceelem).$promise.then(function(data) {
                  $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
                  $scope.newSpaceelem = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: 1,  comps: [ { "a_string" : null} ] };
                });

                $scope.spaces = data;
                $scope.nestedSpaces = _.object(_.uniq(_.map($scope.spaces, function(v) {
                  return [v.brick_nested, 
                           _.filter($scope.spaces, function(n){ 
                              return n.brick_nested == v.brick_nested;
                            })
                          ]})));


          });
        });
      };

        $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
        
    });
}; 

$scope.updateSpaceElem = function (obj) {
    console.log(obj);
    BPSpaceElemFactory.update(obj).$promise.then(function(data) {
      $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
    });
};
$scope.deleteSpaceElem = function (obj) {
    BPSpaceElemFactory.delete({ id: obj.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
      $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
      if (obj.type_title == "container_brick") {
        
        filteringNestedInNested(obj).then(function(data) {
            console.log(">>>>>>>>");
            console.log(data);
            $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid }); 
            $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
         });
      };

    });
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
