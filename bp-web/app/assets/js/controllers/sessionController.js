define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

// For all processes
minorityControllers.controller('LaunchesCtrl', ['$http', 
  '$window', 
  '$translate',
  '$scope', 
  '$filter', 
  '$routeParams',
  '$rootScope',
  'ngDialog',
  'ProcPermissionsFactory',
  'TreeBuilder',
  'BPStationsFactory', 
  'SessionsFactory',
  'BProcessesFactory',
  'BProcessFactory', 
  'ObserversFactory', 
  'ObserverFactory', 
  'BProcessesFactory', 
  'BPElemsFactory',
  'BPSpacesFactory',
  'BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($http, $window, $translate, $scope, $filter, $routeParams, $rootScope, ngDialog, ProcPermissionsFactory, TreeBuilder, BPStationsFactory, SessionsFactory, BProcessesFactory, BProcessFactory, ObserversFactory, ObserverFactory, BProcessesFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {


$scope.loadSessions = function (process_id) { 

/*
process: Object
  business: 2
  id: 3
  service: 1
  state_machine_type: "base"
  title: "ttt"
  version: 1
  __proto__: Object
sessions: Array[5]
  0: Object
  peoples: Object
  percent: 0
  process: Object
  session: Object
  station: Object
  */
SessionsFactory.query().$promise.then(function (data2) {
    _.forEach(data2.sessions, function(session) { 
      session.station.inlineLaunchShow = false;
      $scope.loadPerm(session.process);
      return session.session.station = session.station 
    });


  if (data2.length > 0) {
    if (data2[0] != undefined) {
           ProcPermissionsFactory.query({ BPid: data2[0].process.id }).$promise.then(function(qu){
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
                // polyfill ended
                 if (process_id != undefined) {
                  console.log(process_id);
                  $scope.sessions = _.filter(data2, function(dat) { return dat.process.id == process_id });
                 } else { 
                  $scope.sessions = data2;
                 }

                 _.forEach(data2, function(d){ return TreeBuilder.buildFetch(d.process, function(success){}); });
            });

    }
  }    

/*
BProcessesFactory.query().$promise.then(function (proc) {
    if (proc.length > 0) {
      console.log('loadPerm');
      $scope.loadPerm(proc[0].id);
    };
    $scope.bprocesses = proc;
}); // load polyfill for accounts TODO: Change that!!!!!!
  
  */

    
});

};

  if ($routeParams.process != undefined) {
    $scope.loadSessions($routeParams.process);    
  } else { // Load all process
    $scope.loadSessions();    
  }


$scope.history = function(session_id) {
    ngDialog.open({
        template: '/assets/partials/popup/launch-history.html',
        //template: '/assets/partials/popup/first-process-finished.html',
        //controller: 'LaunchesCtrl',
        scope: $scope
      });
}
$scope.deleteSession = function(session_id) {
  SessionsFactory.delete({ session_id: session_id}).$promise.then(function (data2) {
      $scope.loadSessions();
  })
};

$scope.isEmptyLaunches = function() {
  if ($scope.sessions.length > 0) {
    var vals = _.map($scope.sessions, function(ses) {
        if (ses.sessions.length > 0) {
          return true;
        }
        else {
          return false;
        }
   });
    return _.reduce(vals, function(v,z){ return v || z });
  } else {
    return true;
  }
}

$scope.loadPerm = function (bpId) {
  ProcPermissionsFactory.query({ BPid: bpId }).$promise.then(function(qu){
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
};


$scope.accFetchSessioned = function (obj) {
  if (obj != undefined) { // it's employee

  var res = _.find($scope.accounts, function(cr){ return cr.userId == obj});
  if (res != undefined) { // it's account
                          // anonumous checking
    res.fullName != undefined ? res.tooltip = res.fullName : res.tooltip = res.email;
    if (res.avatarUrl == undefined || res.avatarUrl == "") {
      res.avatarUrl = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iRWJlbmVfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjx0aXRsZT5EZWZhdWx0IEF2YXRhcjwvdGl0bGU+PGRlc2M+RGVmYXVsdCBBdmF0YXIgZm9yIFdDRiAyLjA8L2Rlc2M+IDxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbLnN1cmZhY2UgeyBmaWxsOiAjZmZmOyB9LnNoYWRvdyB7IGZpbGw6ICNiYmI7IH1dXT48L3N0eWxlPjwvZGVmcz48cmVjdCB4PSIwIiBjbGFzcz0ic2hhZG93IiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiLz48cGF0aCBjbGFzcz0ic3VyZmFjZSIgZD0iTTMuNTI4LDE2QzMuNzc2LDExLjQ5OSw1LjY4NCw4LDgsOHM0LjIyNCwzLjQ5OSw0LjQ3Myw3Ljk5OCIvPjxjaXJjbGUgY2xhc3M9InN1cmZhY2UiIGN4PSI4IiBjeT0iNiIgcj0iMy41Ii8+PC9zdmc+'
    } 
    return res;
  } else if (res == undefined) {
    //if (res.avatarUrl == undefined || res.avatarUrl == "") {
      res = {};
      res.avatarUrl = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iRWJlbmVfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjx0aXRsZT5EZWZhdWx0IEF2YXRhcjwvdGl0bGU+PGRlc2M+RGVmYXVsdCBBdmF0YXIgZm9yIFdDRiAyLjA8L2Rlc2M+IDxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbLnN1cmZhY2UgeyBmaWxsOiAjZmZmOyB9LnNoYWRvdyB7IGZpbGw6ICNiYmI7IH1dXT48L3N0eWxlPjwvZGVmcz48cmVjdCB4PSIwIiBjbGFzcz0ic2hhZG93IiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiLz48cGF0aCBjbGFzcz0ic3VyZmFjZSIgZD0iTTMuNTI4LDE2QzMuNzc2LDExLjQ5OSw1LjY4NCw4LDgsOHM0LjIyNCwzLjQ5OSw0LjQ3Myw3Ljk5OCIvPjxjaXJjbGUgY2xhc3M9InN1cmZhY2UiIGN4PSI4IiBjeT0iNiIgcj0iMy41Ii8+PC9zdmc+'
    //} 
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
$scope.showInlineLaunch = function (session) {
  if (session.inlineLaunchShow) {
    session.inlineLaunchShow = false;
  } else {
    session.inlineLaunchShow = true;
  }
  return session;
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

  /* callback for ng-click 'editUser': */


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
     /*var front, nest;
     front = $scope.elemsHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].element];  
     nest = $scope.spaceElemHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].space_elem];  
     if (front != undefined && front.id == elem.id && station.finished == false) {
       return "active";
     } 
     if (nest != undefined && nest.id == elem.id && elem.space_owned != undefined && station.finished == false) {
      return "active";
     } else { */
     return "passive"
     //}
  }

  //$scope.logs = BPLogsFactory.query({  BPid: $route.current.params.BPid });


  $scope.stationByProcess = function (processId) {
        var found = $filter('filter')($scope.bprocesses, {id: processId}, true);
         if (found.length) {
             return found[0];
         } else {
             '1';
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
        $scope.loadSessions();
        $route.reload();
        //$scope.invoke_res = [response];
      },
      function(response) { // optional
        // failed
      }
      );
} 
$scope.listed = function (session) {
  $http({
      url: '/session/' + session.session.id + '/listed',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        //$scope.stationsRefresh(); // Not for session controller
        $scope.loadSessions();
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
$scope.cancelSession = function (session) {
    $http({
      url: '/bprocess/' + session.process.id + '/session/' + session.session.id + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        $location.path('/a#/launches/');

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
        $scope.loadSession();
        //$scope.stationsRefresh(); // not for session controller
        //$scope.invoke_res = [response];
      },
      function(response) { // optional
        // failed
      }
      );

  }


  $scope.onlyActive = false;
  $scope.onlyCanceled = false;
  $scope.onlyFinished = false;
  $scope.onlyListed = false;

  $scope.isOnlyActive = function(session) {
    if ($scope.onlyActive && !$scope.onlyPaused && !$scope.onlyFinished) {
      return session.station.paused == true && session.station.state != false; 
    }
    if (!$scope.onlyActive && !$scope.onlyPaused && $scope.onlyFinished) {
      return session.station.finished == true; 
    }
    if (!$scope.onlyActive && $scope.onlyCanceled) {
      return session.station.canceled == true; 
    }
    
    
    else {
      return session;
    }
  }
$scope.isOnlyListed = function(session) {
  return session;
}

$scope.date = {startDate: null, endDate: null};




}])




});





