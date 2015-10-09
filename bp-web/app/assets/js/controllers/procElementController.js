define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {




/**
 * BP Elements
 */
// INDEX
minorityControllers.controller('BPelementListCtrl', ['$timeout','$window','$filter', '$rootScope', '$scope', '$q', '$http', '$routeParams',
  'toaster', 'BPInLoggersSessionFactory', 'BProcessFactory',
  'BPStationsFactory',
  'EmployeesFactory',
  'ProcPermissionsFactory',
  'PermissionsFactory',
  'BProcessesFactory',
  'ngDialog',
  'BPElemsFactory',
  'BPElemFactory',
  'BPSessionsFactory',
  'BPStationsFactory',
  'BPSpacesFactory',
  'BPSpaceFactory',
  'BPSpaceElemsFactory',
  'BPSpaceElemFactory',
  'BPStatesFactory',
  'BPStateFactory',
  'BPSessionStatesFactory',
  'BPSessionStateFactory',
  'RefsFactory',
  'SwitchesFactory',
'SwitchFactory',
'DataCostCollection',
'LaunchSwitchersFactory',
'LaunchElemsFactory',
'LaunchSpacesFactory',
'LaunchSpaceElemsFactory',
'LaunchElementTopologsFactory',
'LaunchReactionsFactory',
'ReactionsFactory',
'ReactionFactory',
'ElementTopologsFactory',
'InteractionsFactory',

  '$location', '$route', '$animate',
  function ($timeout, $window, $filter, $rootScope, $scope, $q,$http, $routeParams, toaster, BPInLoggersSessionFactory, BProcessFactory, BPStationsFactory,EmployeesFactory, ProcPermissionsFactory, PermissionsFactory, BProcessesFactory, ngDialog, BPElemsFactory, BPElemFactory, BPSessionsFactory, BPStationsFactory, BPSpacesFactory, BPSpaceFactory, BPSpaceElemsFactory, BPSpaceElemFactory, BPStatesFactory, BPStateFactory, BPSessionStatesFactory, BPSessionStateFactory,RefsFactory, SwitchesFactory,SwitchFactory,DataCostCollection,  LaunchSwitchersFactory, LaunchElemsFactory,LaunchSpacesFactory,LaunchSpaceElemsFactory,LaunchElementTopologsFactory, LaunchReactionsFactory,ReactionsFactory,ReactionFactory,ElementTopologsFactory, InteractionsFactory, $location, $route, $animate) {


  $scope.route = jsRoutes.controllers.BusinessProcessController;
  $scope.businessSet = $rootScope.business;



  $scope.business = function () {
     return parseInt($window.localStorage.getItem('business'));

  }
  /************************************************************************
   ** Cost module
 ***************************************  */
  // Fetch resource and entities for that resource
  DataCostCollection.query().$promise.then(function(res) {
    $scope.resources = res;
    _.forEach($scope.resources, function(r){ r.entities.unshift({title: "All", id:"*"}) });
  });
  // /data/cost/assign/:resource_id
  $scope.pushAsssignedResEl = function() {

    $http.post(jsRoutes.controllers.BusinessProcessController, data).success(function(success) {
        $location.path('/bprocesses');
    }).error(function (error) {
      toaster.pop('error', "Operation fail", "Please try something else");
    });


  }
  // /data/cost/up_assign/:resource_id
  $scope.updateAsssignedResEl = function() {
    
  }
  // /data/cost/del_assign/:resource_id
  $scope.deleteAsssignedResEl = function() {
    
  }


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



  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.states = BPStatesFactory.query({ BPid: $route.current.params.BPid });
  $scope.switches = SwitchesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces.$promise.then(function(sps) {
    _.forEach(sps, function(sp){ sp.newSpaceelem = { space_id: sp.id, desc:  "", process: parseInt($route.current.params.BPid), business: $scope.business(), space_role: "container",  comps: [ { "a_string" : null} ] }
});
  });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });

  BProcessesFactory.query().$promise.then(function(data) {


    BPStationsFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(stations) {

    $scope.bp = _.find(data, function(proc) { return proc.id == $route.current.params.BPid});
    $scope.bp.newelemformselected = 0;

    $scope.business = function () {
      if($scope.bp != undefined) {       return $scope.bp.business;
      } else { return 0 }
    }

    $scope.hasActiveStation = _.filter(stations, function(st) { return st.paused == true && st.process == $scope.bp.id }).length > 0;

    });
  });
/**
* Reload resources after some action(e.g. delete or update some elements)
**/

$scope.reloadResources = function() {
$scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
$scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
$scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
       $scope.states = BPStatesFactory.query({ BPid: $route.current.params.BPid });
       $scope.switches = SwitchesFactory.query({ BPid: $route.current.params.BPid });
       $scope.bpelems.$promise.then(function (bpelems) {
       $scope.spaces.$promise.then(function (spaces) {
       $scope.spaceelems.$promise.then(function (spaceelems) {
        $scope.switches.$promise.then(function (switches) {
          $scope.states.$promise.then(function (states) {
            $scope.reactions.$promise.then(function (reactions) {
              $scope.element_topologs.$promise.then(function (topo) {


    $scope.bpelems = bpelems;
    $scope.spaces = spaces;
    $scope.spaceelems = spaceelems;
    $scope.states = states;
    $scope.switches = switches;
    $scope.reactions = reactions;
    $scope.element_topologs = topo;


    /* perms */
    ProcPermissionsFactory.perms({ BPid: $scope.BPid }).$promise.then(function(q) {
    _.forEach($scope.bpelems, function(z) {
      z.perms = _.filter(q.elemperms, function(per) { return z.id == per.front_elem_id });
    });
    _.forEach($scope.spaceelems, function(z) {
      z.perms = _.filter(q.elemperms, function(per) { return z.id == per.space_elem_id });
    });
    });
    /*******************/

    _.forEach($scope.bpelems, function(z) {
    z.states = _.filter($scope.states, function(d){ return d.front_elem_id == z.id;});
    z.topo_id = _.find($scope.element_topologs, function(d){ return d.element_id == z.id && d.space_element == false; });
    z.reactions = _.filter($scope.reactions, function(sw) { return z.topo_id != undefined && sw.reaction.element == z.topo_id.topo_id });

    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });
    ///*if (z.b_type == "brick") {
      z.spaces = _.filter($scope.spaces, function(s){ return s.brick_front == z.id;});
        _.forEach(z.spaces, function(sp) {
              sp.spelems = _.filter($scope.spaceelems, function(spelem){
               return spelem.ref_space_owned == sp.id;
           })
        });
    //}*/

  });
  _.forEach($scope.spaceelems, function(z) {
    z.topo_id = _.find($scope.element_topologs, function(d){ return d.space_elem_id == z.id && d.space_element == true;});
    z.reactions = _.filter($scope.reactions, function(sw) { return z.topo_id != undefined && sw.reaction.element == z.topo_id.topo_id });
    z.states = _.filter(states, function(d){ return d.space_elem_id == z.id;});
    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });
  });
  _.forEach($scope.spaces, function(z) {
    z.states = _.filter($scope.states, function(d){ return d.space_id == z.id;});
    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });
  });

 });
 });
 });
});
});
});
 });
}

