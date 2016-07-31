define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

/**
 * launchedProcElementController
 */
// INDEX
minorityControllers.controller('launchedProcElementController', ['$timeout','$window','$filter', '$rootScope', '$scope', '$q', '$http', '$routeParams',
  'toaster', 'BPInLoggersSessionFactory', 'DataCostAssign',
'DataCostLaunchAssign','BProcessFactory',
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
  function ($timeout, $window, $filter, $rootScope, $scope, $q,$http, $routeParams, toaster, BPInLoggersSessionFactory, DataCostAssign, DataCostLaunchAssign, BProcessFactory, BPStationsFactory,EmployeesFactory, ProcPermissionsFactory, PermissionsFactory, BProcessesFactory, ngDialog, BPElemsFactory, BPElemFactory, BPSessionsFactory, BPStationsFactory, BPSpacesFactory, BPSpaceFactory, BPSpaceElemsFactory, BPSpaceElemFactory, BPStatesFactory, BPStateFactory, BPSessionStatesFactory, BPSessionStateFactory,RefsFactory, SwitchesFactory,SwitchFactory,DataCostCollection,  LaunchSwitchersFactory, LaunchElemsFactory,LaunchSpacesFactory,LaunchSpaceElemsFactory,LaunchElementTopologsFactory, LaunchReactionsFactory,ReactionsFactory,ReactionFactory,ElementTopologsFactory, InteractionsFactory, $location, $route, $animate) {

  if ($route.current.params.BPid !== undefined) {
    $scope.BPid = $route.current.params.BPid
  } else {
    $scope.BPid = $scope.$parent.bprocess.id;
  }


  $scope.route = jsRoutes.controllers.BusinessProcessController;
  $scope.businessSet = $rootScope.business;

  $scope.bb_ping = $rootScope.bb_ping;

  $scope.business = function () {
     return parseInt($window.localStorage.getItem('business'));

  }
  /************************************************************************
   ** Cost module
 ***************************************  */
  // /data/cost/assign/:resource_id
  $scope.pushAsssignedResEl = function() {
    $http.post(jsRoutes.controllers.BusinessProcessController, data).success(function(success) {
        $location.path('/bprocesses');
    }).error(function (error) {
      toaster.pop('error', "Operation fail", "Please try something else");
    });
  }
$scope.elementsLoaded = false;
$rootScope.$on('cfpLoadingBar:completed', function(d){
  $scope.elementsLoaded = true;
});
$rootScope.$on('cfpLoadingBar:loading', function(d){
  $scope.elementsLoaded = false;
});


// /data/cost/up_assign/:resource_id
//$scope.updateAsssignedResEl = function() {
//}
// POST  /data/cost/assign/:resource_id
$scope.token = $window.sessionStorage.getItem('token');
$scope.createAssignedResEl = function(cost) {
  // (elementId: Int, resourceId: Int, entityId: String = "*")
  console.log(cost);
  var req = {elementId: cost.element, resourceId: cost.resource.resource.id, entityId: cost.entities};
  $http.post(jsRoutes.controllers.CostFillController.createCostElement(cost.resource.resource.id).absoluteURL(document.ssl_enabled),
                    [req]).then(function (data) {
                      console.log(data);
  });
};
$scope.createAssignedResEls = function(costs, elementId) {
  // (elementId: Int, resourceId: Int, entityId: String = "*")
  console.log(costs);

  var reqs = _.map(costs, function(cost) { return  {elementId: elementId, resourceId: cost.resource.resource.id,
                                                    entityId: cost.entities}; })
  $http.post(jsRoutes.controllers.CostFillController.createCostElement(0).absoluteURL(document.ssl_enabled),
                    reqs ).then(function (data) {
                      console.log(data);
  });
};

// POST /data/cost/del_assign/:resource_id
$scope.deleteAsssignedResEl = function(cost) {
  //$('/data/cost/del_assign/:resource_id')
  console.log(cost);
  $http.post(jsRoutes.controllers.CostFillController.delete_assigned_element(cost.id).absoluteURL(document.ssl_enabled), {
                    headers:  {'X-Auth-Token': $scope.token, 'Access_Name': 'user'}}).then(function (data) {
                      console.log(data);
  });
}
$scope.entityDecorator = function(entities, resource) {
  if (entities == "*") {
    return "*"
  } else {
    if (entities != "*") {
      var c = _.find(resource.entities, function(ent){return ent.id == entities});
      if (c != undefined) {
        return c.title
      } else { return "" }

    } else {
      return "";
    }

  }
}
/* Slat
  title: String,
  boardId: UUID,
  entityId: UUID,
  sval: String,
  publisher: String,
  meta: String,
*/
$scope.slatFilter = function(entity, slats) {
  return _.filter(slats, function(slat){return slat.entityId == entity.id });
}
$scope.defaultValueParser = function(entity, value) {
  if (entity.etype == "number") {
    return parseInt(value);
  } else {
    return value;
  }
}
$scope.fillValue = function(cost, entity, value) {
  console.log(cost);
  // entityId: String, launchId: Int, resourceId: Int
  var resourceId = cost.resource.resource.id;
  var launchId = $scope.session.session.id;
  var entityId = entity.id;
  var boardId = entity.boardId;

  var req = {title: entity.title, boardId: boardId, entityId: entityId, meta: [], sval: value, publisher: ''};
  $http.post(jsRoutes.controllers.DataController.fill_slat(entityId, launchId, resourceId).absoluteURL(document.ssl_enabled),
                    req).then(function (data) {
                      console.log(data);
  });
}
$scope.removeEntity = function(entity, store) {
  console.log(entity);
  $http.post(jsRoutes.controllers.CostFillController.removeEntityById(entity.id).absoluteURL(document.ssl_enabled),
  []).then(function (data) {
      console.log(data);
      $scope.loadCosts();
  });
}
$scope.reFillValue = function(cost, entity, slat) {
  console.log(cost);
  // entityId: String, launchId: Int, resourceId: Int
  var resourceId = cost.resource.resource.id;
  var launchId = $scope.session.session.id;
  var entityId = entity.id;
  var boardId = entity.boardId;

  var req = {title: entity.title, boardId: boardId, entityId: entityId, meta: [], sval: slat.sval, publisher: ''};
  $http.post(jsRoutes.controllers.DataController.refill_slat(entityId, launchId, resourceId, slat.id).absoluteURL(document.ssl_enabled),
                    req).then(function (data) {
                      console.log(data);
  });
}
/**************
 * ////END Cost module
 *****************/////////////////////////////////////////////////////*/


















/****
 *  Mionority Action Middleware
 **/
  $scope.vm = this; // vm stands for "View Model" --> see https://github.com/johnpapa/angular-styleguide#controlleras-with-vm
  //$scope.newBpelem.middleware = {};

  $scope.vm.userFields = [
    {
      // the key to be used in the model values
      // so this will be bound to vm.user.username
      key: 'username',
      type: 'input',
      templateOptions: {
        label: 'Username',
        placeholder: 'johndoe',
        required: true,
        description: 'Descriptive text'
      }
    },
    {
      key: 'password',
      type: 'input',
      templateOptions: {
        type: 'password',
        label: 'Password',
        required: true
      },
      expressionProperties: {
        'templateOptions.disabled': '!model.username' // disabled when username is blank
      }
    }
  ];

  $scope.vm.onSubmit = onSubmit;


  function onSubmit() {
    console.log('form submitted:', $scope.newBpelem);
  }











/***************
 *  RequestController data
 */
$scope.bboardDataPromises = [];
$scope.bboardTriggers = [];

$scope.bboardTriggers = [];
$scope.pushBboardTRigger = function(launchId, triggerFn, ident) {
  console.log('add trigger', ident + ' ' + launchId);
  $scope.bboardTriggers.push({ launchId: launchId, triggerFn: triggerFn, ident: ident });
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



  $scope.bpelems = BPElemsFactory.query({ BPid: $scope.BPid });
  $scope.states = BPStatesFactory.query({ BPid: $scope.BPid });
  $scope.switches = SwitchesFactory.query({ BPid: $scope.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.BPid });
  $scope.spaces.$promise.then(function(sps) {
    _.forEach(sps, function(sp){ sp.newSpaceelem = { space_id: sp.id, desc:  "", process: parseInt($scope.BPid), business: $scope.business(), space_role: "container",  comps: [ { "a_string" : null} ] }
});
  });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $scope.BPid });

  BProcessesFactory.query().$promise.then(function(data) {


    BPStationsFactory.query({ BPid: $scope.BPid }).$promise.then(function(stations) {

    $scope.bp = _.find(data, function(proc) { return proc.id == $scope.BPid});

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
  console.log('reloadResources');
$scope.bpelems = BPElemsFactory.query({ BPid: $scope.BPid });
$scope.spaces =  BPSpacesFactory.query({ BPid: $scope.BPid });
$scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $scope.BPid });
       $scope.states = BPStatesFactory.query({ BPid: $scope.BPid });
       $scope.switches = SwitchesFactory.query({ BPid: $scope.BPid });
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


      /* cost */
  var fetchObj = function(objects) {
    if (objects != undefined) {
      return _.forEach(objects, function(obj) { return obj.obj })
    } else { return undefined }
  };
  // Fetch resource and entities for that resource
  /*
  DataCostCollection.query().$promise.then(function(res) {
      $scope.resources = res;
      _.forEach($scope.resources, function(r){ r.entities.unshift({title: "All", id:"*"}) });

    DataCostAssign.query( { BPid: $scope.BPid } ).$promise.then(function(cost) {
      $scope.processCosts = cost;

      _.forEach($scope.bpelems, function(z)    { z.costs = _.filter($scope.processCosts, function(cost) {
          cost.resource = _.find($scope.resources, function(res){return res.resource == cost.obj.resource_id });
          return $scope.topoIdChecker(z.topo_id) == cost.obj.element_id;
      });  return fetchObj(z.costs); });
      _.forEach($scope.spaceelems, function(z) { z.costs = _.filter($scope.processCosts, function(cost) {
          cost.resource = _.find($scope.resources, function(res){return res.resource == cost.obj.resource_id });
          return $scope.topoIdChecker(z.topo_id) == cost.obj.element_id;
      });  return fetchObj(z.costs); });

    });   });
    */
    /********************/

 });
 });
 });
});
});
});
 });
}
$scope.metaExisted = function(meta, key) {
    return _.filter(meta, function(meta) {
          return (meta.key == key && meta.value.length < 1)
        }).length < 1;
}
$scope.files = [];
$scope.payload = [];
$scope.payload_result = [];
$scope.onPickedFirstInput = function(first_input, docs) {
    angular.forEach(docs, function (file, index) {
    $scope.files.push(file);
  });
  var data = _.map($scope.files, function(el) {
      return { obj_type: "file", obj_content: el.embedUrl, obj_title: el.name };
  })
   $scope.files = [];
   $scope.payload = $scope.payload.concat(data);
   $scope.sendPayload($scope.session_id, "", _.filter($scope.payload, function(el){return el.obj_content != "";}));
   $scope.sendWarpResult();
   $scope.payload_result = [];
}
$scope.sendWarpResult = function() {
     $http({
      url: '/warp/send',
      method: "POST",
      data: $scope.payload_result.data.message,
      })
      .then(function(response) {
        // success
        $scope.loadCosts();
        console.log(response);
      },
      function(response) { // optional
        // failed
        console.log(response);
      }
      );

}
$scope.sendPayload = function(launch_id, element_id, existedPayload) {
     if (existedPayload != undefined) {
      var payload = existedPayload;
     $http({
      url: '/warp?launch_id=' + launch_id +'&element_id='+element_id,
      method: "POST",
      data: { payload: payload },
      })
      .then(function(response) {
        // success
        $scope.payload_result = response;//console.log(response);
        //$scope.bpstations = BPStationsFactory.query({ BPid: $scope.bpId });
      },
      function(response) { // optional
        // failed
        $scope.payload_result = response;//console.log(response);
      }
      );
     } else {
       var payload = $scope.payload;
     }
}


