define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

// INDEX
return minorityControllers.controller('BProcessListCtrl', ['$q','$rootScope',
  '$scope',
  '$window',
  '$translate',
  '$rootScope',
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
  'BPSpaceElemsFactory',
  'BProcessesFactory',
  'BProcessFactory',
  'BPStationsFactory',
  'BPServicesFactory',
  '$location',
  function ($q, $rootScope,$scope, $window, $translate, $rootScope,CacheFactory,AllBPLogsFactory,AllLaunchedElementsBulkFactory, AllElementsBulkFactory, InteractionsBulkFactory, BPElemsFactory, RefsFactory, TreeBuilder, NotificationBroadcaster,SessionsFactory, ngDialog, $http, $routeParams, $filter, BPElemsFactory, BPSpacesFactory, BPSpaceElemsFactory, BProcessesFactory, BProcessFactory, BPStationsFactory, BPServicesFactory, $location) {

$scope.changeLanguage = function () {
  $translate.use($rootScope.lang);
};
$scope.changeLanguage();

$scope.search = function() {
  return function(obj) {
    //console.log('obj', obj);
    //console.log('element', element);
    if ($scope.searchValue == undefined || $scope.searchValue == "") {
      return obj
    } else {
      if (obj.title.includes($scope.searchValue)) {
        return obj;
      } else {
        return false;
      }
    }
 }
}


$scope.cacheFactory = CacheFactory;


$scope.isManager = function () {
  if ($scope.isManagerVal == undefined && $rootScope.manager != undefined) {
    $scope.isManagerVal = $rootScope.manager;
    return $scope.isManagerVal;
  } else {
    return $window.sessionStorage.manager == "true";
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
          return data;
      })
      .error(function () {
      });
}

$scope.cancelSession = function (session) {
    $http({
      url: '/bprocess/' + session.process.id + '/session/' + session.session.id + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {

        $scope.reloadSessions();
        // success

      },
      function(response) { // optional
        // failed
      }
      );
}




$scope.showInlineLaunch = function (session) {
  if (session.inlineLaunchShow) {
    session.inlineLaunchShow = false;
  } else {
    session.inlineLaunchShow = true;
    var t = _.find($scope.bboardTriggers, function(t) {
      return session.session.id == t.launchId
    });
    if (t) {
      t.triggerFn();
    }

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
      template: '/assets/partials/share/share.html',
      controller: 'ProcShareCtrl',
      scope: $scope
    });
  };
$scope.filterForActiveLaunch = function(ses) {
/*   if ((ses.percent !== 100 && ses.station != undefined
     && ses.station.finished == false
     && ses.station.paused == true
     && ses.station.state == true) || (
       ses.percent !== "100"
     )

   )
*/
   if (ses.percent !== "100" && ses.percent !== 100)
   {
      return ses;
    } else {
      return false;
    }
}
$scope.isEmptyProcesses = false;
$scope.isEmptyProcessesCheck = function() {
  //$rootScope.$on('cfpLoadingBar:completed', function(event, data){


  if ($scope.bprocesses != undefined && $scope.bprocesses.length > 0) {
    $scope.isEmptyProcesses = false;
  } else {
    $scope.isEmptyProcesses = true;
  }
  //});
}

//$scope.isEmptyLaunchesCheck();
$rootScope.$on('cfpLoadingBar:completed', function(event, data){
      $scope.isEmptyProcessesCheck();
});

$scope.perm = function(proc_id) {
  $scope.BPid = proc_id;
  ngDialog.open({
    template: '/assets/partials/perms/perm-list.html',
    controller: 'BPPermListCtrl',
    scope: $scope
  });
};

$scope.business = $rootScope.business;

$scope.deleteBP = function (bpId) {
  BProcessFactory.delete({ id: bpId }).$promise.then(function(data) {
      $scope.loadProcesses().then(function() {
          $scope.reloadSessions();
      });
      /*
      $scope.bprocesses = BProcessesFactory.query();
      $scope.bprocesses.$promise.then(function (processes) {
        var process_ids = _.map(processes, function(proc) { return proc.id });
        $scope.allElementsPromise = AllElementsBulkFactory.queryAll({
                                              ids: (process_ids + '').split(',').join('') });
        $scope.allElementsPromise.$promise.then(function (d) {
          $scope.allElements = d;
          console.log("132",$scope.allElements);
        });
        _.forEach(processes, function(proc) {
              TreeBuilder.buildFetch(proc, $scope.allElementsPromise, function(success){});
        });
      });
      */


  });
};

$scope.hasActiveStation = function (bprocess) {
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
      template: '/assets/partials/bprocesses/bp-new.html',
      controller: 'BPCreationCtrl',
      scope: $scope
    });
};



  $scope.services = BPServicesFactory.query();