$scope.reloadResourcesForSession = function(session) {
   $scope.states = BPSessionStatesFactory.query({ BPid: $route.current.params.BPid, id: session.id });
   $scope.switches = LaunchSwitchersFactory.query({ launch_id: session.id });

   $scope.bpelems = LaunchElemsFactory.query({ launch_id: session.id });
   $scope.spaces = LaunchSpacesFactory.query({ launch_id: session.id });
   $scope.spaceelems = LaunchSpaceElemsFactory.query({ launch_id: session.id });

   $scope.element_topologs = LaunchElementTopologsFactory.query({ launch_id: session.id });
   $scope.reactions = LaunchReactionsFactory.query({ launch_id: session.id });

   $scope.states.$promise.then(function (states) {
      $scope.switches.$promise.then(function(switches) {
        $scope.switches = switches;

    _.forEach($scope.bpelems, function(z) {
    z.states = _.filter(states, function(d){ return d.front_elem_id == z.id;});
    z.topo_id = _.find($scope.element_topologs, function(d){ return d.element_id == z.id && d.space_element == false;});
    z.reactions = _.filter($scope.reactions, function(sw) { return z.topo_id != undefined && sw.reaction.element == z.topo_id.topo_id });

    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) {
          return sw.state_ref == st.origin_state })
    });

    ///*if (z.b_type == "brick") {
      z.spaces = _.filter($scope.spaces, function(s){ return s.brick_front == z.id;});
        _.forEach(z.spaces, function(sp) {
              sp.spelems = _.filter($scope.spaceelems, function(spelem){
               return spelem.ref_space_owned == sp.id;
           })
        });
    //}*/

  });

  _.forEach($scope.spaceelems, function(z) {
    z.topo_id = _.find($scope.element_topologs, function(d){ return d.element_id == z.id && d.space_element == true;});
    z.reactions = _.filter($scope.reactions, function(sw) { return z.topo_id != undefined && sw.reaction.element == z.topo_id.topo_id });
    z.states = _.filter(states, function(d){ return d.space_elem_id == z.id;});
    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });
  });
  _.forEach($scope.spaces, function(z) {
    z.states = _.filter(states, function(d){ return d.space_id == z.id;});
    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });
  });

 });
 });

}

