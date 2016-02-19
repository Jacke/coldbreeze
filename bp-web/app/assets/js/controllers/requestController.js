define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {




minorityControllers.controller('BPRequestCtrl', ['$timeout','$q','DataCostLaunchAssign', 
  'fastResourceCostCreation', 
  'DropBoxSettings', 
  'lkGoogleSettings', 
  'notificationService', 
  'LaunchElementTopologsFactory',
  'LaunchElemsFactory',
  'LaunchSpacesFactory',
  'LaunchSpaceElemsFactory',
  'ElementTopologsFactory', 
  'InteractionsFactory', 
  '$scope', 
  '$window',
  '$routeParams',
  '$route', 
  '$rootScope',
  '$filter',
  'BPLogsFactory', 
  'BPElemsFactory',
  'BPSpacesFactory',
  'BPSpaceElemsFactory', 
  'BProcessFactory', 
  'BPStationsFactory', 
  'BPRequestFactory', 
  '$location', 
  '$http',
function ($timeout, $q, DataCostLaunchAssign, fastResourceCostCreation, DropBoxSettings, lkGoogleSettings, notificationService, LaunchElementTopologsFactory, LaunchElemsFactory,LaunchSpacesFactory,LaunchSpaceElemsFactory, ElementTopologsFactory, InteractionsFactory, $scope, $window,$routeParams,$route, $rootScope,$filter,BPLogsFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BProcessFactory, BPStationsFactory, BPRequestFactory,  $location, $http) {

$scope.bpId = $scope.session.process.id;
$scope.session_id = $scope.session.session.id;

$scope.isManager = function () {
  if ($scope.isManagerVal === undefined && $rootScope.manager !== undefined) {
    $scope.isManagerVal = $rootScope.manager;
    return $scope.isManagerVal;
  } else {
    return $window.localStorage.manager === "true";
  }
};

$scope.isManagerVal = $scope.isManager();
$scope.isManager();

$scope.element_topologsPromise = LaunchElementTopologsFactory.query({ launch_id: $scope.session_id }); 

/**
 * Helper for fetching element object to every reaction element
 * @param  interaction {main interaction object, not an array!!!}
 * @return {void}
 */
$scope.reactionElementRoutine = function (interactions) {

if ($scope.element_topologsPromise) {
      $scope.element_topologsPromise.$promise.then(function(d) {
        if (interactions) {
              _.forEach(interactions.reactions, function(r) { 
                var data = _.find(d, function(topo) { 
              return topo.topo_id === r.reaction.element}); 
                if (data !== undefined) { return r.reaction.elem = data; };
              });
              $scope.firstInput = interactions.reactions[0];

            _.forEach(interactions.reactions, function(reaction) { 
               return _.forEach(reaction.outs, function(out) {
                  return out.state = _.find(interactions.outs_identity, function(iden) { return iden.origin_state === out.state_ref });
              }); 
            });
        } 
    });
} else {
  LaunchElementTopologsFactory.query({ launch_id: $scope.session_id }).$promise.then(function (d) {
      if (interactions) {
          _.forEach(interactions.reactions, function(r) {
            var el = _.find(d, function(topo) { 
              return topo.topo_id === r.reaction.element }); 
            console.debug('finded el', el);   
            return r.reaction.elem = el;
          });
          _.forEach(interactions.reactions, function(reaction) { 
           return _.forEach(reaction.outs, function(out) {
              return out.state = _.find(interactions.outs_identity, function(iden) { return iden.origin_state === out.state_ref });
                  }); 
          });
      } 
  });
}

};


/*
  Pusher request scope to child scope[for process or launches controllers].
 */
if ($scope.interactionContainer === undefined && $scope.$parent.$parent.$parent.$parent.nestedRequestScopes != undefined) {
  $scope.$parent.$parent.$parent.$parent.nestedRequestScopes.push({ session_id: $scope.session_id, scope: $scope}); 
  //$scope.interactionContainer = $scope.$parent.$parent.$parent.$parent.interactionContainerLaunch;

} else if ($scope.interactionContainer === undefined && $scope.$parent.$parent.$parent.$parent.$parent.nestedRequestScopes != undefined) {
  $scope.$parent.$parent.$parent.$parent.$parent.nestedRequestScopes.push({ session_id: $scope.session_id, scope: $scope});
  //$scope.interactionContainer = $scope.$parent.$parent.$parent.$parent.$parent.interactionContainerProc;
}


/*****
 *    Nested elements Fetching
 *****
console.log("Nested");
console.log($scope.$parent.$parent.$parent.$parent.$parent); // Input -> Session -> Entity -> Common scope
console.log($scope.$parent.$parent.$parent.$parent.interactionContainer);
console.log($scope.$parent.$parent.$parent.interactionContainer);
console.log($scope.$parent.$parent.interactionContainer);
console.log($scope.$parent.interactionContainer);
*/
/***
 * Nested interaction fetching
 */

$scope.reloadInteractionContainer = function() {
  if ($scope.interactionContainer === undefined && $scope.$parent.$parent.$parent.$parent.interactionContainerLaunch != undefined) {
    $scope.interactionContainer = $scope.$parent.$parent.$parent.$parent.interactionContainerLaunch;

  } else if ($scope.interactionContainer === undefined && $scope.$parent.$parent.$parent.$parent.$parent.interactionContainerProc != undefined) {
    $scope.interactionContainer = $scope.$parent.$parent.$parent.$parent.$parent.interactionContainerProc;
  }
  if ($scope.interactionContainer !== undefined && $scope.interactionContainer.$promise !== undefined && typeof $scope.interactionContainer.then === 'function') {
    // Promise check
    $scope.interactionContainer.$promise.then(function (d) {
      $scope.interactionContainer = d;
      var data = _.find($scope.interactionContainer, function(cn) { return cn.session_container.sessions[0].session.id === $scope.session_id })
      $scope.interactions = data;
      $scope.element_topologsPromise.$promise.then(function(d) { 
        $scope.reactionElementRoutine($scope.interactions);
 });
    });  
  } else {
      var data = _.find($scope.interactionContainer, function(cn) { 
                              return cn.session_container.sessions[0].session.id === $scope.session_id });
      $scope.interactions = data;
      $scope.element_topologsPromise.$promise.then(function(d) { 
        $scope.reactionElementRoutine($scope.interactions);
 });
  }

  if ($scope.interactions === undefined && $scope.$parent.$parent.$parent.$parent.interactionContainerPromise !== undefined) {
    $scope.$parent.$parent.$parent.$parent.interactionContainerPromise.$promise.then(function(d) {
      $scope.interactionContainer = $scope.$parent.$parent.$parent.$parent.interactionContainerLaunch;
      var data = _.find($scope.interactionContainer, function(cn) { 
                              return cn.session_container.sessions[0].session.id === $scope.session_id });
      $scope.interactions = data;
      $scope.element_topologsPromise.$promise.then(function(d) { 
        $scope.reactionElementRoutine($scope.interactions);
       });
      //$scope.$apply();

      //$scope.reloadInteractionContainer();      
    })
    //$scope.reloadSession();
  }
}

$scope.reloadInteractionContainer();
$scope.reloadSession = function(session_id) {
  if ($window.location.hash === "#/launches") {
    $scope.$parent.reloadSession(session_id);
    //$scope.reloadInteractionContainer();
  }
  if ($window.location.hash === "#/bprocesses") {
    $scope.$parent.reloadSession(session_id);
    //$scope.reloadInteractionContainer();
  }
}

 $scope.$on('reloadSession', function(event, session_id) { 
  if (session_id === $scope.session_id) {
    $scope.reloadInteractionContainer();//$scope.reloadSession(session_id)
  }
});
/**
 * Events Fetch updated interactions
 * @param  {[type]}
 * @param  {[type]}
 * @return {[type]}
 */
$scope.$on('newInteractionsForLaunch', function(event, obj) {
  if (obj.session_id === $scope.session_id) {
    $scope.interactions = obj.updatedInteraction[0]; // fetch only one interactions
  }
}); 
/**
 * Fetch element objects
 * @param  {[type]}
 * @param  {[type]}
 * @return {[type]}
 */
$scope.$on('reloadElementRoutine', function(event, session_id) { 
  if (session_id === $scope.session_id) {
    $scope.reactionElementRoutine($scope.interactions);//$scope.reloadSession(session_id)
  }
});

if ($scope.$parent.allLaunchedElemPromise) {
  $scope.allLaunchedElemPromise = $scope.$parent.allLaunchedElemPromise;
  $scope.allLaunchedElemPromise.$promise.then(function(data) {
    var currentContainer = _.find(data, function(d) { return d.launchId == $scope.session_id});
//    $scope.bpelems = currentContainer.elements;
    $scope.bpelems = LaunchElemsFactory.query({ launch_id: $scope.session_id }); 

    $scope.spaces = currentContainer.spaces;
    $scope.spaceelems = currentContainer.space_elements;
    $scope.elemsHash = _.object(_.map($scope.bpelems, function(x){return [x.id, x]}));
    $scope.spaceElemHash = _.object(_.map($scope.spaceelems, function(x){return [x.id, x]}));  
  });
} else {
  console.log('$scope.allLaunchedElemPromise not found', $scope.$parent);
    $scope.bpelems = LaunchElemsFactory.query({ launch_id: $scope.session_id }); 
    $scope.spaces =  LaunchSpacesFactory.query({ launch_id: $scope.session_id });
    $scope.spaceelems = LaunchSpaceElemsFactory.query({ launch_id: $scope.session_id });
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

};



$scope.trees = undefined;
/*
$scope.bpelems.$promise.then(function(data) {
  $scope.spaceelems.$promise.then(function(data3) {
    $scope.elemsHash = _.object(_.map($scope.bpelems, function(x){return [x.id, x]}));
    $scope.spaceElemHash = _.object(_.map($scope.spaceelems, function(x){return [x.id, x]}));
 });
});
*/


$scope.byObjId = function(elem) {
  return function(obj) {
    if (obj.f_elem !== undefined) {
      return obj.f_elem === elem.id;
    } else {
      return obj.sp_elem === elem.id;
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
     return '';
  }
}

$scope.params = [];


/***
 * Initiation of interactions
 * Autostart
 */
$scope.firstInput = {}; 
$scope.initiationOfInteraction = function() {

var deferred = $q.defer();

if ($scope.interactionContainer === undefined || $scope.interactionContainer.$promise === undefined) {
 /* console.log('interactionContainer are undefined');
 InteractionsFactory.query({session_id: $scope.session.session.id}).$promise.then(function (data) {
    $scope.interactions = data;
    LaunchElementTopologsFactory.query({ launch_id: $scope.session_id }).$promise.then(function (data2) {
        
        $scope.element_topologs = data2;
        $scope.reactionElementRoutine($scope.interactions);

        if ($scope.interactions.reactions.length > 0) {
          $scope.firstInput = $scope.interactions.reactions[0];
          $scope.firstInput.files = [];
        }
        if ($scope.interactions !== undefined && $scope.interactions.reactions 
                                !== undefined && $scope.interactions.reactions.length > 0) {
              $scope.reactionSelect($scope.interactions.reactions[0]);
        }        
    });
});
*/
  deferred.resolve();
} else {
//InteractionsFactory.query({session_id: $scope.session.session.id})
    var data =  _.filter($scope.interactionContainer, function(d) { 
      return _.filter(d.session_container.sessions, function(dd) { 
        return dd.session.id === $scope.session.session.id }).length > 0;
    })[0];

    //$scope.interactions = data;
    if ($scope.interactions !== undefined && $scope.interactions.reactions !== undefined) { // Check for nulled interactions    
    $scope.element_topologsPromise.$promise.then(function (data2) {
      $scope.element_topologs = data2;

        _.forEach($scope.interactions.reactions, function(r) { 
          var el = _.find($scope.element_topologs, function(topo) { 
          return topo.topo_id === r.reaction.element}); 
          console.debug('finded el', el);
          return r.reaction.elem = el;
        });
        $scope.firstInput = $scope.interactions.reactions[0];

        _.forEach($scope.interactions.reactions, function(reaction) { 
           return _.forEach(reaction.outs, function(out) {
              return out.state = _.find($scope.interactions.outs_identity, function(iden) { return iden.origin_state === out.state_ref });
          }) 
        });

          if ($scope.interactions.reactions.length > 0) {
            $scope.firstInput = $scope.interactions.reactions[0];
            $scope.firstInput.files = [];
          }
          if ($scope.interactions !== undefined && $scope.interactions.reactions !== undefined 
                                                && $scope.interactions.reactions.length > 0) {
            $scope.reactionSelect($scope.interactions.reactions[0]);
          }        
        deferred.resolve();
      });
    }
}

return deferred.promise;

}
$scope.initiationOfInteractionPromise = $scope.initiationOfInteraction();


$scope.selectedClass = function (reaction) {
  if (reaction.selected) {
    return 'selected';
  } else {
    return '';
  }
}

$scope.reactionSelect = function (reaction) {
    if (reaction.selected) {
      reaction.selected = false;
      $scope.addParam(reaction);
    } else {
      reaction.selected = true;
      $scope.addParam(reaction);
    }
}



/*
  Warp field impementation
 */
// { payload: [ { obj_type: "text", obj_title: "Text", obj_content: value } ] }  
$scope.payload = [];
$scope.sended_payload = [];
$scope.payload_result = [];
$scope.removePayload = function(field) {
  $scope.payload = _.reject($scope.payload, function(el) { return el.$$hashKey === field.$$hashKey; });
};


$scope.removeFromNewPayload = function(field, elem, payload) {
  _.forEach(payload, function(c) {
  console.log(c.files.length);
    return c.files = _.reject(c.files, function(el) { return el.$$hashKey === field.$$hashKey; });
  console.log(c.files.length);
  });
  console.log('removeFromNewPayload field', field.entityId);
  if (field.entityId) {
     var entityId = field.entityId;
     $http({
      url: '/data/entity/'+entityId+'/delete',
      method: "POST",
      data: {},
      }).then(function(response) {
        // success
        console.log(response)
      },
      function(response) { // optional
        // failed
        console.log(response);
      }); 
  }
};



$scope.removeFromPayload = function(field, elem) {
  elem.payload = _.reject(elem.payload, function(el) { return el.$$hashKey === field.$$hashKey; });
  if (field.entityId) {
     var entityId = field.entityId;
     $http({
      url: '/data/entity/'+entityId+'/delete',
      method: "POST",
      data: {},
      })
      .then(function(response) {
        // success
        console.log(response)
      },
      function(response) { // optional
        // failed
        console.log(response);
      }
      ); 
  }
  //$scope.$apply();
};

$scope.setWarpType = function(field, warp_type) {
  var index = $scope.payload.indexOf(field);
  if (index !== -1) {
  //    items[index] = 1010;
    if (warp_type === 'text') {
      $scope.payload[index] = { obj_type: "text", obj_title: "Text", obj_content: "" }  
    } 
    if (warp_type === 'file') {
      $scope.payload[index] = { obj_type: "file", obj_title: "", obj_content: "" }   
    }
  } 
}

$scope.setWarpTypeForPayload = function(field, warp_type, payload) {
  var index = payload.indexOf(field);
  if (index !== -1) {
  //    items[index] = 1010;

    if (warp_type === 'text') {
      payload[index] = { obj_type: "text", obj_title: "Text", obj_content: "" }  
    } 
    if (warp_type === 'file') {
      payload[index] = { obj_type: "file", obj_title: "", obj_content: "" }   
    }
  } 
  console.log(field);
}

//$scope.files
//$scope.dpfiles
//$scope.boxfiles
$scope.$watch("files", function(newNames, oldNames) {
    if (newNames.length > 0) {
      $scope.prepareFiles();
    }
}, true);
$scope.$watch("dpfiles", function(newNames, oldNames) {
    if (newNames.length > 0) {
      $scope.prepareFiles();
    }
}, true);
$scope.$watch("boxfiles", function(newNames, oldNames) {
    if (newNames.length > 0) {
      $scope.prepareFiles();
    };//$log.debug("    ** $watch(..., true)");
}, true);

$scope.addToPayload = function(payload) {
  payload.push({});
  if (payload.length > 0) {
    $scope.setWarpTypeForPayload(payload[payload.length-1], 'file', payload);
  }
}
$scope.addPayload = function(setType) {
  $scope.payload.push({});
  if ($scope.payload.length > 0) {
    $scope.setWarpType($scope.payload[$scope.payload.length-1], 'file');
  }
}
$scope.onLoaded = function () {
  console.log('Google Picker loaded!');
}

// Callback triggered after selecting files
$scope.onPicked = function (docs, element) {
  var data = _.map(docs, function(el) { 
      return { obj_type: "file", obj_content: el.embedUrl, obj_title: el.name };   
  });
  element.payload = element.payload.slice(0, -1).concat(data);
  // make element id
  if (element.reaction != undefined) { element.element_id = element.reaction.elem.element_id; }//reaction
  else { element.element_id = element.id; } // from tree
  $scope.sendPayloadForElement($scope.session_id, element, _.filter(element.payload, function(el){return el.obj_content !== "";}))
};
$scope.onNewPicked = function (docs, element, payload) {
  var data = _.map(docs, function(el) { 
      return { obj_type: "file", obj_content: el.embedUrl, obj_title: el.name };   
  });
  element.payload = element.payload.slice(0, -1).concat(data);
  // make element id
  if (element.reaction != undefined) { element.element_id = element.reaction.elem.element_id; }//reaction
  else { element.element_id = element.id; } // from tree
  $scope.sendPayloadForElement($scope.session_id, 
                               element, 
                              _.filter(element.payload, function(el){return el.obj_content !== "";}))
};
/*
$scope.onPicked = function (docs, payload) {
  angular.forEach(docs, function (file, index) {
    $scope.files.push(file);
  });
};
*/
 

$scope.onPickedFirstInput = function(first_input, docs) {
    first_input.files = [];
    angular.forEach(docs, function (file, index) {
    first_input.files.push(file);
  });
}

// Callback triggered after clicking on cancel
$scope.onCancel = function () {
  console.log('Google picker close/cancel!');
}
$scope.files = [];
$scope.dpfiles = [];
$scope.boxfiles = [];

$scope.clearFiles = function() {
  $scope.files = [];
$scope.dpfiles = [];
$scope.boxfiles = [];
}

$scope.removeField = function(ids) {
  $scope.payload.splice(ids, 1);
}
$scope.removeFileFirstInput = function(file, firstInput){
  firstInput.files.splice(firstInput.files.indexOf(file), 1);
}
$scope.remove = function(idx){
    $scope.dpfiles.splice(idx,1);
}
$scope.removeboxfiles = function(idx){
    $scope.boxfiles.splice(idx,1);
}
$scope.removeDriveFile = function(idx) {
  $scope.files.splice(idx,1);
}
$scope.prepareFiles = function() {
  var data = _.map($scope.files, function(el) { 
      return { obj_type: "file", obj_content: el.embedUrl, obj_title: el.name };   
  }).concat(
  _.map($scope.dpfiles, function(el) { 
      return { obj_type: "file", obj_content: el.link, obj_title: el.name };   
   })).concat(
  _.map($scope.boxfiles, function(el) {
      return { obj_type: "file", obj_content: el.link, obj_title: el.name };       
   }));
   $scope.clearFiles();
   $scope.payload =    $scope.payload.concat(data);
   $scope.sendPayload($scope.session_id,"", _.filter($scope.payload, function(el){return el.obj_content !== "";}));   
   //$scope.sended_payload = $scope.payload.concat(data);
   //$scope.clearPayloadWithData(data);
};
$scope.clearPayloadWithData = function(data) {
  if ($scope.payload.length > 0) {
    if ($scope.payload[0].obj_content = "") {
      $scope.removeField($scope.payload.indefOf($scope.payload[0]));
      $scope.payload = data;
    } else { $scope.payload.concat(data); }
  } else { $scope.payload.concat(data); }
}

$scope.sendPayloadAction = function(element_id) {
  if (element_id !== undefined) {
    $scope.sendPayload($scope.session_id, element_id);
  } else {
    $scope.sendPayload($scope.session_id);
  }
}
$scope.sendWarpResult = function() {
     $http({
      url: '/warp/send',
      method: "POST",
      data: $scope.payload_result.data.message,
      })
      .then(function(response) {
        // success
        console.log(response)
      },
      function(response) { // optional
        // failed
        console.log(response);
      }
      );     
}
$scope.sendWarpResultForElement = function(payload_result) {
     $http({
      url: '/warp/send',
      method: "POST",
      data: payload_result.data.message,
      })
      .then(function(response) {
        // success
        console.log(response)
      },
      function(response) { // optional
        // failed
        console.log(response);
      }
      );     
}
$scope.sendPayload = function(launch_id, element_id, existedPayload) {
     if (existedPayload !== undefined) {
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
};

$scope.warpData = {};
$scope.bboardDataPromise = DataCostLaunchAssign.query( { launchId: $scope.session_id } );

$scope.bboardDataPromiseBuilder = $scope.bboardDataPromise.$promise.then(function(data) {
  $scope.processCosts = data.costs;
  $scope.warpData = data.warp;
  console.log('BBOARD Request DataCostLaunchAssign', data);
});

  /**
   * Push warpData to request elements
   */
/*
  // make element id
  if (element.reaction != undefined) { element.element_id = element.reaction.elem.element_id; }//reaction
  else { element.element_id = element.id; } // from tree
 */
$scope.fileSelectTab = function(elem) {
  elem.dataSelectTabSelected = false;
  elem.fileSelectTabSelected = true;
  return elem.fileSelectTabSelected;
}
$scope.dataSelectTab = function(elem) {
  elem.fileSelectTabSelected = false;
  elem.dataSelectTabSelected = true;
  return elem.dataSelectTabSelected;
}

$scope.treesDefiner = function() {
  var deferred = $q.defer();
  if ($scope.$parent.tree !== undefined) {
    $scope.$parent.allLaunchedElemPromise.$promise.then(function(d) {
    //console.debug('getted', $scope.$parent.tree);
    $scope.bpelems.$promise.then(function(d) {
          console.log('tree from launch elems are', d);
          $scope.trees = d;//$scope.$parent.tree.trees;
          deferred.resolve($scope.tree);
          return deferred.promise;
    });
    //console.debug('getted', $scope.trees);
    });
  } else if ($scope.$parent.bprocess) {
    //console.debug('getted', $scope.$parent.bprocess);
    $scope.trees = $scope.$parent.bprocess.trees;
    deferred.resolve($scope.tree);
    return deferred.promise;
  } //else {
    return deferred.promise;    
  //}
};
$scope.treesDefinerPromise = $scope.treesDefiner();

$scope.elemsPayload = [];

$scope.filterPayload = function(elemId) {
   return function(obj) {
      if (obj.elementId === elemId) {
        return obj;
      } else {
        return false;
      }
  }
}

$scope.fillBBoardData = function() {

$scope.bboardDataPromiseBuilder.then(function(d) {
$scope.treesDefinerPromise.then(function(d) {



console.log('bboardDataPromiseBuilder', $scope.processCosts);
console.log('so trees are ', $scope.trees);

$scope.elemsPayload = _.map($scope.trees, function(tree_elem) {
  var elem_id = tree_elem.id;

  var payloadResult = _.filter($scope.warpData.slats, function(slat) { 
    return _.filter(slat.meta, function(meta){ return (meta.key === "element_id" && meta.value === elem_id+"") 
  }).length > 0 })
  
  if ($scope.interactions !== undefined 
      && $scope.interactions.reactions 
      && $scope.interactions.reactions.length > 0) {
    $scope.fillCosts($scope.interactions.reactions[0].reaction.costs);
  }
  if ($scope.interactions !== undefined) {
    tree_elem.costs = $scope.filterCostByElementId(elem_id, $scope.interactions.reactions[0].reaction.costs);
  }
  var files = _.map(payloadResult, function(presult) {
      return { obj_type: "file", 
               obj_title: presult.title, 
               obj_content: presult.sval, 
               entityId: presult.entityId }   
  });
 return {elementId: elem_id, files: files};
});


$scope.costsPayload = _.map($scope.trees, function(tree_elem) {
  var elem_id = tree_elem.id;
  /**
   * Optimize Costs
   *
  Then implement this
  console.log('$scope.processCosts', $scope.processCosts)
  var costs = _.filter($scope.processCosts, function(slat) { 
    return _.filter(slat.meta, function(meta){ return (meta.key === "element_id" && meta.value === elem_id+"") 
 }).length > 0 })
*/
  var costs = $scope.warpData;
 return {elementId: elem_id, costs: costs};
});
console.log('$scope.costsPayload', $scope.costsPayload);


});
});
}
$scope.reFillBBoardData = function() {
  $scope.bboardDataPromise = DataCostLaunchAssign.query( { launchId: $scope.session_id } );
  $scope.bboardDataPromiseBuilder = $scope.bboardDataPromise.$promise.then(function(data) {
    $scope.processCosts = data.costs;
    $scope.warpData = data.warp;
    console.log('BBOARD Request DataCostLaunchAssign', data);
  });
  $scope.fillBBoardData();
};  

$scope.fillBBoardData();

//console.log('$scope.trees');
//console.log($scope.trees);
if($scope.interactions !== undefined && $scope.interactions.reactions) {
    _.forEach($scope.interactions.reactions, function(reaction) {

    console.debug('call fill cost');
    $scope.fillCosts(reaction.costs); // TODO: make for all cost not for costs in this reaction

    console.log($scope.initiationOfInteractionPromise);
     $scope.initiationOfInteractionPromise.then(function(topo) {
      //console.debug('bug', reaction.reaction.elem.element_id);      
      if (reaction.reaction.elem) {
        var elem_id = reaction.reaction.elem.element_id;
        var payloadResult = _.filter($scope.warpData.slats, function(slat) { 
          return _.filter(slat.meta, function(meta){ 
                return (meta.key === "element_id" && meta.value === elem_id+"")  }).length > 0 
        });

        reaction.payload = _.map(payloadResult, function(presult) {
                              return { obj_type: "file", 
                                       obj_title: presult.title, 
                                       obj_content: presult.sval, 
                                       entityId: presult.entityId }   
        });
        console.debug('payloadResult', payloadResult);

      }
      });

    });
}



$scope.fillCosts = function(costs) {
  _.forEach($scope.trees, function(t) {
    return t.costs = $scope.filterCostByElementId(t.id, costs);
  });
  //console.log('filtered Costs', $scope.trees);
}

$scope.sendPayloadForElement = function(launch_id, element, existedPayload) {
     if (existedPayload !== undefined) {
      var payload = existedPayload;
     $http({
      url: '/warp?launch_id=' + launch_id +'&element_id='+element.element_id,
      method: "POST",
      data: { payload: payload },
      })
      .then(function(response) {
        // success
        element.payload_result = response;//console.log(response);
        //$scope.bpstations = BPStationsFactory.query({ BPid: $scope.bpId });
      },
      function(response) { // optional
        // failed
        element.payload_result = response;//console.log(response);
      }
      );
     } else {
       var payload = element.payload; 
     }
};



/*
$('textarea#warpArea').bind('input propertychange', function () {
    var value = $(this).val();
$.ajax({
    type: "POST",
    url: "/warp",
    data: JSON.stringify({ body: value }),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function(data){  
      $('#result_warp').empty();
      underscore.forEach(data.message.entities, function(entity) {
        $('#result_warp').append('<p>'+JSON.stringify(entity)+'</p>');
      })      
      underscore.forEach(data.message.slats, function(slat) {
        $('#result_warp').append('<p>'+JSON.stringify(slat)+'</p>');
      })
    },
    failure: function(errMsg) {
        console.log(errMsg);
    }
});
$.ajax({
    type: "POST",
    url: "/warp",
    data: JSON.stringify(
      {payload: [ { 
      obj_type: "text", obj_title: "Text", obj_content: value } ] } ),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function(data){  
      $('#result_warp').empty();
      underscore.forEach(data.message.entities, function(entity) {
        $('#result_warp').append('<p>'+JSON.stringify(entity)+'</p>');
      })      
      underscore.forEach(data.message.slats, function(slat) {
        $('#result_warp').append('<p>'+JSON.stringify(slat)+'</p>');
      })
    },
    failure: function(errMsg) {
        console.log(errMsg);
    }
});
});*/









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
  return (station.finished !== true && station.paused === true);
}
$scope.filterInputs = function(elem) {
  return (elem.type_title === "confirm");
};

$scope.highlightActive = function (station, elem) {
   var front, nest;
   front = $scope.elemsHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].element];  
   nest = $scope.spaceElemHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].space_elem];  
   if (front !== undefined && front.id === elem.id) {
     return "active";
   } 
   if (nest !== undefined && nest.id === elem.id && elem.space_owned !== undefined) {
    return "active";
   } else {
     return "passive"
   }
};

$scope.haltSession = function (session_id) {
   $http({
      url: 'bprocess/' + $scope.bpId + '/session/' + session_id + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        $scope.bpstations = BPStationsFactory.query({ BPid: $scope.bpId });
      },
      function(response) { // optional
        // failed
      }
      );
};

$scope.filterReactionByElem = function(elem) {
  return function(obj) {
    return false;
  }
};

$scope.initiationOfInteractionPromise.then(function(d) {
$scope.filterReactionByElem = function(elem) {
  return function(obj) {
      if (obj.reaction.elem !== undefined && obj.reaction.elem.element_id === elem.id) {
        return obj;
      } else {
        return false;
      }
  }
};
});


$scope.entityDecorator = function(entities, resource) {
  if (entities === "*") {
    return "*"
  } else {
    if (entities !== "*") {
      var c = _.find(resource.entities, function(ent){return ent.id === entities});
      if (c !== undefined) {
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
  return _.filter(slats, function(slat){return slat.entityId === entity.id });
};
$scope.defaultValueParser = function(entity, value) {
  if (entity.etype === "number") {
    return parseInt(value);
  } else {
    return value;
  }
};
$scope.fastResourceCostCreationApply = function() {
// Add resource
// Add attribute
// Fetch resources
// Assign resource to current element
// Fetch assigned costs
// Show cost
  console.log(fastResourceCostCreation);
};


$scope.fillValue = function(cost, entity, value) {
  // entityId: String, launchId: Int, resourceId: Int
  var resourceId = cost.resource.resource.id;
  var launchId = $scope.session.session.id;
  var entityId = entity.id;
  var boardId = entity.boardId;

  var req = {title: entity.title, boardId: boardId, entityId: entityId, meta: '', sval: value, publisher: ''};
  $http.post(jsRoutes.controllers.DataController.fill_slat(entityId, launchId, resourceId).absoluteURL(document.ssl_enabled),  
                    req).then(function (data) {
                      console.log(data);
  });
};

$scope.reFillValue = function(cost, entity, slat) {
  // entityId: String, launchId: Int, resourceId: Int
  var resourceId = cost.resource.resource.id;
  var launchId = $scope.session.session.id;
  var entityId = entity.id;
  var boardId = entity.boardId;

  var req = {title: entity.title, boardId: boardId, entityId: entityId, meta: '', sval: slat.sval, publisher: ''};
  $http.post(jsRoutes.controllers.DataController.refill_slat(entityId, launchId, resourceId, slat.id).absoluteURL(document.ssl_enabled),  
                    req).then(function (data) {
                      console.log(data);
  });
};
/**************
 * ////END Cost module
 *****************/////////////////////////////////////////////////////*/




$scope.finishedInteractionFilter = function(obj) {
    return function(obj) {
      //obj.id // tree element
      if ($scope.interactions !== undefined) {
      //console.log('finishedInteractionFilter', _.find($scope.interactions.reactions, function(reaction) { 
      //                              return reaction.reaction.elem.element_id === obj.id}));
      //console.log('finishedInteractionFilter', obj.id);

      return _.find($scope.interactions.reactions, function(reaction) { 
                                    if (reaction.reaction.elem) {
                                    return reaction.reaction.elem.element_id === obj.id }
                                    }) === undefined;
      } else { // Finished launch
        true
      }
    }
};


$scope.runFromDisabled = true;
$scope.currentReactionFlag = true;

$scope.currentReactionFilter = function (data) {
      if ($scope.currentReactionFlag && 
        (($scope.interactions.reactions[0] === data) || ($scope.interactions.reactions[1] === data))  ) {
        return data;
      } 
      if ($scope.currentReactionFlag && 
        (($scope.interactions.reactions[0] !== data) || 
          ($scope.interactions.reactions[1] !== undefined && $scope.interactions.reactions[1] !== data)) ) {
        return false;
      } else {
        return data;
      }
};

$scope.reaction_params = []
/**
 * Execute a launch run 
 * @param session_id  {[Number]}
 * @return {[Void]}
 */   
$scope.runFrom = function (session_id, reaction) {
    //var front_params = _.filter(station.proc_elems,  function(obj) { return obj.param !== undefined });
    //var space_params = _.filter(station.space_elems, function(obj) { return obj.param !== undefined });
    //var params_output = _.flatten(_.map(front_params, function(v) { return {"f_elem": v.id, "param": v.param} }), _.map(space_params, function(v) { return {"sp_elem": v.id, "param": v.param} }));
    // TODO: Add arguments
    if (reaction.payload_result !== undefined && reaction.payload_result.length > 0) { // Send warp field
      //$scope.sendWarpResult()
      $scope.sendWarpResultForElement(reaction.payload_result);
    }
    if (reaction) {
      var reaction_params = {reaction_id: reaction.reaction.id}
    } else {
      var reaction_params = $scope.reaction_params[0]
    }

    if ($scope.reaction_params.length > 0) {
    $http({
      url: 'bprocess/' + $scope.bpId + '/invoke_from/' + session_id,
      method: "POST",
      data: [reaction_params]
      })
      .then(function(response) {
        // success
        $scope.invoke_res = [response.data];
        //$scope.closeThisDialog();
        $scope.reloadSession(session_id);
        //$location.reload();
        //.path('/a#/bprocess/' + $scope.bpId + 'elements?session=' + parseInt(response.data.session));
      },
      function(fail) { // optional
        // fail
        console.log(fail);
        notificationService.error(fail.data.error);
      }
      );
  }
};

$scope.shareLaunch = function(launch_id) {
  console.log(launch_id);
};

$scope.addParam = function (reaction) {
  //if (_.find($scope.reaction_params, function(re) { 
  //    return re.reaction_id === reaction.reaction.id }) !== undefined) {
  //      $scope.delParam(reaction);
  //} else {
    $scope.reaction_params.push({reaction_id: reaction.reaction.id });
      if ($scope.reaction_params.length !== 0) { 
        console.log("$scope.runFromDisabled = false;"); $scope.runFromDisabled = false; 
      }
  //}      
};

$scope.delParam = function (reaction) {
  $scope.reaction_params = _.reject($scope.reaction_params, function(el) { return el.reaction_id === reaction.reaction.id; });
  if ($scope.reaction_params.length == 0) { console.log("$scope.runFromDisabled = true;"); $scope.runFromDisabled = true; }
};

$scope.capitalizeFirstLetter = function (string) {
    if (string !== undefined) { 
      return string.charAt(0).toUpperCase() + string.slice(1)
    } else {
      return ""
    }
};


$scope.stateOutAct = function (act) {
  if (act) {
    if (act.on === true) {
      return 'turn on';
    } else {
      return 'turn off';
    }
  } else { return ''; }
};

$scope.filterCostByElementId = function(elemId, costs) {
  $scope.treesDefinerPromise.then(function(d) {
    //console.log('filterCostByElementId', elemId, costs);
    return _.filter(costs, function(cost) {
      return cost.elementId == elemId;
    });
  });
};

$scope.lastExecuted = function() {
  // For empty input logs
  if ($scope.logs !== undefined && $scope.logs.input_logs !== undefined && $scope.logs.input_logs.length === 0) {
    var AllDates = _.map(_.filter($scope.logs.stations, function(d) { return d.session === $scope.session_id }), function(f) {
      return f.updated_at;
    });
    return {
      minDate: AllDates[0],
      lastDate: AllDates[0]
    }
  } else {
    var AllDates = _.map($scope.logs.input_logs, function(log) {
      return log.date;
    });
    var minDate = _.min(AllDates);
    var lastDate = _.max(AllDates);
    return {
      minDate: minDate,
      lastDate: lastDate
    }
  }
};


$scope.defaultParam = function () {
      var targets = _.filter($scope.bpstations, function(station){ return station.paused == true; });
      _.each(targets, function(target) {
        target.params = [];
      });
      _.each(targets, function(target) {

        BPRequestFactory.scheme({ BPid: $scope.bpId, station_id: target.id }).$promise.then(function(data) {
                $(".inputRequests:not(:eq(0))").toggle();
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
/*
BPStationsFactory.query({ BPid: $scope.bpId }).$promise.then(function(data) {
         $scope.bpstations = data;      
         console.log("boom");

         //_.forEach($scope.bpstations, function (st) { $scope.addParam(st); });

    $scope.bpelems.$promise.then(function(data34) {
        $scope.spaces.$promise.then(function(data2) {
          $scope.spaceelems.$promise.then(function(data3) {
            $scope.logs.$promise.then(function(loggg) {
               _.forEach(data, function(station) { $scope.builder(station);  $(".inputRequests:not(:eq(0))").toggle(); });
                  console.log(data);  
                   $(".inputRequests:not(:eq(0))").toggle();
                 
  });
  });
  });
  });


  });


  $scope.defaultParam();
  $scope.bprocess = BProcessFactory.show({ id: $scope.bpId });
*/

$scope.showAll = function () {
  $(".inputRequests:not(:eq(0))").toggle();
}



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


});