$scope.loadLaunchesFromCache = function() {
  var launchesCache;
  var launchesCursosCache;
  // 1. create cursor and cache
  if ($scope.cacheFactory.get('launchesCache') == undefined) {
      $scope.cacheFactory.createCache('launchesCache',{storageMode: 'sessionStorage'}); }
  if ($scope.cacheFactory.get('launchesCursosCache') == undefined) {
      $scope.cacheFactory.createCache('launchesCursosCache',{storageMode: 'sessionStorage'}); }


  launchesCache = $scope.cacheFactory.get('launchesCache');
  launchesCursorCache = $scope.cacheFactory.get('launchesCursosCache');
  if (launchesCursorCache.get('updated') == undefined) {
  CacheFactory.get('launchesCursosCache').put('updated', 0) }
  if (launchesCache.get('launches') == undefined) {
    launchesCache.put('launches', []);
  }

  // 3. Make request
  return $http.get('/sessions/cached/'+launchesCursorCache.get('updated'))
          .then(function (resp) {
            // 4. Split C and D and apply C for new created resources

            var removedIds = _.map(resp.data.deltas.d, function(d) { return parseInt(d.resourceId) });
            //console.log('removedIds', removedIds)

            var oldLaunches = _.forEach(launchesCache.get('launches'), function(d) {
              return d.sessions = _.filter(d.sessions, function(d) {
                                                        return !_.contains(removedIds, d.session.id) })
            });
            //.concat(resp.data.c);
            //var finalizedLaunch = _.filter(concatedLaunches, function(c){ return !_.contains(removedIds, c.id) });
            var newLaunches = resp.data.c
            _.forEach(oldLaunches, function(oldLaunchCn) {
              return _.forEach(newLaunches, function(launchCn) {
                if (launchCn.process.id == oldLaunchCn.process.id) {
                  return oldLaunchCn.sessions = oldLaunchCn.sessions.concat(launchCn.sessions)
                }
              });
            });
            function percParse(perc) {
              return perc.split(/(percent: (\d*) )/)[2]; //"percent: 100 step: 5.0 "
            }
            function stepParse(perc) {
              var re = /(?!step: )(\d).(\d)/g
              return perc.match(re)[0].split('.')[0];
            }

            var finalizedLaunches = oldLaunches.concat(newLaunches)
  /**************************************************************************************************************
     Update percent
  **************************************************************************************************************/
            var dates = _.sortBy(resp.data.deltas.u, 'date');
            var newPercents = _.map(dates, function(perc) {
                return { launchId: parseInt(perc.resourceId), step: stepParse(perc.updatedAttributes),
                  percent: percParse(perc.updatedAttributes) }
              });

            _.forEach(finalizedLaunches, function(finLaunchCn) {
              return _.forEach(finLaunchCn.sessions, function(sessionStatus) {
                var isProcentExist = _.find(newPercents, function(d){
                    return d.launchId === sessionStatus.session.id })
                  if (isProcentExist !== undefined) {
                    console.log('update percent', isProcentExist.percent)
                    sessionStatus.station.step = isProcentExist.step;
                    return sessionStatus.percent = isProcentExist.percent;
                  } else {
                    return sessionStatus;
                  }
              });
            })


            launchesCache.put('launches', finalizedLaunches);
            // 5. D for resource with ids that need to be removed
            launchesCache.put('launchesRemoved', resp.data.d)
            // 6. Put request to cache and update cursor
            //console.log('old cursor', launchesCursorCache.get('updated'))
            launchesCursorCache.put('updated', Date.now());
            //console.log('new cursor', launchesCursorCache.get('updated'))

            // 7. Return resource itself
            return launchesCache.get('launches');
          });


}

