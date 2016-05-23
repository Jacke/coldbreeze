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

      $scope.insideLaunch = false;
      $scope.insideProcess = false;

      if ($scope.$parent.session_id !== undefined) {
        $scope.insideLaunch = true;
      }


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
    $scope.loadData = function() {
      var deferred = $q.defer();

      $scope.dataCostElementLaunchAssignP = DataCostElementLaunchAssign.query( { launchId: $scope.$parent.session_id } ).$promise.then(function(data){
         $scope.sessionCosts = data;
         console.log('$scope.sessionCosts', $scope.sessionCosts);
      });
      $scope.dataCostAssignP = DataCostAssign.query({BPid: $scope.$parent.bpId }).$promise.then(function(data){
        $scope.processCosts = data;
        console.log('$scope.processCosts', $scope.processCosts);
      });
      $scope.launchTopologsP = LaunchElementTopologsFactory.query({ launch_id: $scope.$parent.session_id }).$promise.then(function(data) {
        $scope.launchTopologs = data;
        console.log('$$scope.launchTopologs', $scope.launchTopologs);

      });
      $scope.dataCostCollectionP = DataCostCollection.query().$promise.then(function(data) {
        $scope.avalCosts = data;
        console.log('$$scope.avalCosts', $scope.avalCosts);
      });

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
        launchTopologsP: $scope.launchTopologsP,
        dataCostCollectionP: $scope.dataCostCollectionP
      });


      return deferred.promise;

    }

      if ($scope.insideLaunch) {
          $scope.loadData();
      }


      $scope.$on('resourceUpdate', function(event, session_id) {
        $scope.loadData();
      });


      $scope.uploadFiles = function (files) {
          $scope.files = files;
          if (files && files.length) {
              Upload.upload({
                  url: 'uploadLaunchFile/'+$scope.$parent.session_id,
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
          var trueElementId = _.find($scope.launchTopologs,function(t){ return element.id === t.element_id });
          $scope.files = files;
          if (files && files.length) {
              Upload.upload({
                  url: 'uploadLaunchFile/'+$scope.$parent.session_id+'?element_id='+trueElementId.topo_id,
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

      $scope.loadFiles = function() {
      // GET     /launch_files/launch_id
      var filePromise = $http.get('/launch_files/'+$scope.$parent.session_id);
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
      $scope.loadFiles();

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
          var reqProm = $http.post('/data/launch/'+$scope.$parent.session_id+'/values/fill', {});
            reqProm.success(function(data){ console.log(data); });
//        POST  /data/launch/:launch_id/values/refill


            console.log(cost);
            // entityId: String, launchId: Int, resourceId: Int
            var resourceId = obj.resource_id;
            var launchId = $scope.$parent.session_id;
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
          var reqProm = $http.post('/data/launch/'+$scope.$parent.session_id+'/values/clear', {});
          reqProm.success(function(data){ console.log(data); });
          console.log(obj);

          // entityId: String, launchId: Int, resourceId: Int
          var resourceId = obj.resource_id;
          var launchId = $scope.$parent.session_id;
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
      $scope.removeCost = function() {

      }





      $scope.editCostForLaunch = function() {

      }
      $scope.editCostForProcess = function() {

      }


      $scope.pullValueForCost = function() {

      };

      $scope.token = $window.sessionStorage.getItem('token');



      $scope.createCostWithAssign = function(costs, elementIdPlain) {
        if ($scope.insideLaunch) {
          return $scope.createLaunchedAssignedResEls(costs, elementIdPlain);
        } else {
          return $scope.createAssignedResEls(costs, elementIdPlain);
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

      $scope.createAssignedResEls = function(costs, elementIdPlain) {
        var elementId = _.find($scope.launchTopologs,function(t){ return elementIdPlain === t.element_id });
        // (elementId: Int, resourceId: Int, entityId: String = "*")
        console.log(costs);
        var reqs = _.map(costs, function(cost) { return  {elementId: elementId.topo_id,
                                                          resourceId: costs.resource.resource.id,
                                                          entityId: costs.entities}; });
        $http.post(jsRoutes.controllers.CostFillController.createCostElement(0).absoluteURL(document.ssl_enabled),
                          reqs ).then(function (data) {
                            $scope.loadData();
                            console.log(data);
        });
      };


      $scope.createLaunchedAssignedResEls = function(costs, elementIdPlain) {
        var elementId = _.find($scope.launchTopologs,function(t){ return elementIdPlain === t.element_id });
        // (elementId: Int, resourceId: Int, entityId: String = "*")
        console.log(costs);
        //var reqs = _.map(costs, function(cost) { return  {elementId: elementId, resourceId: costs.resource.resource.id,
        //                                                  entityId: costs.entities}; });

        var newReqs = [{elementId: elementId.topo_id, resourceId: costs.resource.resource.id,
                                                          entityId: costs.entities}]
        $http.post(jsRoutes.controllers.CostFillController.createLaunchCostElement(costs.resource.resource.id,
                                                                                 $scope.$parent.session_id).absoluteURL(document.ssl_enabled),
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
        $http.post(jsRoutes.controllers.CostFillController.delete_launch_assigned_element(cost.id, $scope.$parent.session_id).absoluteURL(document.ssl_enabled), {
                          headers:  {'X-Auth-Token': $scope.token, 'Access_Name': 'user'}}).then(function (data) {
                            $scope.loadData();
                            console.log(data);
        });
      };



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
    var trueElementId = _.find($scope.launchTopologs,function(t){ return element.id === t.element_id });
     if (trueElementId !== undefined && obj.obj.element_id === trueElementId.topo_id) {
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
    var trueElementId = _.find($scope.launchTopologs,function(t){ return element.id === t.element_id });

    if (obj.launchFile !== undefined && obj.launchFile.element == trueElementId.topo_id) {
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




}]);

});
