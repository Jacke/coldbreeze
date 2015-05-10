

/**
 * BP Perm
 */
// INDEX
minorityControllers.controller('ReflectionCtrl', ['$scope', '$filter', '$rootScope','EmployeesFactory','ProcPermissionsFactory','PermissionsFactory', 'PermissionFactory', 'BProcessesFactory','BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', 
'RefsFactory',
'RefFactory',
'RefElemsFactory',
'RefElemFactory',
'RefSpacesFactory',
'RefSpaceFactory',
'RefSpaceElemsFactory',
'RefSpaceElemFactory',
'RefStatesFactory',
'RefStateFactory', 
'RefSwitchesFactory',
'RefSwitchFactory',
'RefReactionsFactory',
'RefReactionFactory',
'$location', '$route', '$window',
  function ($scope, $filter, $rootScope,EmployeesFactory,ProcPermissionsFactory,PermissionsFactory, PermissionFactory, BProcessesFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, 
RefsFactory,
RefFactory,
RefElemsFactory,
RefElemFactory,
RefSpacesFactory,
RefSpaceFactory,
RefSpaceElemsFactory,
RefSpaceElemFactory,
RefStatesFactory,
RefStateFactory,
RefSwitchesFactory,
RefSwitchFactory,
RefReactionsFactory,
RefReactionFactory,$location, $route, $window) {

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

$scope.reload = function(){ 
$scope.refs = RefsFactory.query();
$scope.refs.$promise.then(function(data) {
  console.log(data);
  _.forEach(data.unitelement, function(z) {
    z.states = _.filter(data.bpstate, function(d){ return d.front_elem_id == z.id;});
    z.topo_id = _.find(data.topology, function(d){ return d.front_elem_id == z.id;});
    z.reactions = _.filter(data.reaction_cn, function(sw) { return sw.reaction.element == z.topo_id }); 

    _.forEach(z.states, function(st){ return st.switches = _.filter(data.unitswitcher, function(sw) { return sw.state_ref == st.id }) });
    if (z.b_type == "brick") {
    	z.spaces = _.filter(data.unitspace, function(s){ return s.brick_front == z.id;});
        _.forEach(z.spaces, function(sp) { 
        	    sp.spelems = _.filter(data.unitspaceelement, function(spelem){ 
        	     return spelem.ref_space_owned == sp.id; 
        	 }) 
        }); 
    }

  });
  _.forEach(data.unitspaceelement, function(z) {
    z.topo_id = _.find(data.topology, function(d){ return d.space_elem_id == z.id;});
    z.reactions = _.filter(data.reaction_cn, function(sw) { return sw.reaction.element == z.topo_id }); 
    z.states = _.filter(data.bpstate, function(d){ return d.space_elem_id == z.id;});
    _.forEach(z.states, function(st){ return st.switches = _.filter(data.unitswitcher, function(sw) { return sw.state_ref == st.id }) });
  });

});

};
$scope.reload();


$scope.type_short = $rootScope.type_short;
    
$scope.switcher_options = $rootScope.switcher_conf.switcher_options;    
$scope.switcher_cmd = $rootScope.switcher_cmd;
$scope.switcher_target = $rootScope.switcher_target;
/*
TODO: 

RefsFactory
RefFactory
RefElemsFactory
RefElemFactory
RefSpacesFactory
RefSpaceFactory
RefSpaceElemsFactory
RefSpaceElemFactory
RefStatesFactory
RefStateFactory
RefSwitchesFactory
RefSwitchFactory
RefReactionsFactory
RefReactionFactory

*/
$scope.createRef = function (obj) {
  RefsFactory.create(obj).$promise.then(function(c) {
    $scope.reload();
  });
};
$scope.updateRef = function (obj) {
  RefFactory.update({id: obj.id}, obj).$promise.then(function(c) {
    $scope.reload();
  });
};
$scope.deleteRef = function (obj) {
  RefFactory.delete({id: obj.id}).$promise.then(function(c) {
    $scope.reload();
  });
};


$scope.orderFrontGen = function (obj) {
  return 1; // TODO: Implement
};
$scope.indexNestedGen = function (obj) {
  return 1; // TODO: Implement
};

$scope.orderNestedGen = function (obj) {
  return 1; // TODO: Implement
};





  $scope.updateSpace = function (obj) {
    RefSpaceFactory.update(obj).$promise.then(function(data) {
      $scope.reload();
    });
  }
  $scope.createNewSpace = function () {
    RefSpacesFactory.create($scope.newSpace).$promise.then(function(data) {
      $scope.reload();
    });
  }
  $scope.deleteSpace = function (obj) {
    RefSpaceFactory.delete({ id: obj.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
      $scope.reload();

    });
  };




$scope.createNewElem = function (obj) {
 console.log(obj);//RefElemsFactory
 RefElemsFactory.create(obj).$promise.then(function(data) {
      $scope.reload();
    });
 $scope.reload();
}; 
$scope.updateElem = function (obj){
 console.log(obj);//RefElemFactory
 RefElemFactory.update(obj).$promise.then(function(data) {
      $scope.reload();
    });
 $scope.reload();
}

$scope.deleteElem = function (obj){
  console.log(obj);
  RefElemFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reload();

    });
  $scope.reload();
}

$scope.createSpaceElem = function (obj) {
 console.log(obj);
 RefSpaceElemsFactory.create(obj).$promise.then(function(data) {
      $scope.reload();
    });

}; 
$scope.updateSpaceElem = function (obj){
  console.log(obj);
RefSpaceElemFactory.update(obj).$promise.then(function(data) {
      $scope.reload();
    });
}
	

$scope.deleteSpaceElem = function (obj){
  console.log(obj);//RefSpaceElemFactory.delete({id: obj.id})
RefSpaceElemFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reload();
    });
}