$scope.loadProcessesFromCache = function() {
  var processesCache;
  var processesCursosCache;
  // 1. create cursor and cache
    if ($scope.cacheFactory.get('processesCache') == undefined) {
        $scope.cacheFactory.createCache('processesCache',{storageMode: 'sessionStorage'}); }
    if ($scope.cacheFactory.get('processesCursosCache') == undefined) {
        $scope.cacheFactory.createCache('processesCursosCache',{storageMode: 'sessionStorage'}); }


  processesCache = $scope.cacheFactory.get('processesCache');
  processesCursorCache = $scope.cacheFactory.get('processesCursosCache');
  if (processesCursorCache.get('updated') == undefined) {
  CacheFactory.get('processesCursosCache').put('updated', 0) }
  if (processesCache.get('processes') == undefined) {
    processesCache.put('processes', []);
  }

  // 3. Make request
  return $http.get('/bprocesses/cached/'+processesCursorCache.get('updated'))
          .then(function (resp) {
            // 4. Split C and D and apply C for new created resources
            var removedIds = _.map(resp.data.deltas.d, function(d) { return parseInt(d.resourceId) });
            var concatedProcess = processesCache.get('processes').concat(resp.data.c);
            var finalizedProcess = _.filter(concatedProcess, function(c){ return !_.contains(removedIds, c.id) });
            processesCache.put('processes', finalizedProcess);
            // 5. D for resource with ids that need to be removed
            processesCache.put('processesRemoved', resp.data.deltas.d)
            // title:.(\S+\s+\S+|\S+).service:

            var updatedTitles = _.map(resp.data.deltas.u, function(d) {
              return {id: parseInt(d.resourceId), title: d.updatedAttributes.split(/title:.(\S+\s+\S+|\S+).service:/)[1] }
            });
            if (updatedTitles.length > 0){
              var concatedProcess = _.forEach(processesCache.get('processes'), function(proc) {
                var newTitle = _.filter(updatedTitles, function(d) { return d.id == proc.id });
                if (newTitle.length > 0 && (newTitle[0].title !== undefined || newTitle[0].title !== "") ) {
                  return proc.title = newTitle[0].title;
                }
              });
              processesCache.put('processes', concatedProcess);
            }
            // 6. Put request to cache and update cursor
            processesCursorCache.put('updated', Date.now());
            // 7. Return resource itself
            return processesCache.get('processes');
          });

}


$scope.loadProcesses = function() {

  if ($routeParams.service != undefined) {
      $scope.bprocesses = $scope.loadProcessesFromCache();
      $scope.bprocesses.then(function(data){//.$promise.then(function(data){
        $scope.service_id = $routeParams.service;
        console.log(data)
        console.log("push data to bprocesses", _.filter(data, function(proc){ return proc.service == $routeParams.service }))
        $scope.bprocesses = _.filter(data, function(proc){ return proc.service == $routeParams.service });
      });

  } else {
      $scope.bprocesses = $scope.loadProcessesFromCache();//BProcessesFactory.query();
      $scope.bprocesses.then(function(data){//.$promise.then(function(data){
        $scope.bprocesses = data;
      });
  }

// Init thumb
return  $scope.bprocesses.then(function(processes) {
        var process_ids = _.map(processes, function(d){
              return 'ids='+d.id+'&'
        });


        $scope.allLogsPromise = AllBPLogsFactory.query({ids: (process_ids + '').split(',').join('') });
        //AllBPLogsFactory
        $scope.allLogsPromise.$promise.then(function(d) {
          $scope.allLogs = d;

        })

        $scope.allElementsPromise = AllElementsBulkFactory.queryAll({
                                              ids: (process_ids + '').split(',').join('') });
        $scope.allElementsPromise.$promise.then(function (d) {
          $scope.allElements = d;
          console.log("132",$scope.allElements);
        });
        _.forEach(processes, function(proc) {
              // Add bulk process elements loading

              TreeBuilder.buildFetch(proc, $scope.allElementsPromise, function(success){});
        });



        // url param for opening fast elem create form
        if ($window.location.hash.split('fast_proc=')[1] != undefined) {
          console.log(window.location.hash.split('fast_proc=')[1])
          var proc  = _.find($scope.bprocesses, function(proc) { return proc.id == parseInt($window.location.hash.split('fast_proc=')[1]) });
          //if (proc != undefined) {
            console.log(proc);
            $scope.switchFastElementForm(proc);
          //}
        }

    _.forEach(processes, function(proc) { TreeBuilder.buildFetch(proc, $scope.allElementsPromise, function(success){
        $('.process_content .tree-thumb.process-tree').dragOn();
    }); });

  });

};