$scope.reloadResourcesForSession = function(session) {
   console.log('reloadResourcesForSession');
   $scope.states = BPSessionStatesFactory.query({ BPid: $scope.BPid, id: session.id });
   $scope.switches = LaunchSwitchersFactory.query({ launch_id: session.id });

   $scope.bpelems = LaunchElemsFactory.query({ launch_id: session.id });
   $scope.spaces = LaunchSpacesFactory.query({ launch_id: session.id });
   $scope.spaceelems = LaunchSpaceElemsFactory.query({ launch_id: session.id });

   $scope.element_topologs = LaunchElementTopologsFactory.query({ launch_id: session.id });
   $scope.reactions = LaunchReactionsFactory.query({ launch_id: session.id });

   $scope.states.$promise.then(function (states) {
      $scope.switches.$promise.then(function(switches) {
        $scope.switches = switches;
        $scope.element_topologs.$promise.then(function(topos) {
            $scope.element_topologs = topos;

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
                console.log("check launched space elem");
               return spelem.space_owned == sp.id;
           })
        });

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
    //}*/

  });


    // Fetch resource and entities for that resource
$scope.loadCosts = function() {
  DataCostCollection.query().$promise.then(function(res) {

      $scope.resources = res;
      _.forEach($scope.resources, function(r){ r.entities.unshift({title: "All", id:"*"}) });

    DataCostLaunchAssign.query( { launchId: session.id } ).$promise.then(function(data) {
      $scope.processCosts = data.costs;
      $scope.warpData = { boards: _.filter(data.warp.boards,
        function(obj){ return  $scope.metaExisted(obj.meta, "element_id");
      }),
      entities: _.filter(data.warp.entities,
        function(obj){ return  $scope.metaExisted(obj.meta, "element_id");
      }),
      slats: _.filter(data.warp.slats,
        function(obj){ return  $scope.metaExisted(obj.meta, "element_id");
      })
     }


      /* cost */
      var fetchObj = function(objects) {
      if (objects != undefined) {
      return _.forEach(objects, function(obj) { return obj.obj })
      } else { return undefined }
      };

      _.forEach($scope.bpelems, function(z)    { z.costs = _.filter($scope.processCosts, function(cost) {
          cost.resource = _.find($scope.resources, function(res){return res.resource.id == cost.obj.resource_id });
          return $scope.topoIdChecker(z.topo_id) == cost.obj.element_id;
      });  return fetchObj(z.costs) });
      _.forEach($scope.spaceelems, function(z) { z.costs = _.filter($scope.processCosts, function(cost) {
          cost.resource = _.find($scope.resources, function(res){return res.resource.id == cost.obj.resource_id });
          return $scope.topoIdChecker(z.topo_id) == cost.obj.element_id;
      });  return fetchObj(z.costs) });

    });
});
}
$scope.loadCosts();
    /********************/





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
 });

}
$scope.topoIdChecker = function(topo_id) {
  if (topo_id != undefined) {
    if (topo_id.topo_id != undefined) {
      return topo_id.topo_id;
    }
    else {
      return undefined;
    }
  } else { return undefined; }
}

