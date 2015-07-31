



minorityControllers.controller('BPRequestCtrl', ['ElementTopologsFactory', 'InteractionsFactory', '$scope', '$window','$routeParams','$route', '$rootScope','$filter','BPLogsFactory', 'BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory', 'BProcessFactory', 'BPStationsFactory', 'BPRequestFactory',  '$location', '$http',
function (ElementTopologsFactory, InteractionsFactory, $scope, $window,$routeParams,$route, $rootScope,$filter,BPLogsFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BProcessFactory, BPStationsFactory, BPRequestFactory,  $location, $http) {

$scope.bpId = $scope.session.process.id;

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


  $scope.bpelems = BPElemsFactory.query({ BPid: $scope.bpId }); 
  $scope.spaces =  BPSpacesFactory.query({ BPid: $scope.bpId });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $scope.bpId });
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


    $scope.byObjId = function(elem) {
    return function(obj) {
      if (obj.f_elem != undefined) {
        return obj.f_elem == elem.id;

      } else {
        return obj.sp_elem == elem.id;

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
             '';
         }
  }


  $scope.params = [
   

   ];


   $scope.interactions = InteractionsFactory.query({session_id: $scope.session.session.id});
   $scope.element_topologs = ElementTopologsFactory.query({ BPid: $scope.bpId });

   $scope.interactions.$promise.then(function (data) {
    $scope.element_topologs.$promise.then(function (data2) {
        _.forEach(data.reactions, function(r) { return r.reaction.elem = _.find(data2, function(topo) { 
          return topo.topo_id == r.reaction.element}); 
        })
        _.forEach(data.reactions, function(reaction) { 
           return _.forEach(reaction.outs, function(out) {
              return out.state = _.find(data.outs_identity, function(iden) { return iden.origin_state == out.state_ref });
          }) 
        });

      });
   });

$scope.selectedClass = function (reaction) {
  if (reaction.selected) {
    return 'selected';
  } else {
    return '';
  }
}

$scope.reactionSelect = function (reaction) {
    if (reaction.selected == true) {
      reaction.selected = false;
    } else {
      reaction.selected = true;
    
      $scope.addParam(reaction);
    }
}



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
    return (station.finished != true && station.paused == true);
  }
  $scope.filterInputs = function(elem) {
    return (elem.type_title == "confirm");
  };

  $scope.highlightActive = function (station, elem) {
     var front, nest;
     front = $scope.elemsHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].element];  
     nest = $scope.spaceElemHash[$scope.logsByStation(station.id)[$scope.logsByStation(station.id).length-1].space_elem];  
     if (front != undefined && front.id == elem.id) {
       return "active";
     } 
     if (nest != undefined && nest.id == elem.id && elem.space_owned != undefined) {
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


  $scope.runFromDisabled = false;


  $scope.runFrom = function (session_id) {
    //var front_params = _.filter(station.proc_elems,  function(obj) { return obj.param != undefined });
    //var space_params = _.filter(station.space_elems, function(obj) { return obj.param != undefined });
    //var params_output = _.flatten(_.map(front_params, function(v) { return {"f_elem": v.id, "param": v.param} }), _.map(space_params, function(v) { return {"sp_elem": v.id, "param": v.param} }));
    // TODO: Add arguments

    $http({
      url: 'bprocess/' + $scope.bpId + '/invoke_from/' + session_id,
      method: "POST",
      data: $scope.reaction_params
      })
      .then(function(response) {
        // success
        $scope.invoke_res = [response.data];
        //$scope.closeThisDialog();
        $location.path('/a#/bprocess/' + $scope.bpId + 'elements?session=' + parseInt(response.data.session));
      },
      function(response) { // optional
        // failed
      }
      );
  };

  $scope.reaction_params = []
  $scope.addParam = function (reaction) {

        if (_.find($scope.reaction_params, function(re) { return re.reaction_id == reaction.reaction.id })) {
          $scope.delParam(reaction);
        } else {
        $scope.reaction_params.push({reaction_id: reaction.reaction.id });
        if ($scope.reaction_params.length != 0) { $scope.runFromDisabled = false; }
        }
      
  }
  $scope.delParam = function (reaction) {
    $scope.reaction_params = _.reject($scope.reaction_params, function(el) { return el.reaction_id === reaction.reaction.id; });
    if ($scope.reaction_params.length == 0) { $scope.runFromDisabled = true; }
  }

$scope.capitalizeFirstLetter = function (string) {
    if (string != undefined) { 
      return string.charAt(0).toUpperCase() + string.slice(1)
    } else {
      return ""
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
}






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
