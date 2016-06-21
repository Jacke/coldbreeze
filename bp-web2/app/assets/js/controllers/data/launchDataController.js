define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

// INDEX
return minorityControllers.controller('launchDataController', ['$q','$rootScope',
  '$scope',
  '$window',
  '$translate',
  '$rootScope',
  'Upload',
  'CacheFactory',
  'AllBPLogsFactory',
  'AllLaunchedElementsBulkFactory',
  'AllElementsBulkFactory',
  'InteractionsBulkFactory',
  'BPElemsFactory',
  'RefsFactory',
  'TreeBuilder',
  'NotificationBroadcaster',
  'SessionsFactory',
  'ngDialog',
  '$http',
  '$routeParams',
  '$filter',
  'BPElemsFactory',
  'BPSpacesFactory',
  'DataCostAssign',
  'DataCostElementLaunchAssign',
  'BPSpaceElemsFactory',
  'BProcessesFactory',
  'BProcessFactory',
  'BPStationsFactory',
  'BPServicesFactory',
  'DataCostLaunchAssign',
  'DataCostCollection',
  'LaunchElementTopologsFactory',
  '$location',
  function ($q, $rootScope,
    $scope, $window,
    $translate, $rootScope,Upload,
    CacheFactory,AllBPLogsFactory,
    AllLaunchedElementsBulkFactory, AllElementsBulkFactory,
    InteractionsBulkFactory, BPElemsFactory,
    RefsFactory, TreeBuilder,
    NotificationBroadcaster,SessionsFactory,
    ngDialog, $http,
    $routeParams, $filter,
    BPElemsFactory, BPSpacesFactory,DataCostAssign,DataCostElementLaunchAssign,
    BPSpaceElemsFactory, BProcessesFactory, BProcessFactory, BPStationsFactory, BPServicesFactory, DataCostLaunchAssign, DataCostCollection, LaunchElementTopologsFactory,
    $location) {

      console.log('launchDataController');


      $scope.insideProcess = false;
      if ($scope.$parent.session !== undefined) {
        $scope.inlineLaunchShow = $scope.$parent.session.inlineLaunchShow;
      } else {
        $scope.inlineLaunchShow = true;
      }



    if ($scope.launchId !== undefined) {
          $scope.launchId = $scope.$parent.session_id;
          $scope.processId = $scope.$parent.bpId;
    } else {
      $scope.launchId = $scope.session_id;
      $scope.bpId ? $scope.processId = $scope.bpId :  $scope.processId = $scope.BPid;
      //$scope.processId = $scope.bpId;
    }
    if ($scope.launchId == undefined) {
      $scope.insideLaunch = false;
    } else {
      $scope.insideLaunch = true;
    }

    console.log('$scope.launchId are',$scope.launchId, $scope.insideLaunch, $scope.launchId == undefined);
    console.log('$scope.processId are',$scope.processId);

/*
minorityAppServices.factory('DataCostCollection', ['$resource', function ($resource) {
    return $resource(baseUrl + 'data/cost/collection/', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);

minorityAppServices.factory('DataCostAssign', ['$resource', function ($resource) {
    return $resource(baseUrl + 'data/cost/assigns/:BPid', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);
minorityAppServices.factory('DataCostLaunchAssign', ['$resource', function ($resource) {
    return $resource(baseUrl + 'data/cost/launch_assigns/:launchId', {}, {
        query: { method: 'GET', isArray: false }
    })
**/

$scope.loadFiles = function() {
  console.log('load files');
// GET     /launch_files/launch_id
var filePromise = $http.get('/launch_files/'+$scope.launchId);
filePromise.success(function (data) {
          // Stores the token until the user closes the browser window.
          $scope.files = data;
          _.forEach($scope.files.files, function(f) {
            //console.log('f are', f);
            var fileName = f.fileUrl.split("minority-uploads/")[1].split("+")[0];
            var hash = f.fileUrl.split("minority-uploads/")[1].split("+")[1].split("?")[0];
            if (f.fileUrl.split("minority-uploads/")[1].split("+")[1]) {
              var sign = f.fileUrl.split("minority-uploads/")[1].split("+")[1].split("?sig=")[1]
              return f.fileUrl = location.origin+"/downloadFile/"+fileName+"/"+hash+"/sig="+sign
            } else {
              return f.fileUrl = "";
            }
          })
          return data;
      })
      .error(function () {
      });
      return filePromise;
}

if ($scope.$parent.inSession == undefined || $scope.$parent.inSession == true) {
  $scope.loadFiles();
}

$scope.topoLoading = function() {
  return $scope.launchTopologsP = LaunchElementTopologsFactory.query({ launch_id: $scope.launchId }).$promise.then(function(data) {
    $scope.launchTopologs = data;
    console.log('$$scope.launchTopologs', $scope.launchTopologs);
  });
};


$scope.loadData = function(onlyTopologs) {
  var deferred = $q.defer();

/*
  if (onlyTopologs) {
    //$scope.topoLoading();

    $scope.dataCostElementLaunchAssign = undefined;
    $scope.dataCostAssignP = undefined;
    $scope.dataCostCollectionP = undefined;
  } else {
*/
  //$scope.topoLoading();

  $scope.dataCostElementLaunchAssignP = DataCostElementLaunchAssign.query( { launchId: $scope.launchId } ).$promise.then(function(data){
     $scope.sessionCosts  = data;
     $scope.sessionCosts1 = data;

     console.log('$scope.sessionCosts', $scope.sessionCosts);
  });
  $scope.dataCostAssignP = DataCostAssign.query({BPid: $scope.processId }).$promise.then(function(data){
    $scope.processCosts = data;
    console.log('$scope.processCosts', $scope.processCosts);
  });
  $scope.dataCostCollectionP = DataCostCollection.query().$promise.then(function(data) {
    $scope.avalCosts = data;
    console.log('$$scope.avalCosts', $scope.avalCosts);
  });
  $scope.loadFiles();


  /*}*/
  //$scope.dataCostElementLaunchAssignP.then(function(a){
  //  $scope.dataCostAssignP.then(function(b){
  //    $scope.launchTopologsP.then(function(c){
  //      $scope.dataCostCollectionP.then(function(d){
  //        deferred.resolve();
  //      });
  //    });
//    });
  //});
  deferred.resolve({
    dataCostElementLaunchAssignP: $scope.dataCostElementLaunchAssignP,
    dataCostAssignP: $scope.dataCostAssignP,
    //launchTopologsP: $scope.launchTopologsP,
    dataCostCollectionP: $scope.dataCostCollectionP
  });


  return deferred.promise;
}





if ($scope.$parent.inSession == undefined || $scope.$parent.inSession == true) {

/***
 * Execute loading
 */
if ($scope.inlineLaunchShow) {
  console.log("load counter", this);
  if ($scope.insideLaunch) {
    console.log('we are inside the launch page');
    $scope.loadData(false);
  } else {
    console.log('we are not inside the launch page');
    $scope.loadData(true);
  }

} else {
  console.log('we are outside')
  $scope.loadData(true);
  $scope.$parent.pushBboardTRigger($scope.launchId, function(){ return $scope.loadData(); }, 'launchDataTrigger');
}

}



$scope.$on('resourceUpdate', function(event, session_id) {
  $scope.loadData();
});


$scope.uploadFiles = function (files) {
    $scope.files = files;
    if (files && files.length) {
        Upload.upload({
            url: 'uploadLaunchFile/'+$scope.launchId,
            data: {
                files: files
            }
        }).then(function (response) {
            $scope.loadFiles();

        }, function (response) {
            if (response.status > 0) {
                $scope.errorMsg = response.status + ': ' + response.data;
            }
        }, function (evt) {
            $scope.progress =
                Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
        });
    }
};


$scope.uploadFilesForElement = function (files,element) {
    //var trueElementId = _.find($scope.launchTopologs,function(t){ return element.id === t.element_id });
    $scope.files = files;
    if (files && files.length) {
        Upload.upload({
            url: 'uploadLaunchFile/'+$scope.launchId+'?element_id='+element.topo_id.id,
            data: {
                files: files
            }
        }).then(function (response) {
            $scope.loadFiles();

        }, function (response) {
            if (response.status > 0) {
                $scope.errorMsg = response.status + ': ' + response.data;
            }
        }, function (evt) {
            $scope.progress =
                Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
        });
    }
};



$scope.addFile = function() {

}
$scope.removeFile = function(file) {
  console.log(file);
  var filePromise = $http.post('/uploadLaunchFile/delete/'+file.launchFile.id);
  filePromise.success(function (data) {
            // Stores the token until the user closes the browser window.
            $scope.loadFiles();
            return data;
        })
        .error(function () {
        });
        return filePromise;
  // POST     /uploadLaunchFile/delete/:launchFileId
}





$scope.fillValue = function(cost, newModelValue, obj) {
  console.log(cost, newModelValue);
//        POST  /data/launch/:launch_id/values/fill
    var reqProm = $http.post('/data/launch/'+$scope.launchId+'/values/fill', {});
      reqProm.success(function(data){ console.log(data); });
//        POST  /data/launch/:launch_id/values/refill


      console.log(cost);
      // entityId: String, launchId: Int, resourceId: Int
      var resourceId = obj.resource_id;
      var launchId = $scope.launchId;
      var entityId = cost.entity.id;
      var boardId = cost.entity.boardId;
      var slat = cost.value;

      var req = {title: cost.entity.title, boardId: boardId, entityId: entityId, meta: [{'key': 'elementId', 'value': obj.element_id.toString() }], sval: newModelValue, publisher: ''};
      if (cost.value === undefined) {
        $http.post(jsRoutes.controllers.DataController.fill_slat(entityId, launchId, resourceId).absoluteURL(document.ssl_enabled),
                          req).then(function (data) {
                            console.log(data);
                            if ($scope.insideLaunch) {
                                $scope.loadData();
                            }
        });
      } else {
        $http.post(jsRoutes.controllers.DataController.refill_slat(entityId, launchId, resourceId, slat.id).absoluteURL(document.ssl_enabled),
                          req).then(function (data) {
                            console.log(data);
                            if ($scope.insideLaunch) {
                                $scope.loadData();
                            }
        });
      }

}

$scope.clearCost = function(cost, obj) {
//        POST  /data/launch/:launch_id/values/clear
    var reqProm = $http.post('/data/launch/'+$scope.launchId+'/values/clear', {});
    reqProm.success(function(data){ console.log(data); });
    console.log(obj);

    // entityId: String, launchId: Int, resourceId: Int
    var resourceId = obj.resource_id;
    var launchId = $scope.launchId;
    var entityId = cost.entity.id;
    var boardId = cost.entity.boardId;
    var slat = cost.value;

    var req = {title: cost.entity.title, boardId: boardId, entityId: entityId, meta: [{'key': 'elementId', 'value': obj.element_id.toString() }], sval: '', publisher: ''};
    $http.post(jsRoutes.controllers.DataController.refill_slat(entityId, launchId, resourceId, slat.id).absoluteURL(document.ssl_enabled),
                      req).then(function (data) {
                        console.log(data);
                        if ($scope.insideLaunch) {
                            $scope.loadData();
                        }
    });

}


$scope.editCost = function() {

}


$scope.removeCostWithValue = function(cost) {
  console.log(cost);
   // delete_resource
   var resourceId = 0;
   var req = {};
    $http.post(jsRoutes.controllers.DataController.delete_resource(resourceId).absoluteURL(document.ssl_enabled),
                      req).then(function (data) {
                        console.log(data);
                        if ($scope.insideLaunch) {
                            $scope.loadData();
                        }
    });   
}





$scope.editCostForLaunch = function() {

}
$scope.editCostForProcess = function() {

}


$scope.pullValueForCost = function() {

};

$scope.token = $window.sessionStorage.getItem('token');



$scope.createCostWithAssign = function(costs, element) {
  if ($scope.insideLaunch) {
    return $scope.createLaunchedAssignedResEls(costs, element);
  } else {
    return $scope.createAssignedResEls(costs, element);
  }
}
$scope.deleteCost = function(cost) {
  if ($scope.insideLaunch) {
    return $scope.deleteLaunchAsssignedResEl(cost)
  } else {
    return $scope.deleteAsssignedResEl(cost)
  }
}


$scope.createAssignedResEl = function(cost) {
  // (elementId: Int, resourceId: Int, entityId: String = "*")
  console.log(cost);
  var req = {elementId: cost.element, resourceId: cost.resource.resource.id, entityId: cost.entities};
  $http.post(jsRoutes.controllers.CostFillController.createCostElement(cost.resource.resource.id).absoluteURL(document.ssl_enabled),
                    [req]).then(function (data) {
                      console.log(data);
  });
};

$scope.createAssignedResEls = function(costs, element) {
  var elementId = element.topo_id.id;
  //_.find($scope.launchTopologs,function(t){ return elementIdPlain === t.element_id });
  // (elementId: Int, resourceId: Int, entityId: String = "*")
  console.log(costs);
  var reqs = _.map(costs, function(cost) { return  {elementId: elementId,
                                                    resourceId: costs.resource.resource.id,
                                                    entityId: costs.entities}; });
  $http.post(jsRoutes.controllers.CostFillController.createCostElement(0).absoluteURL(document.ssl_enabled),
                    reqs ).then(function (data) {
                      $scope.loadData();
                      console.log(data);
  });
};


$scope.createLaunchedAssignedResEls = function(costs, element) {
  var elementId = element.topo_id.id;
  //var elementId = _.find($scope.launchTopologs,function(t){ return elementIdPlain === t.element_id });
  // (elementId: Int, resourceId: Int, entityId: String = "*")
  console.log(costs);
  //var reqs = _.map(costs, function(cost) { return  {elementId: elementId, resourceId: costs.resource.resource.id,
  //                                                  entityId: costs.entities}; });

  var newReqs = [{elementId: elementId, resourceId: costs.resource.resource.id,
                                                    entityId: costs.entities.id,
                                                    value: costs.value }];

  $http.post(jsRoutes.controllers.CostFillController.createLaunchCostElement(costs.resource.resource.id,
                                                                           $scope.launchId).absoluteURL(document.ssl_enabled),
                    newReqs ).then(function (data) {


                      $scope.loadData();
                      console.log(data);
  });
};


// POST /data/cost/del_assign/:resource_id
$scope.deleteAsssignedResEl = function(cost) {
  //$('/data/cost/del_assign/:resource_id')
  console.log(cost);
  $http.post(jsRoutes.controllers.CostFillController.delete_assigned_element(cost.id).absoluteURL(document.ssl_enabled), {
                    headers:  {'X-Auth-Token': $scope.token, 'Access_Name': 'user'}}).then(function (data) {
                      $scope.loadData();
                      console.log(data);
  });
};

// POST /data/cost/del_launch_assign/:resource_id
$scope.deleteLaunchAsssignedResEl = function(cost) {
  //$('/data/cost/del_launch_assign/:resource_id')
  console.log(cost);
  $http.post(jsRoutes.controllers.CostFillController.delete_launch_assigned_element(cost.obj.id).absoluteURL(document.ssl_enabled), {
                    headers:  {'X-Auth-Token': $scope.token, 'Access_Name': 'user'}}).then(function (data) {
                      $scope.loadData();
                      console.log(data);
  });
};



$scope.entityDecorator = function(entities, resource) {
  if (resource == undefined) {
    resource = {};
    resource.entity = [];
  }

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


// Private
$scope.metaExisted = function(meta, key) {
    return _.filter(meta, function(meta) {
          return (meta.key == key && meta.value.length < 1)
        }).length < 1;
}

$scope.byElement = function(element) {
  return function(obj) {
    //console.log('obj', obj);
    //console.log('element', element);
    if (element) {
    var trueElementId = element.topo_id.id;//_.find($scope.launchTopologs,function(t){ return element.id === t.element_id });
     if (trueElementId !== undefined && trueElementId !== undefined && obj.obj.element_id === trueElementId) {
       return obj;
     } else {
       return false;
     }
   } else { return false; }
 }
}

$scope.filesForLaunchElement = function(element) {
  return function(obj) {
    //console.log('element', element);

    var trueElementId = element.topo_id.id;//_.find($scope.launchTopologs,function(t){ return element.id === t.element_id });
    if (obj.launchFile !== undefined && trueElementId !== undefined && obj.launchFile.element == trueElementId) {
       return obj;
    } else {
       return false;
    }
 }
}
$scope.filesForLaunch = function() {
  return function(obj) {
    //console.log('obj', obj);
    //console.log('element', element);
     if (obj.launchFile.element == undefined) {
       return obj;
     } else {
       return false;
     }
 }
}


/***************************************************************************************
 * Select or create indicator
 **************************************************************************************/
  var vm = this;
  vm.name = 'World';
  vm.tables = [{
    id: 1,
    description: 'Front'
  }, {
    id: 2,
    description: 'Back'
  }];
  vm.drinksList = [ {
    id: 1,
    description: 'Cola'
  }, {
    id: 2,
    description: 'Water'
  }];
  vm.order = {};
  
  vm.refreshResults = refreshResults;
  vm.clear = clear;
  
  function refreshResults($select){
    var search = $select.search,
      list = angular.copy($select.items),
      FLAG = -1;
    //remove last user input
    list = list.filter(function(item) { 
      return item.id !== FLAG; 
    });
  
    if (!search) {
      //use the predefined list
      $select.items = list;
    }
    else {
      //manually add user input and set selection
      var userInputItem = {
        id: FLAG, 
        description: search
      };
      $select.items = [userInputItem].concat(list);
      $select.selected = userInputItem;
    }
  }
  
  function clear($event, $select){
    $event.stopPropagation(); 
    //to allow empty field, in order to force a selection remove the following line
    $select.selected = undefined;
    //reset search query
    $select.search = undefined;
    //focus and open dropdown
    $select.activate();
  }











}]);

});