$scope.loadResources = function() {
  console.log('loadResources');
  BPElemsFactory.query({ BPid: $scope.BPid }).$promise.then(function(data) {
  BPSpacesFactory.query({ BPid: $scope.BPid }).$promise.then(function(data2) {
  BPSpaceElemsFactory.query({ BPid: $scope.BPid }).$promise.then(function(data3) {
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


      /* cost */
  var fetchObj = function(objects) {
    if (objects != undefined) {
      return _.forEach(objects, function(obj) { return obj.obj })
    } else { return undefined }
  };
  // Fetch resource and entities for that resource
  DataCostCollection.query().$promise.then(function(res) {
      $scope.resources = res;
      _.forEach($scope.resources, function(r){ r.entities.unshift({title: "All", id:"*"}) });

    DataCostAssign.query( { BPid: $scope.BPid } ).$promise.then(function(cost) {
      $scope.processCosts = cost;

      _.forEach($scope.bpelems, function(z)    { z.costs = _.filter($scope.processCosts, function(cost) {
          cost.resource = _.find($scope.resources, function(res){return res.resource.id == cost.obj.resource_id });
          return $scope.topoIdChecker(z.topo_id) == cost.obj.element_id;
      });  return fetchObj(z.costs) });
      _.forEach($scope.spaceelems, function(z) { z.costs = _.filter($scope.processCosts, function(cost) {
          cost.resource = _.find($scope.resources, function(res){return res.resource.id == cost.obj.resource_id });
          return $scope.topoIdChecker(z.topo_id) == cost.obj.element_id;
      });  return fetchObj(z.costs) });

    });   });
    /********************/

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
  var z = BPElemsFactory.query({ BPid: $scope.BPid });
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
   space.newSpaceelem = { desc:  "", process: parseInt($scope.BPid), space_id: space.id, business: $scope.business(),  comps: [ { "a_string" : null} ] };
   form = { desc:  "", process: parseInt($scope.BPid), business: $scope.business(),  comps: [ { "a_string" : null} ] };
   $scope.cneedit = false;
  }



  /*
   Elements template
  */
  $scope.newSpace = { process: parseInt($scope.BPid), nestingLevel: 1, container:false,subbrick:false }
  $scope.newBpelem = { middleware: {}, desc: "", process: parseInt($scope.BPid), business: $scope.business(), comps: [ { "a_string" : null} ] }
  $scope.newSpaceelem = { desc:  "", process: parseInt($scope.BPid), business: $scope.business(), space_role: "container",  comps: [ { "a_string" : null} ] }



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
      url: 'bprocess/' + parseInt($scope.BPid) + '/element/' + obj.id + '/up',
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

      url: 'bprocess/' + parseInt($scope.BPid) + '/element/' + obj.id + '/down',
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


  $scope.newBpelem.tab = 0;

  $scope.setTab = function(newTab, newBpelem){
    newBpelem.tab = newTab;
  };

  $scope.isSet = function(tabNum, newBpelem){
    return newBpelem.tab === tabNum;
  };


  $scope.updateElem = function (obj) {
    BPElemFactory.update(obj).$promise.then(function(data) {
      $scope.createAssignedResEls(obj.newCosts, obj.topo_id.topo_id);
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

  $scope.safeParseInt = function(v) {
    if (isNaN(parseInt(v))) {
      return -1;
    } else {
      return parseInt(v);
    }
  }

$scope.createNewElem = function (el, process, callback) {
  console.log('createNewElem', process);

    var actionContainer = _.map($scope.newBpelem.selectedRef.reactions, function(action) {
      if (action.refStrategySelect) {
          /*
          action_id: Int,
          middleware_id: Long,
          strategy_id: Long,
          bases: List[BaseContainer] = List()

          bases:
          base_id: Long,
          base_req_type: String = "string",
          base_content_string: String = "",
          base_content_number: Long = 0L,
          base_content_boolean: Boolean
          */
          // Action
          // Action 1 -> 1 Middleware
          // Middleware 1 -> 1 Strategy
          // Strategy 1 -> many Bases
          console.log('action.selectedStrategy', action.selectedStrategy);
        return {
          action_id: action.id,
          middleware_id: action.refStrategySelect.middleware.id,
          strategy_id: action.refStrategySelect.strategy.id,
          bases: _.map(action.refStrategySelect.bases, function(base){
            return {
              base_id: base.id,
              base_req_type: base.selectedStrategy['field_type'],
              base_content_string: base.selectedStrategy[base.key].toString(),
              base_content_number: $scope.safeParseInt( base.selectedStrategy[base.key] ),
              base_content_boolean: false
            }
          })
          }
        }
    });

    var newElement = {
      business: $scope.newBpelem.business,
      comps: [],
      desc: $scope.newBpelem.desc,
      order: $scope.newBpelem.order,
      process: $scope.newBpelem.process,
      ref: $scope.newBpelem.ref,
      title: $scope.newBpelem.title,
    }
    if (_.without(actionContainer, undefined, null).length > 0 )  {
          newElement.refActionContainer = actionContainer;
    } else { newElement.refActionContainer = []; } // Backward compatibility with elements without middlewares

    console.log('newElement is', newElement);

    BPElemsFactory.create(newElement).$promise.then(function(data) {

    console.log(data);
    //angular.element('.element-new-form').hide();
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
    }); // Perm added

    // Add resource assigment
      $scope.createAssignedResEls($scope.newBpelem.costs, data.success.topoElem[0]);
    // Resource assigment added



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

      //$scope.bpelems = BPElemsFactory.query({ BPid: $scope.BPid });
      console.log("lighted");
      $scope.trees = undefined;
      //$scope.reloadTree($scope.trees);

      $scope.reloadResources();
      $scope.loadResources();

  
  process.fastElForm == true ? process.fastElForm=false : process.fastElForm=true;
  if (process.fastElForm == undefined) {
    process.fastElForm = true;
  }
  if (callback !== undefined) {
    callback(process)
  }

      $scope.setPristineForNewElem();
      $scope.newBpelem = { middleware: {}, desc: "", process: parseInt($scope.BPid), business: $scope.business() };
      $scope.setTab(0, $scope.newBpelem);
      $scope.setPristineForNewElem();

      $timeout(function(){
        $timeout(function () {
          // 0 ms delay to reload the page.
          $scope.setPristineForNewElem();

      //    $route.reload();
      }, 0);
      }, 2000);


    });

};

$scope.setPristineForNewElem = function() {
  var elem = angular.element('.form-new-bpelem').controller('form');
  var elem2 = angular.element('.form-fast-element-create').controller('form');
  if (elem) {
    elem.$setPristine();
  }
  if (elem2) {
   elem2.$setPristine(); 
  }
};

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
          pms.push(BPSpaceFactory.delete({ id: sid, BPid: $scope.BPid }).$promise);
        });

        angular.forEach(spElms, function(sid) {
          pms.push(BPSpaceElemFactory.delete({ id: sid, BPid: $scope.BPid }).$promise);
        });


      }); //$scope.nestedIterator([_.findDeep($scope.trees, {'id': obj.id})]);


      //var z = _.map(spsIds, function(sid) { BPSpaceFactory.delete({ id: sid.id, BPid: $scope.BPid }) });
      //var zz = _.map(spElms, function(sid) { BPSpaceElemFactory.delete({ id: sid.id, BPid: $scope.BPid })  });

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
          pms.push(BPSpaceFactory.delete({ id: sid, BPid: $scope.BPid }).$promise);
        });

        angular.forEach(spElms, function(sid) {
          pms.push(BPSpaceElemFactory.delete({ id: sid, BPid: $scope.BPid }).$promise);
        });
         //$scope.reloadTree($scope.trees);
     });

      //var z = _.map(spsIds, function(sid) { BPSpaceFactory.delete({ id: sid.id, BPid: $scope.BPid }) });
      //var zz = _.map(spElms, function(sid) { BPSpaceElemFactory.delete({ id: sid.id, BPid: $scope.BPid })  });

    //deferred.resolve(zz);
  return $q.all(pms);
  //return deferred.promise;

  };
  $scope.deleteElem = function (obj) {
    BPElemFactory.delete({ id: obj.id, BPid: $scope.BPid }).$promise.then(function(data) {
       /* Element with spaces */
      $scope.bpelems = BPElemsFactory.query({ BPid: $scope.BPid });
      if (obj.type_title == "container_brick11") {

        filteringNested(obj).then(function(data) {


            $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.BPid });
            $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $scope.BPid });
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

      $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.BPid });
    });
  }
  $scope.deleteSpace = function (obj) {
    BPSpaceFactory.delete({ id: obj.id, BPid: $scope.BPid }).$promise.then(function(data) {
      $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.BPid });
    });
  };





  /* Space Elem CUD */
  $scope.moveUpSpaceElem = function (obj) {
    $http({
      url: 'bprocess/' + parseInt($scope.BPid) + '/space_elem/' + obj.id + '/' + obj.space_owned + '/up',
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
      url: 'bprocess/' + parseInt($scope.BPid) + '/space_elem/' + obj.id + '/' + obj.space_owned + '/down',
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
/****
 * From nested level > 1
 * Space of space
 */
$scope.createSpaceElemFromSpace = function (obj) {
  BPSpaceElemsFactory.create(obj).$promise.then(function(elem_data) {
    //angular.element('.element-new-form').hide();

/*
    if (obj.type_title == "container_brick") {



      var space = {
          "bprocess": parseInt($scope.BPid),
          "container": true,
          "subbrick": false,
          "brick_nested": elem_data.success,
          "nestingLevel": _.find($scope.spaces, function(sp){ return sp.id == obj.space_owned }).nestingLevel+1
      };
      $scope.indexSpaceGen(space);

      BPSpacesFactory.create(space).$promise.then(function(space_data) {
        BPSpacesFactory.query({ BPid: $scope.BPid }).$promise.then(function(data) {

              obj.space_own = space_data.success;
              obj.id = elem_data.success;
              BPSpaceElemFactory.update(obj).$promise.then(function(data) {
                $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $scope.BPid });
                obj = { desc:  "", bprocess: parseInt($scope.BPid), business: $scope.business(),  comps: [ { "a_string" : null} ] };
              });
               _.forEach(data, function(sp){ sp.newSpaceelem = { desc:  "", bprocess: parseInt($scope.BPid), business: $scope.business(), space_owned: sp.id, space_role: "container",  comps: [ { "a_string" : null} ] }});


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
*/                  $scope.cneedit = false;

      $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $scope.BPid }).$promise.then(function(d){
        //              $scope.cneedit = false;
              $timeout(function(){
                //$scope.reloadResources();
                //$scope.loadResources();
                $timeout(function () {
                  // 0 ms delay to reload the page.
               $route.reload();
              }, 0);
              });              //$scope.reloadTree($scope.trees);
      });

  });
};
$scope.createSpaceElem = function (obj, space) {

    space.cneedit = false;

    BPSpaceElemsFactory.create(obj).$promise.then(function(elem_data) {
      //angular.element('.element-new-form').hide();

/*
      if (obj.type_title == "container_brick") {



        var space = {
            "bprocess": parseInt($scope.BPid),
            "container": true,
            "subbrick": false,
            "brick_nested": elem_data.success,
            "nestingLevel": _.find($scope.spaces, function(sp){ return sp.id == obj.space_owned }).nestingLevel+1
        };
        $scope.indexSpaceGen(space);

        BPSpacesFactory.create(space).$promise.then(function(space_data) {
          BPSpacesFactory.query({ BPid: $scope.BPid }).$promise.then(function(data) {
                var old_sp = obj.space_own;
                var obj_to_update = obj;
                obj_to_update.space_own = space_data.success;
                obj_to_update.id = elem_data.success;
                BPSpaceElemFactory.update(obj_to_update).$promise.then(function(data) {
                  $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $scope.BPid });
                  obj = { desc:  "", bprocess: parseInt($scope.BPid), business: $scope.business(), space_owned: old_sp,  comps: [ { "a_string" : null} ] };
                });



               _.forEach(data, function(sp){
            sp.newSpaceelem = { desc:  "", bprocess: parseInt($scope.BPid), business: $scope.business(), space_owned: sp.id, space_role: "container",  comps: [ { "a_string" : null} ] }});


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
        $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $scope.BPid });
        $scope.spaces = BPSpacesFactory.query({ BPid: $scope.BPid }).$promise.then(function(data) {
                       _.forEach(data, function(sp){ sp.cneedit = false;sp.newSpaceelem = { desc:  "",
                        process: parseInt($scope.BPid),
                        business: $scope.business(),
                        space_owned: sp.id,
                        space_role: "container",
                        space_id: sp.id,
                        comps: [ { "a_string" : null} ] }});
        });


              $timeout(function(){
                //$scope.reloadResources();
                //$scope.loadResources();
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
    BPSpaceElemFactory.delete({ id: obj.id, BPid: $scope.BPid }).$promise.then(function(data) {
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
  $scope.BPid = parseInt($scope.BPid);


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
    // AUTO SELECT FIRST STRATEGY
    console.log('elem.ref', elem.ref);    
    if (ref.strategies !== undefined && ref.middlewares !== undefined &&
        ref.middlewares.length > 0 && ref.strategies.length > 0) {
      var middlewareToSelect = ref.middlewares[0]; 
      var actionToSelect = _.find(ref.reactions, function(ac) {return ac.id == middlewareToSelect.reaction});
      console.log('middlewareToSelect', middlewareToSelect);
      if (actionToSelect !== undefined) {
        console.log('actionToSelect', actionToSelect);
        var strategyToSelect = ref.strategies[0];
        $scope.selectStrategy(strategyToSelect, middlewareToSelect, actionToSelect, 
            _.filter(ref.bases, function(base){return base.strategy == strategyToSelect.id }) );
      }
    }
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
  if ($routeParams.launch != undefined && $routeParams.launch == session_id) {
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
   console.log('$routeParams.launch', $routeParams);
   // Change to session that signed in route params
   if ($routeParams.launch != undefined) {
    var ses  = _.find($scope.sessions, function(ses) { 
      return ses.session.id == parseInt($routeParams.launch) });
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

  var res = _.find($scope.accounts, function(cr){ return cr.email == obj.uid});
  if (res != undefined) {
    if (res.avatarURL == undefined || res.avatarURL == "") {
      res.avatarURL = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iRWJlbmVfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjx0aXRsZT5EZWZhdWx0IEF2YXRhcjwvdGl0bGU+PGRlc2M+RGVmYXVsdCBBdmF0YXIgZm9yIFdDRiAyLjA8L2Rlc2M+IDxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbLnN1cmZhY2UgeyBmaWxsOiAjZmZmOyB9LnNoYWRvdyB7IGZpbGw6ICNiYmI7IH1dXT48L3N0eWxlPjwvZGVmcz48cmVjdCB4PSIwIiBjbGFzcz0ic2hhZG93IiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiLz48cGF0aCBjbGFzcz0ic3VyZmFjZSIgZD0iTTMuNTI4LDE2QzMuNzc2LDExLjQ5OSw1LjY4NCw4LDgsOHM0LjIyNCwzLjQ5OSw0LjQ3Myw3Ljk5OCIvPjxjaXJjbGUgY2xhc3M9InN1cmZhY2UiIGN4PSI4IiBjeT0iNiIgcj0iMy41Ii8+PC9zdmc+'
    }
    console.log(res);

    return res; //res.fullName + " " + obj.uid;
  } else if (res == undefined) {
    //return res;//"Anonymous " + obj.uid;
  }
  } else { // it's group
    //var res = _.find($scope.groups, function(gr) { return gr.id == obj.id });
    //if (res != undefined) {
      return obj;//return "Group " + obj.title;
    //}
  }
};

$scope.accFetch = function (obj) {
  if (obj.uid != undefined) { // it's employee

  var res = _.find($scope.accounts, function(cr){ return cr.email == obj.uid});
  console.log(res);
  if (res != undefined) { // it's account
                          // anonumous checking
    res.fullName != undefined ? res.tooltip = res.fullName : res.tooltip = res.email;
    if (res.avatarURL == undefined || res.avatarURL == "") {
      res.avatarURL = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iRWJlbmVfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjx0aXRsZT5EZWZhdWx0IEF2YXRhcjwvdGl0bGU+PGRlc2M+RGVmYXVsdCBBdmF0YXIgZm9yIFdDRiAyLjA8L2Rlc2M+IDxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbLnN1cmZhY2UgeyBmaWxsOiAjZmZmOyB9LnNoYWRvdyB7IGZpbGw6ICNiYmI7IH1dXT48L3N0eWxlPjwvZGVmcz48cmVjdCB4PSIwIiBjbGFzcz0ic2hhZG93IiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiLz48cGF0aCBjbGFzcz0ic3VyZmFjZSIgZD0iTTMuNTI4LDE2QzMuNzc2LDExLjQ5OSw1LjY4NCw4LDgsOHM0LjIyNCwzLjQ5OSw0LjQ3Myw3Ljk5OCIvPjxjaXJjbGUgY2xhc3M9InN1cmZhY2UiIGN4PSI4IiBjeT0iNiIgcj0iMy41Ii8+PC9zdmc+'
    }
    return res;
  } else if (res == undefined) {
    res = {};
    if (res.avatarURL == undefined || res.avatarURL == "") {
      res.avatarURL = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iRWJlbmVfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjx0aXRsZT5EZWZhdWx0IEF2YXRhcjwvdGl0bGU+PGRlc2M+RGVmYXVsdCBBdmF0YXIgZm9yIFdDRiAyLjA8L2Rlc2M+IDxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbLnN1cmZhY2UgeyBmaWxsOiAjZmZmOyB9LnNoYWRvdyB7IGZpbGw6ICNiYmI7IH1dXT48L3N0eWxlPjwvZGVmcz48cmVjdCB4PSIwIiBjbGFzcz0ic2hhZG93IiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiLz48cGF0aCBjbGFzcz0ic3VyZmFjZSIgZD0iTTMuNTI4LDE2QzMuNzc2LDExLjQ5OSw1LjY4NCw4LDgsOHM0LjIyNCwzLjQ5OSw0LjQ3Myw3Ljk5OCIvPjxjaXJjbGUgY2xhc3M9InN1cmZhY2UiIGN4PSI4IiBjeT0iNiIgcj0iMy41Ii8+PC9zdmc+'
    }
    return "Anonymous " + obj.uid;
  }
  } else { // it's group
    var res = _.find($scope.groups, function(gr) { return gr.id == obj.id });
    if (res != undefined) {
      res.avatarURL = '/assets/images/group.png'
      res.tooltip = "Group " + res.title;
      return res;
    } else { return }
  }
};

$scope.createPermForForm = function (perm, perms, position) {
  perms.push(angular.copy(perm));
}

$scope.delPermForForm = function (perm,perms) {
  var ind = perms.indexOf(perm);
  perms.splice(ind, 1);
}
$scope.createElementResource = function(cost, costs) {
    costs.push(angular.copy(cost));
    cost.resource=$scope.resources[0];cost.entity=cost.resource.entities[0];
}
$scope.delElementResource = function(cost, costs, force) {
  var ind = costs.indexOf(cost);
  costs.splice(ind, 1);
  if (force) { // Delete by ajax
     console.log(cost);
     $scope.deleteAsssignedResEl(cost);
  }
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
 //$location.search('launch', $scope.session.session.id);
 $scope.inSession = true;
 $scope.station = $scope.session.station;//_.find(session.station, function(s) { return s.front == true })
 $scope.session_bar = 'hiding';

 $scope.interactions = InteractionsFactory.query({session_id: $scope.session.session.id});


 $scope.input_logs = BPInLoggersSessionFactory.query({BPid: $scope.BPid, station_id: $scope.session.id});
 //.$promise.then(function(reaction_array) {

 if ($scope.station != undefined && $scope.station.inspace == false) {
   if ($scope.bpelems[$scope.station.step] !== undefined) {
    var elem = $scope.bpelems[$scope.station.step].id
    var top = $('.elem-'+elem).offset().top;
    console.log("top traverse marker" + top);
    $('.traverse-marker').css('top', top-35 + 'px')

   } else {  // MAKE SAFE FOR LAST ELEMENT
             // When it's finished
    var elem = $scope.bpelems[$scope.station.step-1].id
    var top = $('.elem-'+elem).offset().top;
    console.log("top traverse marker" + top);
    $('.traverse-marker').css('top', top-35+35 + 'px')
   }
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



$scope.byReaction = function(action) {
  return function(obj) {
     if (obj.reaction === action.id) {
       return obj;
     } else {
       return false;
     }
 }
}
$scope.byMiddleware = function(middleware) {
  return function(obj) {
     if (obj.middleware === middleware.id && obj.isNullStrategy != true) {
       return obj;
     } else {
       return false;
     }
 }
}
$scope.byStrategy = function(strategy) {
  return function(obj) {
     if (obj.strategy === strategy.id && strategy.isNullStrategy != true) {
       // null strategy
       return obj;
     } else {
       return false;
     }
 }
}







/*
 Action fields
 Strategy
 ...
 */





var vm = this;

$scope.setStrategyFields = function(strategy, action) {
  if ($scope.newBpelem.selectedRef != undefined) {
  if (action.selectedRefFields == undefined) {  // if fields doesnt set
  action.selectedRefFields = _.map($scope.newBpelem.selectedRef.strategies,function(strategyL) {
  var bases = _.filter($scope.newBpelem.selectedRef.bases, function(base){
    return base.strategy == strategy.id
  });

  return {
    strategy: strategy,
    fields: _.flatten(_.map(bases, function(base) {
        if (base.baseType == "duration") {
          var fieldType = 'number'
          var placeholder = '';
          var label = 'Duration';
        } else if (base.baseType == "datetime") {
          var fieldType = 'text'
          var placeholder = 'DD/MM/YEAR HH:MM:SS';
          var label = 'Schedule';
        } else if (base.baseType == "url") { 
          var fieldType = 'url'
          var label = 'URL';                  
          var placeholder = 'http://example.com/api/v1/resource';
        } else {
          var fieldType = 'text'
          var placeholder = '';
          var label = '';
        }

      return [
        {
          key: "base_id",
          type: 'input',
          className: 'hidden',
          defaultValue: base.id,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Base id",
            placeholder: ""
          }
        },
        {
          key: "field_type",
          type: "input",
          className: 'hidden',
          defaultValue: fieldType,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Field type",
            placeholder: ""
          }

        },
        {
        key: base.key,
        type: 'input',
        className: 'new-elem-action__action-base__action-base-form__field',
        templateOptions: {
          className: 'new-elem-action__action-base__action-base-form__field',
          type: fieldType,
          label: label,
          placeholder: placeholder
        }
        }];
    }))
  }

  });
  };
} else {
  action.selectedRefFields = {};
}

}

/*****
 * Fields for strategy in new element form
 */
vm.fieldsForStrategy = function(strategy, action) {
  $scope.setStrategyFields(strategy, action);
  var f = _.find(action.selectedRefFields, function(r){ return r.strategy.id == strategy.id });
  if (f !== undefined) {
    return f.fields;
  } else {
    return undefined;
  }
}

$scope.fieldsForStrategy = function(strategy, action) {
  console.log('fieldsForStrategy', strategy, action);
  $scope.setStrategyFields(strategy, action);
  var f = _.find(action.selectedRefFields, function(r){ return r.strategy.id == strategy.id });
  if (f !== undefined) {
    console.log('return fields');
    return f.fields;
  } else {
    console.log('return null');
    return undefined;
  }
}



$scope.setStrategyEditFields = function(strategy, action) {
  if (action.selectedRefFields == undefined) {  // if fields doesnt set
  action.selectedRefFields = _.map([strategy], function(strategyL) {
  var bases = _.filter(action.strategy_bases, function(base){
    return base.strategy == strategy.id
  });

  return {
    strategy: strategy,
    fields: _.flatten(_.map(bases, function(base) {
        if (base.baseType == "duration") {
          var fieldType = 'number'
          var placeholder = '';
          var label = 'Duration';
        } else if (base.baseType == "datetime") {
          var fieldType = 'text'
          var placeholder = 'DD/MM/YEAR HH:MM:SS';
          var label = 'Schedule';
        } else if (base.baseType == "url") { 
          var fieldType = 'url'
          var label = 'URL';                  
          var placeholder = 'http://example.com/api/v1/resource';
        } else {
          var fieldType = 'text'
          var placeholder = '';
          var label = '';
        }

      return [
        {
          key: "base_id",
          type: 'input',
          className: 'hidden',
          defaultValue: base.id,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Base id",
            placeholder: ""
          }
        },
        {
          key: "field_type",
          type: "input",
          className: 'hidden',
          defaultValue: fieldType,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Field type",
            placeholder: ""
          }

        },
        {
        key: base.key,
        type: 'input',
        className: 'new-elem-action__action-base__action-base-form__field',
        templateOptions: {
          className: 'new-elem-action__action-base__action-base-form__field',
          type: fieldType,
          label: label,
          placeholder: placeholder
        }
        }];
    }))
  }

  });
  };

}
/*****
 * Fields for strategy in edit form
 */
