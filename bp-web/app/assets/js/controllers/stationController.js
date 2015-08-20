define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

// For specific process
minorityControllers.controller('ProcLaunchesListCtrl', ['TreeBuilder', 
  '$http', 
  '$window', 
  '$translate',
  '$scope', 
  '$filter', 
  '$rootScope',
  'ProcPermissionsFactory',
  'BProcessesFactory',
  'BPSessionsFactory',
  'SessionsFactory',
  'ObserversFactory', 
  'ObserverFactory', 
  'BPInLoggersFactory',
  'BPElemsFactory',
  'BPSpacesFactory',
  'BPSpaceElemsFactory',
  'BPStationsFactory',
  'BPStationFactory', 
  'BPLogsFactory', 
  '$location', 
  '$route',
  function (TreeBuilder, $http, $window, $translate, $scope, $filter, $rootScope,ProcPermissionsFactory, BProcessesFactory,BPSessionsFactory,SessionsFactory, ObserversFactory, ObserverFactory,BPInLoggersFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {
  $scope.bpId = $route.current.params.BPid;
  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });


$scope.isManager = function () {
  if ($scope.isManagerVal == undefined && $rootScope.manager != undefined) {
    $scope.isManagerVal = $rootScope.manager;
    return $scope.isManagerVal;
  } else {
    return $window.localStorage.manager == "true";
  }
};


  $scope.loadPerm = function () {
  ProcPermissionsFactory.query({ BPid: $scope.bpId }).$promise.then(function(qu){
      $scope.perms = qu.elemperms;

      $scope.accounts = qu.accounts;
      $scope.emps = qu.employees;
      $scope.employee_groups = qu.employee_groups;
      _.forEach($scope.employee_groups, function(gr){ return gr.group = true; });
      $scope.groups = qu.employee_groups;
      $scope.employees_groups = _.union($scope.emps,$scope.employee_groups);
      _.forEach($scope.perms, function(perm) {
        if (perm.group != undefined) {
          perm.title = _.find($scope.groups, function(group) {return group.id == perm.group}).title;
        }
      })
  });
  }

$scope.accFetchSessioned = function (obj) {
  if (obj != undefined) { // it's employee

  var res = _.find($scope.accounts, function(cr){ return cr.userId == obj});
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
    return "Anonymous " + obj;
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


$scope.isManagerVal = $scope.isManager();
$scope.isManager();

  /* callback for ng-click 'editUser': */
  $scope.bpelems.$promise.then(function(data) {
    $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
        //$scope.builder();

  });
  });
  });

