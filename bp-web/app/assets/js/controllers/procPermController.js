define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {


/**
 * BP Perm
 */
// INDEX
minorityControllers.controller('BPPermListCtrl', ['$scope', '$filter', '$rootScope','EmployeesFactory','ProcPermissionsFactory','PermissionsFactory', 'PermissionFactory', 'BProcessesFactory','BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route', '$window',
  function ($scope, $filter, $rootScope,EmployeesFactory,ProcPermissionsFactory,PermissionsFactory, PermissionFactory, BProcessesFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route, $window) {

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




  $scope.createReactPerm = function (perm) {
    // TODO: Perm for reaction
  }







  $scope.bpelems = BPElemsFactory.query({ BPid: $scope.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $scope.BPid });
  EmployeesFactory.query().$promise.then( function(data) {
    $scope.employees = data.emps;
    $scope.creds = data.creds;
  });
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
  $scope.credFetch = function (obj) {
    if (obj !== undefined && obj.uid !== undefined) { // it's employee

    var res = _.find($scope.creds, function(cr){ return cr.userId == obj.uid});
    if (res != undefined) {
      return res.fullName + " " + obj.uid;
    } else if (res == undefined) {
      return "Anonymous " + obj.uid;
    }
    } else if(obj !== undefined) { // it's group
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
    return res;
  } else if (res == undefined) {
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
  $scope.loadPerm = function () {
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
  $scope.loadPerm()

  $scope.newperms = [];


$scope.addPerm = function () {
      if(typeof $scope.perms === 'undefined') {
        $scope.perms = [];
        $scope.defaultParam();
      }
      $scope.newperms.push({});
}

$scope.notExistedInElement = function(perms, elem) {
    var definedPerms = _.filter(perms, $scope.byObjId(elem))
    return function(obj) {
      //if (obj.front_elem_id != undefined) {
      console.log('notExistedInElement',definedPerms);
      console.log('notExistedInElement',obj);

      console.log('notExistedInElement', _.find(definedPerms, function(p){ (p.uid == obj.uid || p.group == obj.group) }) === undefined);
        return _.find(definedPerms, function(p){ return (p.uid == obj.uid || p.group == obj.group) }) === undefined;
      //} else {
      //  return obj.space_elem_id == elem.id;
      //}    
    }

}

$scope.byObjId = function(elem) {
    return function(obj) {
      if (obj.front_elem_id != undefined) {
        return obj.front_elem_id == elem.id;
      } else {
        return obj.space_elem_id == elem.id;
      }    
    }
}
  $scope.delPerm = function (perm) {
    PermissionFactory.delete({id: perm.id}).$promise.then(function(data) {
       $scope.perms = ProcPermissionsFactory.query({ BPid: $scope.BPid });
       $scope.loadPerm();
    });
  }
  $scope.removePerm = function (perm) {
    $scope.delPerm(perm);
  }
  $scope.createPerm = function (perm, elem, where) {
    if (elem != undefined) {
      if (where == "front") {
        perm.front_elem_id = elem.id;
      } else {
      perm.space_elem_id = elem.id;
      };
      // Fill group
      if (perm.group == true || (perm.employeegroup != undefined && perm.employeegroup.group == true) ) {
        perm.group = perm.employeegroup.id;
      } 
      // Fill employee
      if ((perm.employeegroup != undefined && perm.employeegroup.uid !== undefined) ) {
        perm.uid = perm.employeegroup.uid ;
      } 
      if (perm.role == undefined) {
        perm.role = 'all';
      }
      perm.bprocess = $scope.BPid;
      perm.process = $scope.BPid;
    PermissionsFactory.create(perm).$promise.then(function(data) {
       $scope.perms = ProcPermissionsFactory.query({ BPid: $scope.BPid }).$promise.then(function(d) {
        $scope.loadPerm();
       });
       
    });

      
    }
  }

  $scope.defaultParam = function () {
      var targets = _.filter($scope.stations, function(station){ return station.paused == true; });
      _.each(targets, function(target) {
        target.params = [];
      });
      _.each(targets, function(target) {




        BPRequestFactory.scheme({ BPid: $scope.BPid, station_id: target.id }).$promise.then(function(data) {


                      //target.proc_elems = [];
                     //target.space_elems = [];
                  target.proc_elems = data.proc_elems;
                  target.space_elems = data.space_elems;
              }, function(error) {
                  console.log('error', error);
        });

      });
  };

  $scope.addProcessPerm = function(empgroup, role) {

    /*
      "id" -> optional(number),
      "uid" -> optional(text),
      "group" -> optional(number),
      "process" -> number,
      "front_elem_id" -> optional(number),
      "space_elem_id" -> optional(number),
      "reaction" -> optional(number),
      "role" -> text
    */
    if (empgroup.uid != undefined) { // account detected
        empgroup.role = role;
        empgroup.process = $scope.BPid;
        empgroup.id = null;
    PermissionsFactory.create(empgroup).$promise.then(function(data) {
       $scope.perms = ProcPermissionsFactory.query({ BPid: $scope.BPid });
       $scope.loadPerm();
    });
    }
    else { // group detected
        empgroup.role = role;
        empgroup.process = $scope.BPid;
        empgroup.group = empgroup.id;
        empgroup.id = null;
     PermissionsFactory.create(empgroup).$promise.then(function(data) {
       $scope.perms = ProcPermissionsFactory.query({ BPid: $scope.BPid });
       $scope.loadPerm();
    });
    }

  }
  $scope.delProcessPerm = function(perm) {
    $scope.delPerm(perm);
    $scope.loadPerm();
  }

  $scope.symbol = function(title) {
    if (title != undefined) {
      return (title[1] + title[2]).toUpperCase()
    } else {
      return ""
    }
  }

  $scope.filterPerms = function(elem) {
    return (elem.type_title == "confirm");
  };
  $scope.filterProcessPermEdit = function(perm) {
    return (perm.role == 'edit');
  } 
  $scope.filterProcessPermAll  = function(perm) {
    return (perm.role == 'all');
  } 
  $scope.filterProcessPermView = function(perm) { 
    return (perm.role == 'view');
  }


}]);



});