vm.editFieldsForStrategy = function(strategy, action, bases) {
  if (action.selectedRefFields == undefined || action.selec) {  // if fields doesnt set

  console.log('editFieldsForStrategy: ', bases);
  var f = _.flatten(_.map([bases], function(base) {
      if (base.baseType == "duration") {
        var fieldType = 'number'
        var placeholder = '';
        var label = 'Duration';
        var defaultValue = parseInt(base.valueContent)
      } else if (base.baseType == "datetime") {
        var fieldType = 'text'
        var placeholder = 'DD/MM/YEAR HH:MM:SS';
        var label = 'Schedule';
        var defaultValue = base.valueContent;
      } else if (base.baseType == "url") { 
          var fieldType = 'url'
          var label = 'URL';        
          var placeholder = 'http://example.com/api/v1/resource';
          var defaultValue = base.valueContent;

      } else {
        var fieldType = 'text'
        var placeholder = '';
        var label = '';
        var defaultValue = base.valueContent;

      }

    return [
      {
        key: "base_id",
        type: 'input',
        defaultValue: base.id,
        className: 'hidden',
        templateOptions: {
          type: "text",
            className: 'hidden',
          label: "Base id",
          placeholder: ""
        }
      },
      {
        key: "field_type",
        type: "input",
        defaultValue: fieldType,
        className: 'hidden',
        templateOptions: {
          type: "text",
            className: 'hidden',
          label: "Field type",
          placeholder: ""
        }

      },
      {
      key: base.key,
      type: 'input',
      className: 'new-elem-action__action-base__action-base-form__field',
      defaultValue: defaultValue,
      templateOptions: {
        className: 'new-elem-action__action-base__action-base-form__field',
        type: fieldType,
        label: label,
        placeholder: placeholder
      }
      }];
    }));

  console.log('f', f);
  action.selectedRefFields = f;
  return f;

} else {
  return undefined;
}

}

