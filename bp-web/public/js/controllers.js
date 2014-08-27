'use strict';

/* Controllers */
  /*.run(function ($rootScope, $templateCache) {
  $rootScope.$on('$viewContentLoaded', function () {
    $templateCache.removeAll();
  });
});*/
angular.module('minorityApp.controllers', []).
  controller('BProcessListCtrl', [function () {

  }])
  .controller('UserController', [function () {

  }])
  .controller('BProcessDetailCtrl', [function () {

  }])
  .controller('BPCreationCtrl', [function () {

  }])
  .controller('BPRequestCtrl', [function () {

  }]);
  
minorityApp.filter('propsFilter', function() {
  return function(items, props) {
    var out = [];

    if (angular.isArray(items)) {
      items.forEach(function(item) {
        var itemMatches = false;

        var keys = Object.keys(props);
        for (var i = 0; i < keys.length; i++) {
          var prop = keys[i];
          var text = props[prop].toLowerCase();
          if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
            itemMatches = true;
            break;
          }
        }

        if (itemMatches) {
          out.push(item);
        }
      });
    } else {
      // Let the output be the input untouched
      out = items;
    }

    return out;
  }
});

var minorityControllers =
angular.module(
  'minorityApp.controllers',
  [
    'minorityApp.services',
    'angular-underscore',
    'ui.select'
  ]
);

/*
 * Profile
 */
