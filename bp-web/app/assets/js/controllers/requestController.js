define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {




minorityControllers.controller('BPRequestCtrl', ['DropBoxSettings', 'lkGoogleSettings', 'notificationService', 'LaunchElementTopologsFactory','LaunchElemsFactory','LaunchSpacesFactory','LaunchSpaceElemsFactory','ElementTopologsFactory', 'InteractionsFactory', '$scope', '$window','$routeParams','$route', '$rootScope','$filter','BPLogsFactory', 'BPElemsFactory','BPSpacesFactory','BPSpaceElemsFactory', 'BProcessFactory', 'BPStationsFactory', 'BPRequestFactory',  '$location', '$http',
function (DropBoxSettings, lkGoogleSettings, notificationService, LaunchElementTopologsFactory, LaunchElemsFactory,LaunchSpacesFactory,LaunchSpaceElemsFactory, ElementTopologsFactory, InteractionsFactory, $scope, $window,$routeParams,$route, $rootScope,$filter,BPLogsFactory, BPElemsFactory,BPSpacesFactory,BPSpaceElemsFactory, BProcessFactory, BPStationsFactory, BPRequestFactory,  $location, $http) {

$scope.bpId = $scope.session.process.id;
$scope.session_id = $scope.session.session.id;

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
   $scope.element_topologs = LaunchElementTopologsFactory.query({ launch_id: $scope.session_id });

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
$scope.setWarpType = function(field, warp_type) {
console.log(field);
var index = $scope.payload.indexOf(field);

if (index !== -1) {
//    items[index] = 1010;

  if (warp_type == 'text') {
    $scope.payload[index] = { obj_type: "text", obj_title: "Text", obj_content: "" }  
  } 
  if (warp_type == 'file') {
    $scope.payload[index] = { obj_type: "file", obj_title: "File", obj_content: "" }   
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
console.log('newNames' + newNames);
console.log('oldNames' + oldNames);

}
}, true);
$scope.$watch("dpfiles", function(newNames, oldNames) {
    if (newNames.length > 0) {
      $scope.prepareFiles();
console.log('newNames' + newNames);
console.log('oldNames' + oldNames);

}
}, true);
$scope.$watch("boxfiles", function(newNames, oldNames) {
    if (newNames.length > 0) {
      $scope.prepareFiles();
    console.log('newNames' + newNames);
    console.log('oldNames' + oldNames);
    };//$log.debug("    ** $watch(..., true)");
}, true);

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
$scope.onPicked = function (docs) {
  angular.forEach(docs, function (file, index) {
    $scope.files.push(file);
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
   $scope.sendPayload($scope.session_id,"", _.filter($scope.payload, function(el){return el.obj_content != "";}));   
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
  if (element_id != undefined) {
    $scope.sendPayload($scope.session_id, element_id);
  } else {
    $scope.sendPayload($scope.session_id);
  }
}
$scope.sendPayload = function(launch_id, element_id, existedPayload) {
     if (existedPayload != undefined) {
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
}

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
/* Slat
  title: String,
  boardId: UUID,
  entityId: UUID,  
  sval: String,
  publisher: String,
  meta: String,
*/
$scope.slatFilter = function(entity, slats) {
  return _.filter(slats, function(slat){return slat.entityId == entity.id });
}
$scope.defaultValueParser = function(entity, value) {
  if (entity.etype == "number") {
    return parseInt(value);
  } else {
    return value;
  }
}
$scope.fillValue = function(cost, entity, value) {
  console.log(cost);
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

}
$scope.reFillValue = function(cost, entity, slat) {
  console.log(cost);
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
}
/**************
 * ////END Cost module
 *****************/////////////////////////////////////////////////////*/







  $scope.runFromDisabled = true;


  $scope.currentReactionFlag = true;
  $scope.currentReactionFilter = function (data) {
      if ($scope.currentReactionFlag && $scope.interactions.reactions[0] == data) {
        return data;
      } 
      if ($scope.currentReactionFlag && $scope.interactions.reactions[0] != data) {
        return false;
      } else {
        return data;
      }
  }

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
      function(fail) { // optional
        // fail
        console.log(fail);
        notificationService.error(fail.data.error);
      }
      );
  };

  $scope.reaction_params = []
  $scope.addParam = function (reaction) {

        if (_.find($scope.reaction_params, function(re) { return re.reaction_id == reaction.reaction.id }) != undefined) {
          $scope.delParam(reaction);
        } else {
        $scope.reaction_params.push({reaction_id: reaction.reaction.id });
        if ($scope.reaction_params.length != 0) { console.log("$scope.runFromDisabled = false;"); $scope.runFromDisabled = false; }
        }
      
  }
  $scope.delParam = function (reaction) {
    $scope.reaction_params = _.reject($scope.reaction_params, function(el) { return el.reaction_id === reaction.reaction.id; });
    if ($scope.reaction_params.length == 0) { console.log("$scope.runFromDisabled = true;"); $scope.runFromDisabled = true; }
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


});