$scope.loadResources = function() {
  BPElemsFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {
  BPSpacesFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data2) {
  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data3) {
  $scope.states.$promise.then(function (states) {
  $scope.switches.$promise.then(function (switches) {
    $scope.reactions.$promise.then(function (reactions) {
    $scope.element_topologs.$promise.then(function (topo) {

    $scope.bpelems = data;
    $scope.spaces = data2;
    $scope.spaceelems = data3;
    $scope.reactions = reactions;
    $scope.states = states;
    $scope.switches = switches;
    $scope.element_topologs = topo;

    /* perms */
    ProcPermissionsFactory.perms({ BPid: $scope.BPid }).$promise.then(function(q) {
    _.forEach($scope.bpelems, function(z) {
      z.perms = _.filter(q.elemperms, function(per) { return z.id == per.front_elem_id });
    });
    _.forEach($scope.spaceelems, function(z) {
      z.perms = _.filter(q.elemperms, function(per) { return z.id == per.space_elem_id });
    });
    });
    /*******************/

    _.forEach($scope.bpelems, function(z) {
    z.states = _.filter($scope.states, function(d){ return d.front_elem_id == z.id;});
    z.topo_id = _.find($scope.element_topologs, function(d){ return d.element_id == z.id && d.space_element == false;;});
    z.reactions = _.filter($scope.reactions, function(sw) { return z.topo_id != undefined && sw.reaction.element == z.topo_id.topo_id });

    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });


    ///*if (z.b_type == "brick") {
      z.spaces = _.filter($scope.spaces, function(s){ return s.brick_front == z.id;});
        _.forEach(z.spaces, function(sp) {
              sp.spelems = _.filter($scope.spaceelems, function(spelem){
               return spelem.ref_space_owned == sp.id;
           })
        });
    //}*/

  });
  _.forEach($scope.spaceelems, function(z) {
    z.topo_id = _.find($scope.element_topologs, function(d){ return d.element_id == z.id && d.space_element == true;});
    z.reactions = _.filter($scope.reactions, function(sw) { return z.topo_id != undefined && sw.reaction.element == z.topo_id.topo_id });
    z.states = _.filter($scope.states, function(d){ return d.space_elem_id == z.id;});
    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });
  });
  _.forEach($scope.spaces, function(z) {
    z.states = _.filter($scope.states, function(d){ return d.space_id == z.id;});
    _.forEach(z.states, function(st){ return st.switches = _.filter($scope.switches, function(sw) { return sw.state_ref == st.id }) });
  });
  });
  });
  });
  });
  });
  });
  });
};

  $scope.mySpaceElems = function(space_elems, space_id) {
     var res = _.filter(space_elems, function(elem){ return elem.space_owned == space_id });
     if (res == undefined) {
      return [];
     } else {
      return res;
     }
  };
  $scope.highlightActive = function() {
    return false;
  }
  $scope.copyProcess = function () {
    var data = {};
    $http.post($scope.route.copy($scope.bp.id, $scope.bp.title + " Copy").absoluteURL(document.ssl_enabled), data).success(function(success) {
        $location.path('/bprocesses');
    }).error(function (error) {
      toaster.pop('error', "Operation fail", "Please try something else");
    });
  };

  $scope.testing = function (elem) {
  $scope.updateElem(elem);
  var z = BPElemsFactory.query({ BPid: $route.current.params.BPid });
}
  /**
   * Modals window
   */

  $scope.editProcess = function () {
    $scope.BPid = $scope.bp.id;
    $scope.process = $scope.bp;
    ngDialog.open({
      template: '/assets/partials/bprocesses/bp-detail.html',
      controller: 'BProcessDetailCtrl',
      scope: $scope
    });


  };
  $scope.modalShare = function () {
    ngDialog.open({
      template: '/assets/partials/share/share.html',
      controller: 'ProcShareCtrl',
      scope: $scope
    });


  };
  $scope.perm = function() {
    $scope.BPid = $scope.bp.id;
    ngDialog.open({
      template: '/assets/partials/perms/perm-list.html',
      controller: 'BPPermListCtrl',
      scope: $scope
    });
  };

  $scope.openNewElem = function () {
    ngDialog.open({ template: '/assets/partials/modals/newFrontElem.html' });
  };

  /**
   * TREE BUILDER
   */

  $scope.bpelems.$promise.then(function(data) {
    $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
        //$scope.builder();

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
$scope.options = {
      accept: function(sourceNode, destNodes, destIndex) {
        var data = sourceNode.$modelValue;
        var destType = destNodes.$element.attr('data-type');
        return (data.type == destType); // only accept the same type
      },
      dropped: function(event) {

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



  $scope.editElem = function (BPid) {
    $location.path('/bp-detail/' + BPid + '/edit');
  };
  $scope.showElem = function (BPid) {
    $location.path('/bprocess/' + BPid + '/show');
  };


  $scope.updateInline = function(title) {
    BProcessFactory.show({ id: $scope.BPid }).$promise.then(function (data) {
        var process = data;
        process.title = title;
        console.log(process);
        BProcessFactory.update(process).$promise.then(function(){
            console.log('updated');
        });

    });
  };


  // Flush form
  //
  $scope.flushEditForm = function(form, space) {
   space.newSpaceelem = { desc:  "", process: parseInt($route.current.params.BPid), space_id: space.id, business: $scope.business(),  comps: [ { "a_string" : null} ] };
   form = { desc:  "", process: parseInt($route.current.params.BPid), business: $scope.business(),  comps: [ { "a_string" : null} ] };
   $scope.cneedit = false;
  }



  /*
   Elements template
  */
  $scope.newSpace = { process: parseInt($route.current.params.BPid), nestingLevel: 1, container:false,subbrick:false }
  $scope.newBpelem = { desc: "", process: parseInt($route.current.params.BPid), business: $scope.business(), comps: [ { "a_string" : null} ] }
  $scope.newSpaceelem = { desc:  "", process: parseInt($route.current.params.BPid), business: $scope.business(), space_role: "container",  comps: [ { "a_string" : null} ] }



  $scope.templateElem = function (template_id, elem) {
    // Confirm
    if (template_id == "confirm") {
      $scope.newBpelem.b_type = "block";
      $scope.newBpelem.type_title = "confirm";
      $scope.newBpelem.comps = [ { "a_bool" : false, "b_bool": false} ];
    }
    // Container
    if (template_id == "container") {
      $scope.newBpelem.b_type = "brick";
      $scope.newBpelem.type_title = "container_brick";
      $scope.newBpelem.comps = [ { "a_bool" : false, "b_bool": false} ];
    }
    // ResAct
  };
  $scope.templateSpaceElem = function (template_id, elem) {
   // Confirm
    if (template_id == "confirm") {
      elem.b_type = "block";
      elem.type_title = "confirm";
      elem.comps = [ { "a_bool" : false, "b_bool": false} ];
    }
    // Container
    if (template_id == "container") {
      elem.b_type = "brick";
      elem.type_title = "container_brick";
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
      var elms = _.filter($scope.spaceelems, function(elms){ return elms.space_owned == elem.space_owned });
      //
      //

    if (_.last(elms) != undefined && _.last(elms).order != undefined) {
      elem.order = (_.max(_.map(elms, function(l){return l.order})) + 1);
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
      url: 'bprocess/' + parseInt($route.current.params.BPid) + '/element/' + obj.id + '/up',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success

        $scope.reloadResources();
        //$scope.reloadTree($scope.trees);
      },
      function(response) { // optional
        // failed
      }
      );
  };
  $scope.moveDownElem = function (obj) {
    $http({

      url: 'bprocess/' + parseInt($route.current.params.BPid) + '/element/' + obj.id + '/down',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success

      $scope.reloadResources();
        //$scope.reloadTree($scope.trees);
      },
      function(response) { // optional
        // failed
      }
      );
  };



  $scope.updateElem = function (obj) {


    BPElemFactory.update(obj).$promise.then(function(data) {
      $timeout(function(){
        $scope.reloadResources();
        $scope.loadResources();
        $timeout(function () {
          // 0 ms delay to reload the page.
       $route.reload();
      }, 0);
      //$scope.reloadTree($scope.trees);
      });
    })
  }
  $scope.createNewElem = function () {



    BPElemsFactory.create($scope.newBpelem).$promise.then(function(data) {

    angular.element('.element-new-form').hide();
    // Add perm
    _.forEach($scope.newBpelem.perms, function(perm) {
      if (perm.uid != undefined) {
        perm.front_elem_id = data.success.proc_elems[0];
      if (perm.group == true) {
        perm.group = perm.id;
      }
      perm.process = $scope.BPid;
      perm.role = 'all';
      
      PermissionsFactory.create(perm).$promise.then(function(data) {
        $scope.perms = ProcPermissionsFactory.query({ BPid: $scope.BPid }).$promise.then(function(d) {
        $scope.loadPerm();
      
      });

    });
    }
    });
    // Perm added

    /* Element with spaces */
      if ($scope.newBpelem.type_title == "container_brick1") {
        var space = {
            "bprocess": $scope.newBpelem.bprocess,
            "container": true,
            "subbrick": false,
            "brick_front": data.success,
            "nestingLevel": 1
        };
        $scope.indexSpaceGen(space);
    }

      //$scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      console.log("lighted");
      $scope.newBpelem = { desc: "", process: parseInt($route.current.params.BPid), business: $scope.business() };
      $scope.trees = undefined;
      $scope.bp.newelemformselected = 0;
      //$scope.reloadTree($scope.trees);
      $timeout(function(){
        $scope.reloadResources();
        $scope.loadResources();
        $timeout(function () {
          // 0 ms delay to reload the page.
       $route.reload();
      }, 0);

      }, 2000);
      $scope.bp.newelemformselected = 0;


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

$scope.nested_travers = function(obj, spaces, space_elements) {
  var deferred = $q.defer();
  var pms = [];
  var space_init;
  var elems_ids = [];
  var sps_ids = [];
  var init_ids;
  var spelems_init_idsLEFT;
  var post_sps_ids;
  var post_spelems_ids;
  var post_sps_ids1;
  var post_spelems_ids1;
  var post_sps_ids2;
  var post_spelems_ids2;
  var post_sps_ids3 ;
  var post_spelems_ids3;
  var post_sps_ids4;
  var post_spelems_ids4;

  // spaces for root object
  spaces_init = _.filter(spaces, function(sp){ return sp.brick_nested == obj.id }); // || sp.id == obj.space_owned });
  init_ids = _.map(spaces_init, function(sp){ return sp.id }); // init ids
  sps_ids = sps_ids.concat(init_ids);

  space_elems_initLEFT = _.filter(space_elements, function(spelem){ return _.contains(init_ids, spelem.space_owned) && spelem.id != obj.id });
  spelems_init_idsLEFT = _.map(space_elems_initLEFT, function(sp){ return sp.id }); // init ids
  elems_ids = elems_ids.concat(spelems_init_idsLEFT);










  // POST INIT SHIT
  post_sps_ids = _.map(_.filter(spaces, function(n) { return _.contains(spelems_init_idsLEFT, n.brick_nested) }), function(sp){ return sp.id });
  sps_ids = sps_ids.concat(post_sps_ids);

  post_spelems_ids = _.map(_.filter(space_elements, function(n) { return _.contains(post_sps_ids, n.space_owned) }), function(sp){ return sp.id });
  elems_ids = elems_ids.concat(post_spelems_ids);



  post_sps_ids1 = _.map(_.filter(spaces, function(n) { return _.contains(post_spelems_ids, n.brick_nested) }), function(sp){ return sp.id });
  sps_ids = sps_ids.concat(post_sps_ids1);

  post_spelems_ids1 = _.map(_.filter(space_elements, function(n) { return _.contains(post_sps_ids1, n.space_owned) }), function(sp){ return sp.id });
  elems_ids = elems_ids.concat(post_spelems_ids1);



  post_sps_ids2 = _.map(_.filter(spaces, function(n) { return _.contains(post_sps_ids1, n.brick_nested) }), function(sp){ return sp.id });
  sps_ids = sps_ids.concat(post_sps_ids2);

  post_spelems_ids2 = _.map(_.filter(space_elements, function(n) { return _.contains(post_sps_ids2, n.space_owned) }), function(sp){ return sp.id });
  elems_ids = elems_ids.concat(post_spelems_ids2);



  post_sps_ids3 = _.map(_.filter(spaces, function(n) { return _.contains(post_sps_ids2, n.brick_nested) }), function(sp){ return sp.id });
  sps_ids = sps_ids.concat(post_sps_ids3);

  post_spelems_ids3 = _.map(_.filter(space_elements, function(n) { return _.contains(post_sps_ids3, n.space_owned) }), function(sp){ return sp.id });
  elems_ids = elems_ids.concat(post_spelems_ids3);



  post_sps_ids4 = _.map(_.filter(spaces, function(n) { return _.contains(post_sps_ids3, n.brick_nested) }), function(sp){ return sp.id });
  sps_ids = sps_ids.concat(post_sps_ids4);

  post_spelems_ids4 = _.map(_.filter(space_elements, function(n) { return _.contains(post_sps_ids4, n.space_owned) }), function(sp){ return sp.id });
  elems_ids = elems_ids.concat(post_spelems_ids4);

setTimeout(function() {
  deferred.resolve([sps_ids, elems_ids])
}, 2000);

//return [sps_ids, elems_ids];
//return $q.all(pms);
  return deferred.promise;


}

  function filteringNested(obj){

      var deferred = $q.defer();
      var pms = [];

      $scope.nested_travers(obj, $scope.spaces, $scope.spaceelems).then(function(IDS) {
        var spsIds = IDS[0];//_.filter($scope.spaces, function(space) {return space.brick_front == obj.id});
        var spElms = IDS[1];//_.filter($scope.spelem, function(elem) {return _.contain(spsIds, elem.space_own)});





        angular.forEach(spsIds, function(sid) {
          pms.push(BPSpaceFactory.delete({ id: sid, BPid: $route.current.params.BPid }).$promise);
        });

        angular.forEach(spElms, function(sid) {
          pms.push(BPSpaceElemFactory.delete({ id: sid, BPid: $route.current.params.BPid }).$promise);
        });


      }); //$scope.nestedIterator([_.findDeep($scope.trees, {'id': obj.id})]);


      //var z = _.map(spsIds, function(sid) { BPSpaceFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }) });
      //var zz = _.map(spElms, function(sid) { BPSpaceElemFactory.delete({ id: sid.id, BPid: $route.current.params.BPid })  });

    //deferred.resolve(zz);
  return $q.all(pms);

  //return deferred.promise;

  };

  function filteringNestedInNested(obj){


      var deferred = $q.defer();
      var pms = [];



     $scope.nested_travers(obj, $scope.spaces, $scope.spaceelems).then(function(IDS) { //$scope.nestedIterator([_.findDeep($scope.trees, {'id': obj.id})]);
        var spsIds = IDS[0]; //_.filter($scope.spaces, function(space) {return space.brick_nested == obj.id});
        var spElms = IDS[1]; //_.filter($scope.spelem, function(elem) {return _.contain(spsIds, elem.space_own)});





        angular.forEach(spsIds, function(sid) {
          pms.push(BPSpaceFactory.delete({ id: sid, BPid: $route.current.params.BPid }).$promise);
        });

        angular.forEach(spElms, function(sid) {
          pms.push(BPSpaceElemFactory.delete({ id: sid, BPid: $route.current.params.BPid }).$promise);
        });
         //$scope.reloadTree($scope.trees);
     });

      //var z = _.map(spsIds, function(sid) { BPSpaceFactory.delete({ id: sid.id, BPid: $route.current.params.BPid }) });
      //var zz = _.map(spElms, function(sid) { BPSpaceElemFactory.delete({ id: sid.id, BPid: $route.current.params.BPid })  });

    //deferred.resolve(zz);
  return $q.all(pms);
  //return deferred.promise;

  };
  $scope.deleteElem = function (obj) {
    BPElemFactory.delete({ id: obj.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
       /* Element with spaces */
      $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      if (obj.type_title == "container_brick11") {

        filteringNested(obj).then(function(data) {


            $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
            $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
         });

      };
      $timeout(function(){
        $scope.reloadResources();
        $scope.loadResources();
        $timeout(function () {
          // 0 ms delay to reload the page.
       $route.reload();
      }, 0);
    });
    });
  };


  /* SPACES CUD */
  $scope.updateSpace = function (obj) {

    BPSpaceFactory.update(obj).$promise.then(function(data) {
      $scope.reloadResources();
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
      url: 'bprocess/' + parseInt($route.current.params.BPid) + '/space_elem/' + obj.id + '/' + obj.space_owned + '/up',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success

        $scope.reloadResources();
        //$scope.reloadTree($scope.trees);
      },
      function(response) { // optional
        // failed
      }
      );
  };
  $scope.moveDownSpaceElem = function (obj) {
    $http({
      url: 'bprocess/' + parseInt($route.current.params.BPid) + '/space_elem/' + obj.id + '/' + obj.space_owned + '/down',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        // success

      $scope.reloadResources();
        //$scope.reloadTree($scope.trees);
      },
      function(response) { // optional
        // failed
      }
      );
  };

$scope.createSpaceElemFromSpace = function (obj) {
  BPSpaceElemsFactory.create(obj).$promise.then(function(elem_data) {
    angular.element('.element-new-form').hide();

/*
    if (obj.type_title == "container_brick") {



      var space = {
          "bprocess": parseInt($route.current.params.BPid),
          "container": true,
          "subbrick": false,
          "brick_nested": elem_data.success,
          "nestingLevel": _.find($scope.spaces, function(sp){ return sp.id == obj.space_owned }).nestingLevel+1
      };
      $scope.indexSpaceGen(space);

      BPSpacesFactory.create(space).$promise.then(function(space_data) {
        BPSpacesFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {

              obj.space_own = space_data.success;
              obj.id = elem_data.success;
              BPSpaceElemFactory.update(obj).$promise.then(function(data) {
                $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
                obj = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: $scope.business(),  comps: [ { "a_string" : null} ] };
              });
               _.forEach(data, function(sp){ sp.newSpaceelem = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: $scope.business(), space_owned: sp.id, space_role: "container",  comps: [ { "a_string" : null} ] }});


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
*/
      $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });

  });
              $scope.cneedit = false;
      $timeout(function(){
        $scope.reloadResources();
        $scope.loadResources();
        $timeout(function () {
          // 0 ms delay to reload the page.
       $route.reload();
      }, 0);
      })              //$scope.reloadTree($scope.trees);
};
$scope.createSpaceElem = function (obj) {



    BPSpaceElemsFactory.create(obj).$promise.then(function(elem_data) {
      angular.element('.element-new-form').hide();

/*
      if (obj.type_title == "container_brick") {



        var space = {
            "bprocess": parseInt($route.current.params.BPid),
            "container": true,
            "subbrick": false,
            "brick_nested": elem_data.success,
            "nestingLevel": _.find($scope.spaces, function(sp){ return sp.id == obj.space_owned }).nestingLevel+1
        };
        $scope.indexSpaceGen(space);

        BPSpacesFactory.create(space).$promise.then(function(space_data) {
          BPSpacesFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {
                var old_sp = obj.space_own;
                var obj_to_update = obj;
                obj_to_update.space_own = space_data.success;
                obj_to_update.id = elem_data.success;
                BPSpaceElemFactory.update(obj_to_update).$promise.then(function(data) {
                  $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
                  obj = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: $scope.business(), space_owned: old_sp,  comps: [ { "a_string" : null} ] };
                });



               _.forEach(data, function(sp){
            sp.newSpaceelem = { desc:  "", bprocess: parseInt($route.current.params.BPid), business: $scope.business(), space_owned: sp.id, space_role: "container",  comps: [ { "a_string" : null} ] }});


                $scope.spaces = data;
                $scope.nestedSpaces = _.object(_.uniq(_.map($scope.spaces, function(v) {
                  return [v.brick_nested,
                           _.filter($scope.spaces, function(n){
                              return n.brick_nested == v.brick_nested;
                            })
                          ]})));


          });
        });
      }; */
        $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
        $scope.spaces = BPSpacesFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {
                       _.forEach(data, function(sp){ sp.newSpaceelem = { desc:  "",
                        process: parseInt($route.current.params.BPid),
                        business: $scope.business(),
                        space_owned: sp.id,
                        space_role: "container",
                        space_id: sp.id,
                        comps: [ { "a_string" : null} ] }});
        });


              $timeout(function(){
                $scope.reloadResources();
                $scope.loadResources();
                $timeout(function () {
                  // 0 ms delay to reload the page.
                $route.reload();
              }, 120);
              });

    });
              $scope.cneedit = false;

              //$scope.reloadTree($scope.trees);
};

$scope.updateSpaceElem = function (obj) {

    BPSpaceElemFactory.update(obj).$promise.then(function(data) {
      $timeout(function(){
        $scope.reloadResources();
        $scope.loadResources();
        $timeout(function () {
          // 0 ms delay to reload the page.
       $route.reload();
      }, 0);
    });
    });
};
$scope.deleteSpaceElem = function (obj) {
    BPSpaceElemFactory.delete({ id: obj.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
      $timeout(function(){
        $scope.reloadResources();
        $scope.loadResources();
        $timeout(function () {
          // 0 ms delay to reload the page.
       $route.reload();
      }, 0);
    });
    })
    //$scope.reloadTree($scope.trees);
};


$scope.type_short = $rootScope.type_short;


$scope.frontSpace = function (elem_id) { // : spaceObj
    var result = _.find($scope.spaces, function(space){ return space.brick_front == elem_id; });
    result;
  }
  $scope.BPid = parseInt($route.current.params.BPid);


/***
 * State

BPStatesFactory
BPStateFactory

BPSessionStatesFactory
BPSessionStateFactory
**/

/***
 * Reflections
 */


$scope.refs = RefsFactory.query();

$scope.refs.$promise.then(function(data) {
  $scope.refCategories = _.uniq(_.map(data, function(d){return d.ref.category}));
  $scope.newBpelem.refCategoryFilter = $scope.refCategories[0];
});


$scope.refElem = function (ref, elem) {
    elem.ref = ref.ref.id;
    elem.selectedRef = ref;
}
$scope.selectedRef = function(newBpelem) {
  var finded_ref = _.find($scope.refs, function(ref) { return newBpelem.ref == ref.ref.id });
  if (finded_ref != undefined) {
    return finded_ref.title
  } else {
    return ''
  }
}
$scope.isSelected = function(ref, newBpelem) {
    console.log("selected");
    if (newBpelem.selectedRef.ref.id == ref.ref.id) {
      return 'selected'
    }
    else {
      return 'unselected'
    }
}
$scope.nestedContainerRestriction = function(ref_elem) {
  if (ref_elem.ref.title != 'Container') {
    return ref_elem;
  } else {
    return false;
  }
}

$scope.stateDecoration = function(state) {
  if (state.on) {
    if (state.on_rate < 100) {
      return state.middle;
    }
    if (state.on_rate == 100) {
      return state.title;
    }
  }
  if (!state.on && $scope.inSession) {
    return state.neutral;
  }
  if (!state.on && !$scope.inSession) {
    return state.title;
  }
}
$scope.switcherDecor = {}
$scope.switcherDecorPromise = $rootScope.switcher_conf2.then(function(d) {
  if (d != undefined) {
    $scope.switcherDecor = d.switcher_desc;
  }
});
$scope.switcherDecoration = function(switcher) {
  var teta;
  if (switcher != undefined) {
    if ($scope.switcherDecor == {}) {
      $rootScope.switcher_conf2.then(function(d) {
        teta = d.switcher_desc.switcherDecor[switcher.switch_type];
      });
    } else {
    teta = $scope.switcherDecor[switcher.switch_type];
    }
    if (teta != undefined) {
      return switcher.switch_type;
    } else {
      return " — " + teta;
    }
  } else {
    return " ";
  }
}
$scope.stateOutAct = function (act) {
  if (act) {
    if (act.on == true) {
      return 'turn on';
    } else {
      return 'turn off';
    }
  } else { return ''; }
};
$scope.capitalizeFirstLetter = function (string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
};
$scope.stateByStateRef = function (state_ref) {
  var pos_state = _.find($scope.states, function(state) { return state.id == state_ref  });
  if (pos_state != undefined) {
    return pos_state.title;
  } else {
    return "";
  }
};
$scope.stateActiveClass = function(state) {
                  //<div class="neutral">{{ state.neutral }}</div>
                  //<div class="middleable">{{ state.middle }}</div>
                  //<div class="oposite">{{ state.oposite }}</div>
                  //<div class="ended">{{ state.title }}</div>
/*
  if (state != undefined) {
  if (state.on) {
    if (state.on_rate < 100) { return "yell";}
    if (state.on_rate == 100) {return "green";}
  }
  if (!state.on && $scope.inSession) {return "red";}
  if (!state.on && !$scope.inSession) {return "";}
  }
*/
  var prefx = "on-";
  if (state != undefined) {
      if (!state.on && state.on_rate == 0) {
        return prefx + "neutral";
      }
      if (state.on) {
        if (state.on_rate < 100) {
          return prefx + "middleable";
        }
        if (state.on_rate == 100) {
          return prefx + "ended";
        }

      }
      if (!state.on) {
        if (state.on_rate < 0) {
           return prefx + "oposite";
        }
      }


  }
}
$scope.stateClass = function(state) {
  if (state != undefined) {
  if (state.on) {
    if (state.on_rate < 100) { return "yell";}
    if (state.on_rate == 100) {return "green";}
  }
  if (!state.on && $scope.inSession) {return "red";}
  if (!state.on && !$scope.inSession) {return "";}
  }
}

$scope.masterState = function(element) {
  if (element != undefined && element.states != undefined && element.states.length > 0) {
    return element.states[0];
  } // TODO: Made master state
}

$scope.isSelected = function (session_id) {
  if ($location.search().launch != undefined && $location.search().launch == session_id) {
    return 'selected'
  } else {
    return
  }
}

/***
 * Session observer
 **/

BPSessionsFactory.query({ BPid: $scope.BPid }).$promise.then(function(data){
  $scope.sessions = data.sessions;


   BPStationsFactory.query({ BPid: $scope.BPid }).$promise.then(function(stations) {
  _.forEach(data, function(d){ return d.stations = _.filter(stations, function(s){ return s.session == d.id }) });
  })
   // Change to session that signed in route params
   if ($location.search().launch != undefined) {
    var ses  = _.find($scope.sessions, function(ses) { return ses.session.id == parseInt($location.search().launch) });
      if (ses) {
        $scope.changeSession(ses);
      }
   } else {
      /***
       *  Load entry point
       ***/
      $scope.loadResources();
   }
  });

$scope.reactions =  ReactionsFactory.query({ BPid: $scope.BPid });
$scope.element_topologs = ElementTopologsFactory.query({ BPid: $scope.BPid });

$scope.loadPerm = function () {
ProcPermissionsFactory.peoples().$promise.then(function(q) {
    console.log('peoples');
    console.log(q);
  EmployeesFactory.query().$promise.then( function(data) {
    $scope.employees = data.emps;
    $scope.creds = data.creds;
  });
});
ProcPermissionsFactory.query({ BPid: $scope.BPid }).$promise.then(function(qu){
    $scope.perms = qu.elemperms;

    $scope.accounts = qu.accounts;
    $scope.emps = qu.employees;
    $scope.employee_groups = qu.employee_groups;
    _.forEach($scope.employee_groups, function(gr){ return gr.group = true; });
    $scope.groups = qu.employee_groups;
    $scope.employees_groups = _.union($scope.emps,$scope.employee_groups);
    _.forEach($scope.perms, function(perm) {
      if (perm.group != undefined) {
        var group = _.find($scope.groups, function(group) {return group.id == perm.group});
        if (group != undefined) {
          perm.title = group.title;
        } else {
          perm.title = "";
        }
      }
    })
});
}
$scope.loadPerm();

$scope.credFetch = function (obj) {
  if (obj.uid != undefined) { // it's employee

  var res = _.find($scope.creds, function(cr){ return cr.userId == obj.uid});
  if (res != undefined) {
    return res.fullName + " " + obj.uid;
  } else if (res == undefined) {
    return "Anonymous " + obj.uid;
  }
  } else { // it's group
    //var res = _.find($scope.groups, function(gr) { return gr.id == obj.id });
    //if (res != undefined) {
      return "Group " + obj.title;
    //}
  }
};
$scope.accFetch = function (obj) {
  if (obj.uid != undefined) { // it's employee

  var res = _.find($scope.accounts, function(cr){ return cr.userId == obj.uid});
  console.log(res);
  if (res != undefined) { // it's account
                          // anonumous checking
    res.fullName != undefined ? res.tooltip = res.fullName : res.tooltip = res.email;
    if (res.avatarUrl == undefined || res.avatarUrl == "") {
      res.avatarUrl = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iRWJlbmVfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjx0aXRsZT5EZWZhdWx0IEF2YXRhcjwvdGl0bGU+PGRlc2M+RGVmYXVsdCBBdmF0YXIgZm9yIFdDRiAyLjA8L2Rlc2M+IDxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbLnN1cmZhY2UgeyBmaWxsOiAjZmZmOyB9LnNoYWRvdyB7IGZpbGw6ICNiYmI7IH1dXT48L3N0eWxlPjwvZGVmcz48cmVjdCB4PSIwIiBjbGFzcz0ic2hhZG93IiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiLz48cGF0aCBjbGFzcz0ic3VyZmFjZSIgZD0iTTMuNTI4LDE2QzMuNzc2LDExLjQ5OSw1LjY4NCw4LDgsOHM0LjIyNCwzLjQ5OSw0LjQ3Myw3Ljk5OCIvPjxjaXJjbGUgY2xhc3M9InN1cmZhY2UiIGN4PSI4IiBjeT0iNiIgcj0iMy41Ii8+PC9zdmc+'
    }     
    return res;
  } else if (res == undefined) {
    if (res.avatarUrl == undefined || res.avatarUrl == "") {
      res.avatarUrl = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iRWJlbmVfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjx0aXRsZT5EZWZhdWx0IEF2YXRhcjwvdGl0bGU+PGRlc2M+RGVmYXVsdCBBdmF0YXIgZm9yIFdDRiAyLjA8L2Rlc2M+IDxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbLnN1cmZhY2UgeyBmaWxsOiAjZmZmOyB9LnNoYWRvdyB7IGZpbGw6ICNiYmI7IH1dXT48L3N0eWxlPjwvZGVmcz48cmVjdCB4PSIwIiBjbGFzcz0ic2hhZG93IiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiLz48cGF0aCBjbGFzcz0ic3VyZmFjZSIgZD0iTTMuNTI4LDE2QzMuNzc2LDExLjQ5OSw1LjY4NCw4LDgsOHM0LjIyNCwzLjQ5OSw0LjQ3Myw3Ljk5OCIvPjxjaXJjbGUgY2xhc3M9InN1cmZhY2UiIGN4PSI4IiBjeT0iNiIgcj0iMy41Ii8+PC9zdmc+'
    }     
    return "Anonymous " + obj.uid;
  }
  } else { // it's group
    var res = _.find($scope.groups, function(gr) { return gr.id == obj.id });
    if (res != undefined) {
      res.avatarUrl = '/assets/images/group.png'
      res.tooltip = "Group " + res.title;
      return res;
    } else { return }
  }
};
$scope.createPermForForm = function (perm, perms, position) {
  perms.push(perm);
}
$scope.delPermForForm = function (perm,perms) {
  var ind = perms.indexOf(perm);
  perms.splice(ind, 1);
}
$scope.createElementResource = function(cost, costs) {
    costs.push(cost);
}
$scope.delElementResource = function(cost, costs) {
  var ind = costs.indexOf(cost);
  costs.splice(ind, 1);
}

$scope.turnMinimal = function() {
   angular.element(document).ready(function () {
      $('.proc-element').each(function () {
              $(this).addClass('minimal');
        });
    });
    
}
$scope.turnMinimal();

$scope.changeSession = function(session) {

 $scope.session = session;
 $location.search('launch', $scope.session.session.id);
 $scope.inSession = true;
 $scope.station = $scope.session.station;//_.find(session.station, function(s) { return s.front == true })
 $scope.session_bar = 'hiding';

 $scope.interactions = InteractionsFactory.query({session_id: $scope.session.session.id});


 $scope.input_logs = BPInLoggersSessionFactory.query({BPid: $route.current.params.BPid, station_id: $scope.session.id});
 //.$promise.then(function(reaction_array) {

 if ($scope.station != undefined && $scope.station.inspace == false) {
   if ($scope.bpelems[$scope.station.step] !== undefined) {
    var elem = $scope.bpelems[$scope.station.step].id
   } else {  // MAKE SAFE FOR LAST ELEMENT
    var elem = $scope.bpelems[$scope.station.step].id
   }
   var top = $('.elem-'+elem).offset().top;
   console.log("top traverse marker" + top);

   $('.traverse-marker').css('top', top-35 + 'px')
 }
 if ($scope.station != undefined && $scope.station.inspace == true) {
  var spelem = $scope.bpelems[$scope.station.step].id
  var top = $('.spelem-24').offset().top

 }
  $scope.reloadResourcesForSession(session.session);

  $scope.builder();
  $scope.bprocess = {}
  $scope.bprocess.trees = $scope.trees;
}
/***
 * Default app state
 ***/
$scope.inSession = false;


$scope.resetSession = function () {
  $scope.session = undefined;
  $location.search('launch', null);
  $scope.inSession = false;
 //$scope.session_bar = 'shown';

  $scope.station = undefined;
  $scope.loadResources();
  $scope.reloadResources();
  $('.traverse-marker').css('top', '-23px')

}





$scope.unlisted = function (session) {
  $http({
      url: '/session/' + session.session.id + '/unlisted',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        //$scope.stationsRefresh(); // Not for session controller
        //$scope.loadSessions();
        $route.reload();
        //$scope.invoke_res = [response];
      },
      function(response) { // optional
        // failed
      }
      );
}








}]);




minorityControllers.controller('BPelementCreationCtrl', ['$scope', 'BPElemsFactory','BPElemFactory', '$location', '$route',
   function ($scope, BPElemsFactory, BPElemFactory, $location, $route) {
    $scope.createNewBPElem = function () {
      BPElemsFactory.create($scope.bpelem);
      $location.path('/bprocesses');
    }
}]);


});