$scope.loadProcesses();




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




// New form
if ($window.location.hash.split("?")[1] == "new") {
  console.log("new form");
  $scope.createNewBP();
}

$scope.stations = BPStationsFactory.query();

$scope.stations.$promise.then(function(data) {
  $scope.stations = _.forEach(data, function(d) { d.inlineLaunchShow = false; return d });
});

$scope.bpElemLength = $http.get(
  jsRoutes.controllers.ProfileController.dashboard().absoluteURL(document.ssl_enabled) + 'bprocess/elems_length')
      .success(function (data) {
          // Stores the token until the user closes the browser window.
          $scope.bpElemLength = data;
      }).error(function () {  });

$scope.stationPercent = function(proc_id) {
  /*var found = $filter('filter')($scope.bpElemLength, {id: station.process});

  if (found.length) {
           return found[0];
       } else {
           100;
       }*/
       //$scope.bpElemLength.$promise.then(function(data) {
           $scope.bpElemLength[proc_id];
   //});
};

$scope.parsePercent = function(num) {
  return parseInt(num);
};

$scope.openInvoke = function(proc_id) {
  $scope.bpId = proc_id;
  ngDialog.open({
    template: '/assets/partials/inputs/inputs.html',
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


$scope.capitalizeFirstLetter = function (string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}



/*******
 * Services
 *******/
$scope.nestedRequestScopes = [];

$scope.isProcessPage = true;


$scope.reloadSessions = function() {

  var deferred = $q.defer();

  //SessionsFactory.query()
  $scope.loadLaunchesFromCache().then(function (sessions) {

  var session_ids = _.map(sessions, function(d){
      return _.map(_.filter(d.sessions, function(fd) {
        return (fd !== null && fd.station !== undefined) && (fd !== null && fd.station.finished != true);
      }), function(dd){
        return 'ids='+dd.session.id+'&'
    });
  });


  $scope.sessions = sessions;




  $scope.allLaunchedElemPromise = AllLaunchedElementsBulkFactory.queryAll({ids: (session_ids + '').split(',').join('') });
  $scope.allLaunchedElemPromise.$promise.then(function (d) {
      $scope.allLaunchedElem = d;
      //$scope.interactionContainerLaunch = d;
    //  console.log("132",$scope.allLaunchedElem);
      deferred.resolve();
    //  console.log($scope.interactionContainerLaunch);
    //  console.log($scope.sessions);
  });

$scope.interactionContainerPromise =  InteractionsBulkFactory.queryAll({ids: (session_ids + '').split(',').join('') });

$scope.interactionContainerPromise.$promise.then(function(d) {
  $scope.interactionContainerLaunch = d;
})




  _.forEach($scope.sessions, function(session_cn) {
    _.forEach(session_cn.sessions, function(session) { return session.session.station = session.station });
  });

  if ($scope.bprocesses.then !== undefined) { // check if it's promises
  $scope.bprocesses.then(function (processes) {
    _.forEach(processes, function(proc) {
      proc.sessions = _.filter($scope.sessions, function(ses) { return ses.process.id == proc.id });
    });
  });
  } else {
    _.forEach($scope.bprocesses, function(proc) {
      return proc.sessions = _.filter($scope.sessions, function(ses) { return ses.process.id == proc.id });
    });
  }


  });

  return deferred.promise;
};





$scope.reloadSession = function(session_id) {
  //SessionsFactory.query()
  $scope.loadLaunchesFromCache().then(function (sessions) {

  var session_ids = _.map(sessions, function(d){
      return _.map(_.filter(d.sessions, function(fd) {
        return (fd.station !== undefined) && (fd.station.finished != true);
      }), function(dd){
        return 'ids='+dd.session.id+'&'
    })
  });


  $scope.sessions = sessions;


$scope.interactionContainerPromise =  InteractionsBulkFactory.queryAll({ids: (session_ids + '').split(',').join('') });

$scope.interactionContainerPromise.$promise.then(function (d) {
    $scope.interactionContainerLaunch = d;
    console.log($scope.interactionContainerLaunch);
    console.log($scope.sessions);


    $scope.$broadcast('newInteractionsForLaunch', {session_id: session_id, updatedInteraction: d});
    $scope.$broadcast('reloadElementRoutine', session_id);


  _.forEach($scope.sessions, function(session_cn) {
    _.forEach(session_cn.sessions, function(session) { return session.session.station = session.station });
  });

  //if ($scope.bprocesses.then !== undefined) { // check if it's promises
  //  $scope.bprocesses.$promise(function (processes) {
//      _.forEach(processes, function(proc) {
//        proc.sessions = _.filter($scope.sessions, function(ses) { return ses.process.id == proc.id });
//      });
//    });
  //}

  });

  });

};

$scope.reloadSessionsPromise = $scope.reloadSessions();
// Session lock by notification
// NotificationBroadcaster
$scope.$on('launchLocker', function(event, args) {
  console.log('launchLocker');
    console.log(event);
    console.log(args);
    $scope.reloadSessions();
    // do what you want to do
});






//BPInLoggersStationFactory.query({BPid: $route.current.params.BPid, session_id: stationId});

  /**
  *
  * Run initially
  *
  **/
$scope.run = function (process) {
      process.loading = true;
      $http({
      url: 'bprocess/' + process.id + '/invoke',
      method: "POST",
      data: {  },
      ignoreLoadingBar: true
      })
      .then(function(response) {
        // success
        process.loading = false;

        $scope.invoke_res = [response.data];
        //$location.path('/a#/bprocess/' + process.id + 'elements?session=' + parseInt(response.data.session));
        //$scope.loadLaunchesFromCache()
        $scope.reloadSessions();
      },
      function(response) { // optional
        // failed
        process.loading = false;

        new PNotify({
          title: 'Launch failed!',
          text: 'Can\'t launch process.',
          type: 'error'
        });
      }
      );
  }

  /***
   * Fast element creation
   */
$scope.fastCreateNewElem = function(elem,process) {
  console.log(elem);
  $scope.createNewElem(elem, process);
}
$scope.refs = [];
$scope.switchFastElementForm = function(process) {
  if ($scope.refs.length == 0) {
     $scope.refs = RefsFactory.query();
  }
  process.fastElForm == true ? process.fastElForm=false : process.fastElForm=true;
  if (process.fastElForm == undefined) {
    process.fastElForm = true;
  }
  console.log(process.fastElForm);
}


$scope.refElem = function (ref, elem) {
    elem.ref = ref.ref.id;
    elem.selectedRef = ref;
}
$scope.createNewElem = function (elem,process) {
    if (elem.desc == undefined) { // Allow empty description
      elem.desc = ""
    }
    BPElemsFactory.create(elem).$promise.then(function(data) {
      //$scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
      console.log("lighted");
      process.newBpelem = { title: "", desc: "", process: process.id, business: process.business };
      //$scope.reloadTree($scope.trees);
      $scope.switchFastElementForm(process);
      $scope.loadProcesses();

    });

};











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
      $scope.newObserver = ObserversFactory.create($scope.newObserver).$promise.then( function(data) {
         $scope.observers = ObserversFactory.query({ process: $scope.bpId, station: $scope.station});
         $scope.newObserver = {bprocess: $scope.bpId, station_id: $scope.station};
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

});