$scope.trees = undefined;
$scope.builder = function (station) {

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
  station.trees = _.forEach(bpelemsCopy, function(val) {
       val.nodes = _.sortBy(_.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; }), function(em){ return em.order; });
  });
  _.forEach(station.trees, function(tree) {

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




$scope.stationsRefresh = function() {

  BPStationsFactory.query({ BPid: $route.current.params.BPid }).$promise.then(function(data) {

           $scope.bpstations = data; 
           $scope.fetchObservers($scope.bpstations);     
      $scope.bpelems.$promise.then(function(data34) {
      $scope.spaces.$promise.then(function(data2) {
      $scope.spaceelems.$promise.then(function(data3) {
      $scope.logs.$promise.then(function(loggg) {
              _.forEach(data, function(station) { $scope.builder(station) });
    });
    });
    });
    });
         // Highlight


    });
};

$scope.stationsRefresh();


$scope.bubbleTooltip = function(session) {
  if (session.station.finished) {
    return  "Finished";
  } else if (session.station.paused) {
     return "Paused";
  } else if (session.station.started) { 
     return "Started";
  }
 

};
$scope.bubbleClass = function(session) {
  if (session.station.finished) {
    return  "finished";
  } else if (session.station.paused) {
     return "paused";
  } else if (session.station.started) { 
     return "started";
  }
};

$scope.highlightActive = function (station, elem) {
     var front, nest;
     //front = $scope.elemsHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].element];  
     //nest = $scope.spaceElemHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].space_elem];  
     //if (front != undefined && front.id == elem.id && station.finished == false) {
     //  return "active";
     //} 
     //if (nest != undefined && nest.id == elem.id && elem.space_owned != undefined && station.finished == false) {
     // return "active";
     //} else {
     return "passive"
     //}
  }

  $scope.logs = BPLogsFactory.query({  BPid: $route.current.params.BPid });

BProcessesFactory.query().$promise.then(function (proc) {
    if (proc.length > 0) {
      console.log('loadPerm');
      $scope.loadPerm(proc[0].id);
    };
    $scope.bprocesses = proc;
}); // load polyfill for accounts

  $scope.stationByProcess = function (processId) {
        var found = $filter('filter')($scope.bprocesses, {id: processId}, true);
         if (found.length) {
             return found[0];
         } else {
             '1';
         }
  }
$scope.listed = function (session) {
  $http({
      url: '/session/' + session.session.id + '/listed',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        $scope.loadSession();
        $scope.stationsRefresh();
        $route.reload();
        //$scope.invoke_res = [response];
      },
      function(response) { // optional
        // failed
      }
      );
} 
$scope.unlisted = function (session) {
  $http({
      url: '/session/' + session.session.id + '/unlisted',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        $scope.loadSession();
        $scope.stationsRefresh();
        $route.reload();
        //$scope.invoke_res = [response];
      },
      function(response) { // optional
        // failed
      }
      );
}

$scope.pin = function (session) {
  if (session.session.active_listed == true) {
    $scope.unlisted(session)
  }
  else {
    $scope.listed(session)
  }
}
$scope.isPinned = function (session) {
if (session.session.active_listed == true) {
      return "pinned";
  } else {
      return "";
  }
}

$scope.showInlineLaunch = function (session) {
  if (session.inlineLaunchShow) {
    session.inlineLaunchShow = false;
  } else {
    session.inlineLaunchShow = true;
  }
  return session;
}

$scope.cancelSession = function (session) {
    $http({
      url: '/bprocess/' + session.process.id + '/session/' + session.session.id + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        $location.path('/a#/bprocess/' + session.process.id + '/stations');
      },
      function(response) { // optional
        // failed
      }
      );
}
$scope.haltStation = function (stationId) {
  var bpId = $route.current.params.BPid ;
    $http({
      url: '/bprocess/' + bpId + '/station/' + stationId + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        $scope.stationsRefresh();
        //$scope.invoke_res = [response];
      },
      function(response) { // optional
        // failed
      }
      );

  }
  $scope.logsByStation = function (stationId) {
         var found = $filter('filter')($scope.logs, {station: stationId}, true);
         if (found.length) {
             return found;
         } else {
             '';
         }
  }
  $scope.onlyActive = false;
  $scope.onlyCanceled = false;
  $scope.onlyFinished = false;
  $scope.onlyListed = false;

  $scope.isOnlyActive = function(session) {
    //var session = session
    if ($scope.onlyActive && !$scope.onlyPaused && !$scope.onlyFinished) {
      return session.paused == true && session.state != false; 
    }
    if (!$scope.onlyActive && !$scope.onlyPaused && $scope.onlyFinished) {
      return session.finished == true; 
    }
    if (!$scope.onlyActive && $scope.onlyCanceled) {
      return session.canceled == true; 
    }
    
    
    else {
      return session;
    }
  }


  $scope.updateNote = function(station) {

    var token = $window.sessionStorage.getItem('token');
    $http.post(jsRoutes.controllers.ProcessSessionController.update_note(station.process, station.id).absoluteURL(document.ssl_enabled), {msg: station.note})
          .success(function (note_success) {
          })
          .error(function () {
          });
  }



$scope.date = {startDate: null, endDate: null};

$scope.loadSession = function () {
$scope.sessions = BPSessionsFactory.query({ BPid: $route.current.params.BPid });
$scope.sessions.$promise.then(function (data2) {
    $scope.sessions = data2;
    _.forEach(data2.sessions, function(session) { session.station.inlineLaunchShow = false ;return session.session.station = session.station });
    $scope.bprocess = data2.process;
    TreeBuilder.buildFetch(data2.process, function(success){});
    //_.forEach(data2, function(d){ return TreeBuilder.buildFetch(d.process, function(success){}); });
});

};

$scope.loadSession();


$scope.deleteSession = function(session_id) {
  SessionsFactory.delete({ session_id: session_id});
}
$scope.history = function(session_id) {
    ngDialog.open({
        template: '/assets/partials/popup/launch-history.html',
        //template: '/assets/partials/popup/first-process-finished.html',
        //controller: 'LaunchesCtrl',
        scope: $scope
      });
}

  /*
  * Observers stuff
  */
  $scope.fetchObservers = function (stations) {
    _.forEach(stations, function(station){ 
      station.newObserver = {bprocess: $scope.bpId, station_id: station.id};
      return station.obsrs = ObserversFactory.query({ process: $scope.bpId, station: station.id}); 
    });

  };
  $scope.deleteObserver = function(observe_id) {
      ObserverFactory.delete({ observe_id: observe_id }).$promise.then( function() {
          $scope.fetchObservers($scope.bpstations);
      });
  }
  $scope.createNewObserver = function(newObserver) {

      ObserversFactory.create(newObserver).$promise.then( function(data) {
         $scope.fetchObservers($scope.bpstations);
      });
      
  }



  //$scope.inputLoggers = function (stationId) {
    //_.filter($scope.allInputLogs, function(il){ return il.station == stationId; })
    //BPInLoggersStationFactory.query({BPid: $route.current.params.BPid, station_id: stationId});
  //};
  $scope.allInputLogs = BPInLoggersFactory.query({BPid: $route.current.params.BPid}).$promise.then(function(data) {
    $scope.inputLoggers = _.groupBy(data, function(x){return x.station});
  });

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