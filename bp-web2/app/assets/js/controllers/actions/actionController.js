define(['angular', 'app', 'controllers'], function (angular, minorityApp, minorityControllers) {

// INDEX
return minorityControllers.controller('actionController', ['$q','$rootScope',
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

      console.log('actionController');

      console.log($scope.$parent);
      console.log($scope.ngDialogData);

$scope.testerOut = {};
$scope.testBases = [];


$scope.testMiddleware = {"title": "Rest middleware",
"ident": "RestMiddleware",
"ifaceIdent": "RestMiddleware"};
$scope.testStrategy = {
"ident": "GETStrategy",
"isNullStrategy": false};

$scope.addBase = function() {
   $scope.testBases.push({
        "id": 6,
        "strategy": 7,
        "key": "URL",
        "baseType": "url",
        "valueType": "url",
        "valueContent": "http://httpbin.org/headers",
        "validationScheme": "url",
        "created_at": 1468994506267,
        "updated_at": 1468994506267,
        "headers": []
      })
}
$scope.delBase = function(item) { 
  var index = $scope.testBases.indexOf(item);
  $scope.testBases.splice(index, 1);     
}

$scope.delBaseHeader = function(testBase, item) { 
  var index = testBase.headers.indexOf(item);
  testBase.headers.splice(index, 1);     
}

$scope.addBaseHeader = function(testBase) {
    testBase.headers.push({"ke111y":"va22lue"});
   $scope.testBases.push({
        "id": 7,
        "strategy": 7,
        "key": "HEADERS",
        "baseType": "headers",
        "valueType": "headers",
        "valueContent": "[{\"ke111y\":\"va22lue\"}]",
        "validationScheme": "headers",
        "created_at": 1468994506267,
        "updated_at": 1468994506267,
        "headers": [{key: 'key',value:'value'}]
      }  )
}

$scope.addBaseHeaderEntity = function(testBase) {
  testBase.headers.push({key: 'key',value:'value'});
}

$scope.sendTest = function() {
        var url, actionId;
        if (!isNaN($scope.ngDialogData.actionId)) {
          actionId = $scope.ngDialogData.actionId;
        } else {
          actionId = $scope.ngDialogData.actionId.reaction.id; 
        }
        if ($scope.ngDialogData.testAction == 'refAction') {
          url = '/action/ref/'+actionId+'/test'
        } else {
          url = '/action/process/'+actionId+'/test'
        }
        // fill headers
        $scope.testBases = _.map($scope.testBases, function(t) {
          if (t.valueType == "headers") {
            console.log(t.headers);
            try { t.valueContent = JSON.stringify(t.headers); } catch(e) {
              console.log(e);
            } 
          }
            return t
        })

        $http({
            url: url,
            method: "POST",
            data: {    
                "middleware":
                  {
                    "id": 7,
                    "title": $scope.testMiddleware.title,
                    "ident": $scope.testMiddleware.ident,
                    "ifaceIdent": $scope.testMiddleware.ifaceIdent,
                    "reaction": 104,
                    "created_at": 1468994505857,
                    "updated_at": 1468994505857
                  },
                "strategy":
                  {
                    "id": 7,
                    "ident": $scope.testStrategy.ident,
                    "middleware": 7,
                    "isNullStrategy": false,
                    "created_at": 1468994506101,
                    "updated_at": 1468994506101
                  }
                ,
                "strategy_bases": $scope.testBases,
                "strategy_inputs": [],
                "strategy_outputs": []
            }

            })
            .then(function(response) {
              // success
              //$scope.stationsRefresh(); // Not for session controller
              //$scope.loadSessions();
              var out = response.data
              out.results = _.map(out.results, function(result) {
                try { result.content = JSON.parse(result.content) } catch(e) { console.log(e) }
                return result;
              });
              $scope.testerOut = out;
              //$scope.invoke_res = [response];
            },
            function(response) { // optional
              // failed
            }
            );

      }

}]);

});