$scope.openElemDetail = function(elem, elems) {
  if (elem.selected == 1) {
   $scope.resetEditView(elems);
   elem.selected=2  
  } else {
    elem.selected=1
  }
 }

$scope.resetEditView = function(elems) {
  _.forEach(elems, function(e) {
    return e.selected = 1;
  })
}

$scope.updateBase = function(base) {
  // POST /process/:bpId/base/:base_id
  var bpId = $scope.BPid;
  var key = base.key;
  var base_id = base.updatedStrategy.base_id;
  var baseNewValue = base.updatedStrategy[key];
  console.log(base);

  $http({
      url: '/process/'+bpId+'/base/'+base_id,
      method: "POST",
      data: { baseNewValue: baseNewValue.toString() }
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




$scope.selectStrategy = function(strategy, middleware, action, bases) {
     console.log('action.selectedStrategy', action.selectedStrategy);
     action.selectedRefFields = undefined;
     $scope.setStrategyFields(strategy, action);
     console.log('selectStrategy action.selectedRefFields', action.selectedRefFields);
     var bases = _.filter(bases, function(base){ return base.strategy === strategy.id });

    action.refStrategySelect = {
      action: action,
      middleware: middleware,
      strategy: strategy,
      bases: bases
    };
}
$scope.isStrategySelected = function(strategy, action) {
  if (action.refStrategySelect != undefined && action.refStrategySelect.strategy.id == strategy.id) {
    return true;
  } else {
    return false;
  }
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

/**
 * Test action execution
 */
$scope.textExec = function(action, middleware, strategy) {
  console.log('textExec', action, middleware, strategy);
      ngDialog.open({
      template: '/assets/partials/actions/action-test.html',
      controller: 'actionController',
      scope: $scope,
      data: {'testAction':'elemAction','actionId': action.id}
    });
}





$scope.selected = null;

$scope.models = {
    selected: null,
    lists: [{label: "Item A"}, {label: "Item B"}]
};

$scope.moveElement = function(elem) {
  var index = $scope.bpelems.indexOf(
    _.filter($scope.bpelems, function(el) { return elem.id == el.id })[1]);
  console.log('moveElement', index);
  $scope.bpelems.splice(index, 1)
}

/****
 * Load acts for launch
 */
$http({
  url: '/launch/'+$routeParams.launch+'/acts',
  method: "GET",
}).then(function(response) {
  // success
  console.log(response.data);
  $scope.acts = response.data;
},
function(response) { // optional
  // failed
  console.log(response);
});





}]);






});