$scope.createNewState = function (obj) {
 console.log(obj);//RefStatesFactory
  RefStatesFactory.create(obj).$promise.then(function(data) {
      $scope.reload();
    });

};
$scope.updateState = function (obj) {
 console.log(obj);//RefStateFactory
 RefStateFactory.update(obj).$promise.then(function(data) {
      $scope.reload();
    });

};
$scope.deleteState = function (obj) {
 console.log(obj);//RefStateFactory.delete({id: obj.id})	
RefStateFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reload();
    });
};


$scope.createNewSwitcher = function (obj) {
 console.log(obj);//RefSwitchesFactory
  RefSwitchesFactory.create(obj).$promise.then(function(data) {
      $scope.reload();
    });
};
$scope.updateSwitcher = function (obj) {
 console.log(obj);//RefSwitchFactory
RefSwitchFactory.update(obj).$promise.then(function(data) {
      $scope.reload();
    });
};
$scope.deleteSwitcher = function (obj) {
 console.log(obj);//RefSwitchFactory.delete({id: obj.id})
RefSwitchFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reload();
    });
};

$scope.createReaction = function (obj) {
 console.log(obj);//RefReactionsFactory
  obj.reaction_state_outs = [];
  RefReactionsFactory.create(obj).$promise.then(function(data) {
      $scope.reload();
    });

};
$scope.updateReaction = function (obj) {
 console.log(obj);//RefReactionFactory
RefReactionFactory.update(obj).$promise.then(function(data) {
      $scope.reload();
    });
};
$scope.deleteReaction = function (obj) {
 console.log(obj);//RefReactionFactory.delete({id: obj.id})
 RefReactionFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reload();
    });
};













  


  /* Front CUD */
  $scope.moveUpElem = function (obj, ref_id) {
    $http({
      url: 'ref/' + parseInt(ref_id) + '/element/' + obj.id + '/up',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
             $scope.reload();

      },
      function(response) { // optional
        // failed
      }
      );
  };
  $scope.moveDownElem = function (obj, ref_id) {
    $http({

      url: 'ref/' + parseInt(ref_id) + '/element/' + obj.id + '/down',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
           $scope.reload();

      },
      function(response) { // optional
        // failed
      }
      );
  };



  /* Space Elem CUD */
  $scope.moveUpSpaceElem = function (obj, ref_id) {
    $http({
      url: 'ref/' + parseInt(ref_id) + '/space_elem/' + obj.id + '/' + obj.space_owned + '/up',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
            $scope.reload();

      },
      function(response) { // optional
        // failed
      }
      );
  };
  $scope.moveDownSpaceElem = function (obj, ref_id) {
    $http({
      url: 'ref/' + parseInt($route.current.params.BPid) + '/space_elem/' + obj.id + '/' + obj.space_owned + '/down',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
          $scope.reload();

      },
      function(response) { // optional
        // failed
      }
      );
  };













}]);