minorityControllers.controller('ProfileController', ['$scope', '$http', '$window', '$location', 'toaster', 
  function ($rootScope, $scope, $http, $window, $location, toaster) {

    
    $scope.retrive = function(user) {
        var token = "b8b656520e1f0314b3536f92ebcdd41ea5654ecb4467a56709d8e9337dd152c4ddf5470f6c130a78db7ceb5a90e8fbb96bd4da9df938443727d424b9eb56ac5b107647d3dd9c7c801ce22685294065acdaf6ca0706b05cfbdc475cc6ce48de4ced6ab1115a2d54bf7b551d13b1592b10b0b196f7e34063dc13d668b88eeac19c"//$window.localStorage.getItem('token')
      if (token) {
        console.log(token);//$http.defaults.headers.common['X-Auth-Token'] = token;
        //$http.defaults.headers.common['Access_Name'] = 'John'; 
 
        $http.post('http://localhost:9000/whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'John'}})
          .success(function (profile) {
              // Stores the token until the user closes the browser window.
              console.log(profile);
              $scope.profile = profile;
              
          })
          .error(function () {
          });
      }
      else {
        toaster.pop('error', "title", '<ul><li>Forbidden</li></ul>', null, 'trustedHtml');
      };
    }

    //$scope.retrive();
}]);

minorityControllers.controller('UserInfoCtrl', function ($rootScope, $scope, $http, $window, $location) {
  $scope.isLogged = true;
  $scope.user = {};

  $scope.retrive = function(user) {
        var token = $window.sessionStorage.getItem('token')
      if (token) {
        $http.defaults.headers.common['X-Auth-Token'] = token;
        $http.defaults.headers.common['Access_Name'] = 'John'; 
 
        $http.post('http://localhost:9000/whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'John'}})
          .success(function (profile) {
              // Stores the token until the user closes the browser window.
              console.log(profile);
              $scope.user = profile;
              $scope.isLogged = true;
          })
          .error(function () {
          });
      };
      } 

  $rootScope.$on("isLogged", function (event, args) {
     console.log(">>>>>>>>>>>>>>>>>");
     $scope.user = args.profile;
     $scope.isLogged = true;
  });
  $scope.logout = function() {
      $window.sessionStorage.removeItem('token');
      $scope.isLogged = false;
      $scope.user = {};
      $location.path('/');
  }

  $scope.retrive();
});





// INDEX
minorityControllers.controller('BProcessListCtrl', ['$scope', '$http', '$filter', 'BProcessesFactory','BProcessFactory', 'BPStationsFactory', 'BPServicesFactory', '$location', 
  function ($scope, $http, $filter, BProcessesFactory, BProcessFactory, BPStationsFactory, BPServicesFactory, $location) {

  /* callback for ng-click 'editUser': */
  $scope.editBP = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showBP = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteBP = function (bpId) {
    BProcessFactory.delete({ id: bpId });
    $scope.bprocesses = BProcessesFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewBP = function () {
    $location.path('/bprocess/new');
  };
  $scope.services = BPServicesFactory.query();
  $scope.bprocesses = BProcessesFactory.query();
  $scope.stations = BPStationsFactory.query();

  $scope.bpElemLength = $http.get('http://localhost:9000/bprocess/elems_length')
          .success(function (data) {
              // Stores the token until the user closes the browser window.
              console.log(data);
              $scope.bpElemLength = data;
          })
          .error(function () {
          });

  $scope.stationPercent = function(station) {
    console.log(station.process)
    var found = $filter('filter')($scope.bpElemLength, {id: station.process});
                 
    if (found.length) {
      console.log(found)
             return found[0];
         } else {
             100;
         }
  }

  $scope.filterService = function(service_id) {
         var found = $filter('filter')($scope.services, {id: service_id}, true);
         if (found.length) {
             return found[0].title;
         } else {
             '';
         }
     }
}]);


// READ

minorityControllers.controller('BPRequestCtrl', ['$scope', '$routeParams', 'BProcessFactory', 'BPStationsFactory', 'BPRequestFactory',  '$location', '$http',
function ($scope, $routeParams, BProcessFactory, BPStationsFactory, BPRequestFactory,  $location, $http) {
  console.log($routeParams.BPid)
  $scope.bpId = $routeParams.BPid;

//minorityControllers.controller('BPRequestCtrl', ['$scope', '$filter','$routeParams','BProcessesFactory','BProcessFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route', '$http',
//function ($scope, $filter, $routeParams, BProcessesFactory, BProcessFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route, $http) {

  $scope.params = [
     { block: 'confirm', name: 'confirmed' }
     
   ];


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
  $scope.runInitially = function () {
      
      $http({
      url: 'bprocess/' + $routeParams.BPid + '/invoke',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
        $location.path('/bprocess/' + $routeParams.BPid + '/stations')
      }, 
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.runFrom = function (stationID, station) {
    console.log(station.params)
    $http({
      url: 'bprocess/' + $routeParams.BPid + '/invoke_from/' + stationID,
      method: "POST",
      data: station.params
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
        $location.path('/bprocess/' + $routeParams.BPid + '/stations')
      }, 
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.addParam = function (station) {
      if(typeof station.params === 'undefined') {
        station.params = [];
        $scope.defaultParam();
      }


      
      station.params.push({elem: '', param: 'confirmed' });
  }
  $scope.delParam = function (station) {
    station.params.pop();
  }


  $scope.defaultParam = function () {
      var targets = _.filter($scope.stations, function(station){ return station.paused == true; });
      _.each(targets, function(target) { 
        target.params = []; 
      }); 
      _.each(targets, function(target) { 
        
   
        

        BPRequestFactory.scheme({ BPid: $routeParams.BPid, station_id: target.id }).$promise.then(function(data) {
        console.log("magic happens here");
        console.log(data);

                      //target.proc_elems = [];
                     //target.space_elems = [];
                  target.proc_elems = data.proc_elems; 
                  target.space_elems = data.space_elems;
              }, function(error) {
                  console.log('error', error);
        });
        
      }); 
  }
  
  $scope.invoke_res = [];
  $scope.bpId = $routeParams.BPid;
  $scope.selectedTab = 1;
  $scope.stations = BPStationsFactory.query({ BPid: $routeParams.BPid });
  $scope.defaultParam();
  $scope.bprocess = BProcessFactory.show({ id: $routeParams.BPid });
}]);

minorityControllers.controller('BProcessDetailCtrl', ['$scope', '$routeParams', 'BProcessFactory', '$location', '$http',
function ($scope, $routeParams, BProcessFactory, $location, $http) {


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
  $scope.invokeBP = function (bpId) {

      $http({
      url: 'process/' + bpId + '/invoke',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
        $scope.invoke_res = [response];
      }, 
      function(response) { // optional
        // failed
      }
      );
  }
  $scope.invoke_res = [];
  $scope.bpId = $routeParams.id;
  $scope.selectedTab = 1;
  $scope.bprocess = BProcessFactory.show({id: $routeParams.id});
}]);





// CREATE
minorityControllers.controller('BPCreationCtrl', ['$scope', '$http', 'BProcessesFactory', 'BPServicesFactory', '$location',
  function ($scope, $http,  BProcessesFactory, BPServicesFactory, $location) {



    $scope.procServices = BPServicesFactory.query();


    $scope.createNewBP = function () {
      BProcessesFactory.create($scope.bprocess);
      $location.path('/bprocesses');
    }
}]);




/**
 * BP Elements
 */
// INDEX
minorityControllers.controller('BPelementListCtrl', ['$scope', '$routeParams', 'BPElemsFactory','BPElemFactory', 'BPSpacesFactory', 'BPSpaceFactory', 'BPSpaceElemsFactory', 'BPSpaceElemFactory', '$location', '$route', 
  function ($scope, $routeParams, BPElemsFactory, BPElemFactory, BPSpacesFactory, BPSpaceFactory, BPSpaceElemsFactory, BPSpaceElemFactory, $location, $route) {
  $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  $scope.spaceelems = BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });

  /* callback for ng-click 'editUser': */
  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */



  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };

  $scope.newBpelem = { comps: [ { "a_string" : null} ] }
  $scope.newSpaceelem = { comps: [ { "a_string" : null} ] }
  $scope.newBpelem = { desc: "" }
  $scope.newSpaceelem = { desc:  "" }







  /* Front CUD */
  $scope.updateElem = function (obj) {
    console.log(obj)  

    BPElemFactory.update(obj);
    $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.createNewElem = function () {
    console.log($scope.newBpelem);
    BPElemsFactory.create($scope.newBpelem);
    $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.deleteElem = function (bpId) {
    BPElemFactory.delete({ id: bpId.id, BPid: $route.current.params.BPid });
    $scope.bpelems = BPElemsFactory.query({ BPid: $route.current.params.BPid });
  };


  /* SPACES CUD */
  $scope.updateSpace = function (obj) {
    console.log(obj)
    BPSpaceFactory.update(obj);
    $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.createNewSpace = function () {
    console.log($scope.newSpace)
    BPSpacesFactory.create($scope.newSpace);
    $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.deleteSpace = function (bpId) {
    BPSpaceFactory.delete({ id: bpId.id, BPid: $route.current.params.BPid });
    $scope.spaces =  BPSpacesFactory.query({ BPid: $route.current.params.BPid });
  }; 





  /* Space Elem CUD */
  $scope.updateSpaceElem = function (obj) {
    console.log(obj);
    BPSpaceElemFactory.update(obj);
    $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.createSpaceElem = function () {
    console.log($scope.newSpaceelem);
    BPSpaceElemsFactory.create($scope.newSpaceelem);
    $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
  }
  $scope.deleteSpaceElem = function (bpId) {
    BPSpaceElemFactory.delete({ id: bpId.id, BPid: $route.current.params.BPid });
    $scope.spaceelems =  BPSpaceElemsFactory.query({ BPid: $route.current.params.BPid });
  };





  $scope.frontSpace = function (elem_id) { // : spaceObj
    var result = _.find($scope.spaces, function(space){ return space.brick_front == elem_id; });
    console.log(result);
    result
  }
  $scope.BPid = $routeParams.id;
 
}]);




minorityControllers.controller('BPelementCreationCtrl', ['$scope', 'BPElemsFactory','BPElemFactory', '$location', '$route', 
   function ($scope, BPElemsFactory, BPElemFactory, $location, $route) {
    $scope.createNewBPElem = function () {
      BPElemsFactory.create($scope.bpelem);
      $location.path('/bprocesses');
    }
}]);







/**
 * BP Station
 */
// INDEX
minorityControllers.controller('BPstationListCtrl', ['$scope', '$filter', 'BProcessesFactory','BPStationsFactory','BPStationFactory', 'BPLogsFactory', '$location', '$route',
  function ($scope, $filter, BProcessesFactory, BPStationsFactory, BPStationFactory, BPLogsFactory, $location, $route) {

  /* callback for ng-click 'editUser': */

  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteElem = function (bpId) {
    BPStationFactory.delete({ id: bpId });
    $scope.bpstations = BPStationsFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };
  $scope.bpstations = BPStationsFactory.query({ BPid: $route.current.params.BPid });
  $scope.logs = BPLogsFactory.query({  BPid: $route.current.params.BPid });
  $scope.bprocesses = BProcessesFactory.query();
  $scope.stationByProcess = function (processId) {
        var found = $filter('filter')($scope.bprocesses, {id: processId}, true);
         if (found.length) {
             console.log(found)
             return found[0];
         } else {
             '1';
         }
  }
  $scope.haltStation = function (stationId) {
    
    $http({
      url: '/bprocess/' + bpId + '/station/' + stationId + '/halt',
      method: "POST",
      data: {  }
      })
      .then(function(response) {
        // success
        console.log(response);
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
             console.log(found)
             return found;
         } else {
             '';
         }
     }

  
}]);

/**
 * BP Log
 */
// INDEX
minorityControllers.controller('BPloggerListCtrl', ['$scope', 'BPLogsFactory','BPLogFactory', 'BPLogStationFactory', '$location', '$route',
  function ($scope, BPLogsFactory, BPLogFactory, BPLogStationFactory, $location, $route) {

  /* callback for ng-click 'editUser': */
  $scope.editElem = function (bpId) {
    $location.path('/bp-detail/' + bpId + '/edit');
  };
  $scope.showElem = function (bpId) {
    $location.path('/bprocess/' + bpId + '/show');
  };
  /* callback for ng-click 'deleteUser': */
  $scope.deleteElem = function (bpId) {
    BPLogFactory.delete({ id: bpId });
    $scope.bplogs = BPLogsFactory.query();
  };
  /* callback for ng-click 'createBP': */
  $scope.createNewElem = function () {
    $location.path('/bprocess/new');
  };
 
  $scope.bplogs = BPLogsFactory.query({ BPid: $route.current.params.BPid });
}]);



/*
minorityControllers.controller('BProcessListCtrl', ['$scope', 'BProcess', function($scope, Process){
  // Find Processes
  $scope.findProcceses = function () {
    $scope.processes = [];
    var processes = BProcess.query(function() {
      $scope.processes = processes.concat($scope.processes);
    });
  }
  
}]);
*/
/**
minorityControllers.controller('ProcessCtrl', ['$scope', 'Message', function($scope, Message) {

//$scope.messages = [{'username': "lol", "text":"textss", "value": false, "type": "Block"}, $scope.mess];
//$scope.messages = []
$scope.getMessages = function() {
   $scope.messages = []
   var messages = Message.query(function() {
    $scope.messages = messages.concat($scope.messages);
  });

  console.log(messages);
};

**/