define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {


/**
 * BP Perm
 */
// INDEX
minorityControllers.controller('ReflectionCtrl', [
  '$scope',
  '$filter',
  '$rootScope',
  'EmployeesFactory',
  'ProcPermissionsFactory',
  'PermissionsFactory',
  'PermissionFactory',
  'BProcessesFactory',
  'BPElemsFactory',
  'BPSpacesFactory',
  'BPSpaceElemsFactory',
  'BPStationsFactory',
  'BPStationFactory',
  'BPLogsFactory',
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
  'RefMiddlewaresFactory',
  'RefMiddlewareFactory',
  'RefStrategiesFactory',
  'RefStrategyFactory',
  'RefStrategyBasesFactory',
  'RefStrategyBaseFactory',
  '$location', '$route', '$routeParams', '$window',
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
            RefReactionFactory,
            RefMiddlewaresFactory,
            RefMiddlewareFactory,
            RefStrategiesFactory,
            RefStrategyFactory,
            RefStrategyBasesFactory,
            RefStrategyBaseFactory,
            $location, $route, $routeParams, $window) {


$scope.isManager = function () {
  if ($scope.isManagerVal == undefined && $rootScope.manager != undefined) {
    $scope.isManagerVal = $rootScope.manager;
    return $scope.isManagerVal;
  } else {
    return $window.localStorage.manager == "true";
  }
};

if ($routeParams.search !== undefined) {
  $scope.searchValue = $routeParams.search; 
}


$scope.search = function() {
  return function(obj) {
    //console.log('obj', obj);
    //console.log('element', element);
    if ($scope.searchValue == undefined || $scope.searchValue == "") {
      return obj
    } else {
      console.log(obj.ref.title);
      console.log(obj.ref.title.indexOf($scope.searchValue) == 0);
      console.log($scope.searchValue);
      console.log(">>>>>>>>>>>>>..");
      $route.updateParams({search:$scope.searchValue});

      if (obj.ref.title.indexOf($scope.searchValue) == 0) {
        return obj;
      } else {
        return false;
      }
    }
 }
};


$scope.search1 = function(item){
   if (!$scope.searchValue || (item.ref.title.toLowerCase().indexOf($scope.searchValue.toLowerCase()) != -1) ){
        //$location.path = {search:$scope.searchValue};
        $location.search('search', $scope.searchValue);
       return true;
   }
   return false;
};

$scope.byReaction = function(action) {
  return function(obj) {
     if (obj.reaction === action.id) {
       return obj;
     } else {
       return false;
     }
 }
};

$scope.byMiddleware = function(middleware) {
  return function(obj) {
     if (obj.middleware === middleware.id) {
       return obj;
     } else {
       return false;
     }
 }
};

$scope.byStrategy = function(strategy) {
  return function(obj) {
     if (obj.strategy === strategy.id) {
       return obj;
     } else {
       return false;
     }
 }
};



$scope.isManagerVal = $scope.isManager();
$scope.isManager();

$scope.reloadRefs = function(){
$scope.refsPromise = RefsFactory.query();
$scope.refsPromise.$promise.then(function(data) {
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

    return $scope.refs = data;


});
};

$scope.reloadRefs();


$scope.type_short = $rootScope.type_short;

//  $scope.switcher_options = $rootScope.switcher_conf.switcher_options;
//  $scope.switcher_cmd = $rootScope.switcher_cmd;
//  $scope.switcher_target = $rootScope.switcher_target;
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
  if (obj.hidden == undefined) {
    obj.hidden = false;
  }
  RefsFactory.create(obj).$promise.then(function(c) {
     $scope.reloadRefs();
  });
};


$scope.updateRef = function (obj) {
  RefFactory.update({id: obj.id}, obj).$promise.then(function(c) {
     $scope.reloadRefs();
  });
};
$scope.deleteRef = function (obj) {
  RefFactory.delete({id: obj.id}).$promise.then(function(c) {
     $scope.reloadRefs();
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
    $scope.reloadRefs() ;
  });
}
$scope.createNewSpace = function () {
  RefSpacesFactory.create($scope.newSpace).$promise.then(function(data) {
    $scope.reloadRefs() ;
  });
}
$scope.deleteSpace = function (obj) {
  RefSpaceFactory.delete({ id: obj.id, BPid: $route.current.params.BPid }).$promise.then(function(data) {
    $scope.reloadRefs() ;

  });
};




$scope.createRefElement = function (obj, refId) {
 console.log(obj);//RefElemsFactory

 // formWithErrors JsError(List((/reflection,List(ValidationError(List(error.path.missing),WrappedArray()))), 
 //(/type_title,List(ValidationError(List(error.path.missing),WrappedArray()))), 
 //(/order,List(ValidationError(List(error.path.missing),WrappedArray()))), 
 //(/b_type,List(ValidationError(List(error.path.missing),WrappedArray())))))


 RefElemsFactory.create(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
};

$scope.updateRefElem = function (obj){
 console.log(obj);//RefElemFactory
 RefElemFactory.update(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}

$scope.deleteElem = function (obj){
  console.log(obj);
  RefElemFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}


$scope.createRefSpaceElem = function (obj) {
 console.log(obj);
 RefSpaceElemsFactory.create(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });

};
$scope.updateSpaceElem = function (obj){
  console.log(obj);
    RefSpaceElemFactory.update(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}


$scope.deleteSpaceElem = function (obj){
  console.log(obj);//RefSpaceElemFactory.delete({id: obj.id})
    RefSpaceElemFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}


$scope.createRefElementState = function (obj) {
  /*
    formWithErrors 
    JsError(List(
    (/neutral,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/lang,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/middleable,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/oposite,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/reflection,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/on_rate,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/on,List(ValidationError(List(error.path.missing),WrappedArray()))),
    (/opositable,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/process_state,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/middle,List(ValidationError(List(error.path.missing),WrappedArray())))))
  */
 console.log(obj);//RefStatesFactory
  RefStatesFactory.create(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });

};
$scope.updateRefElementState = function (obj) {
 console.log(obj);//RefStateFactory
 RefStateFactory.update(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });

};
$scope.deleteRefElementState = function (obj) {
 console.log(obj);//RefStateFactory.delete({id: obj.id})
RefStateFactory.delete({ params: {id: obj.id}, data: obj }).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
};


$scope.createNewSwitcher = function (obj) {
 console.log(obj);//RefSwitchesFactory
  RefSwitchesFactory.create(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
};
$scope.updateSwitcher = function (obj) {
 console.log(obj);//RefSwitchFactory
RefSwitchFactory.update(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
};
$scope.deleteSwitcher = function (obj) {
 console.log(obj);//RefSwitchFactory.delete({id: obj.id})
RefSwitchFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
};

$scope.createRefAction = function (obj, element, refObj) {
 console.log(obj);//RefReactionsFactory

 //formWithErrors JsError(List((/reaction,List(ValidationError(List(error.path.missing),WrappedArray())))))
  obj.element = _.find(refObj.topology, function(topo) { return topo.front_elem_id == element.id }).id;
  // TODO: Only for front element
  if (obj.autostart == undefined) { obj.autostart = false };
  obj.reflection = refObj.ref.id;

  obj.reaction_state_outs = [];
  RefReactionsFactory.create(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });

};




$scope.updateReaction = function (obj) {
 console.log(obj);//RefReactionFactory
RefReactionFactory.update(obj).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
};
$scope.deleteReaction = function (obj) {
 console.log(obj);//RefReactionFactory.delete({id: obj.id})
 RefReactionFactory.delete({ id: obj.id }).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
};









$scope.createRefElementMiddleware = function(middleware, action) {
    console.log(middleware);
    /*
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def title       = column[String]("title")

  def ident       = column[String]("ident")
  def ifaceIdent  = column[String]("iface_ident")

  def reaction    = column[Int]("reaction_id")
  def reflection  = column[Int]("reflection_id")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  formWithErrors JsError(List
    (/ident,List(ValidationError(List(error.path.missing),WrappedArray()))), 
    (/ifaceIdent,List(ValidationError(List(error.path.missing),WrappedArray())))))
  */

  middleware.reflection = action.reflection;
  middleware.reaction = action.id;
    RefMiddlewaresFactory.create(middleware).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}
$scope.removeMiddleware = function(middleware) {
    RefMiddlewareFactory.delete({id: middleware.id}).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}

$scope.createMiddlewareStrategy = function(strategy, middleware) {
    console.log(strategy);
/*
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def ident       = column[String]("ident")
  def reflection  = column[Int]("reflection_id")
  def middleware  = column[Long]("middleware_id")
  def isNullStrategy = column[Boolean]("is_null_strategy")
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")
  */
  strategy.reflection = middleware.reflection;
  strategy.middleware = middleware.id;
  if (strategy.isNullStrategy == undefined) {
    strategy.isNullStrategy = false;
  }

    RefStrategiesFactory.create(strategy).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}

$scope.removeStrategy = function(strategy) {
  RefStrategyFactory.delete({id: strategy.id}).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}

$scope.createMiddlewareStrategyBase = function(strategy_base, strategy) {
    console.log(strategy_base);
    /*
    def id               = column[Long]("id", O.PrimaryKey, O.AutoInc)
    def strategy         = column[Long]("strategy_id")
    def key              = column[String]("key")
    def baseType         = column[String]("base_type")
    def valueType        = column[String]("value_type")
    def valueContent     = column[String]("value_content")
    def validationScheme       = column[Option[String]]("validation_scheme")
    def validationPattern      = column[Option[String]]("validation_pattern")
    */
    strategy_base.strategy = strategy.id;

    RefStrategyBasesFactory.create(strategy_base).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}

$scope.removeStrategyBase = function(strategy_base) {
RefStrategyBaseFactory.delete({id: strategy_base.id}).$promise.then(function(data) {
      $scope.reloadRefs() ;
    });
}






  /* Front CUD */
  $scope.moveUpElem = function (obj, ref_id) {
    $http({
      url: 'ref/' + parseInt(ref_id) + '/element/' + obj.id + '/up',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
             $scope.reloadRefs() ;

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
           $scope.reloadRefs() ;

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
            $scope.reloadRefs() ;

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
          $scope.reloadRefs() ;

      },
      function(response) { // optional
        // failed
      }
      );
  };





$scope.byUnitElement = function(element) {
  return function(obj) {
    if (obj.front_elem_id == element.id) {
      return obj
    } else {
      return false;
    }

  }
}

$scope.reactionByTopoUnitElement = function(element, refObj) {
  return function(obj) {
    var topoId = _.find(refObj.topology, function(topo) {
      return topo.front_elem_id == element.id
    });
    if (topoId != undefined && topoId.id == obj.element) {
      return obj
    } else {
      return false;
    }

  }
}





}]);



});
