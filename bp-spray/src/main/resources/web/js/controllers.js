'use strict';

/* Controllers */
  /*.run(function ($rootScope, $templateCache) {
  $rootScope.$on('$viewContentLoaded', function () {
    $templateCache.removeAll();
  });
});*/
angular.module('myApp.controllers', []).
  controller('ProcessCtrl', [function() {

  }])
  .controller('PrdCtrl', [function() {

  }])  
  .controller('ReportsCtrl', [function() {

  }])  
  .controller('UserListCtrl', [function () {

  }])
  .controller('UserDetailCtrl', [function () {

  }])
  .controller('UserCreationCtrl', [function () {

  }]);
  

var gabblerControllers =
angular.module(
  'myApp.controllers',
  [
    'myApp.services'
  ]
);





  gabblerControllers.controller('UserListCtrl', ['$scope', 'UsersFactory','UserFactory', '$location', function ($scope, UsersFactory, UserFactory, $location) {

    /* callback for ng-click 'editUser': */
    $scope.editUser = function (userId) {
      $location.path('/bp-detail/' + userId);
    };
    $scope.showUser = function (userId) {
      $location.path('/show-detail/' + userId);
    };

    /* callback for ng-click 'deleteUser': */
    $scope.deleteUser = function (userId) {
      UserFactory.delete({ id: userId });
      $scope.users = UsersFactory.query();
    };

    /* callback for ng-click 'createUser': */
    $scope.createNewUser = function () {
      $location.path('/bp-creation');
    };
   

    $scope.users = UsersFactory.query();
  }]);

  gabblerControllers.controller('UserDetailCtrl', ['$scope', '$routeParams', 'UserFactory', '$location', '$http',
  function ($scope, $routeParams, UserFactory, $location, $http) {


    $scope.updateUser = function () {
      UserFactory.update($scope.user);
      $location.path('/bp-list');
    };



    $scope.cancel = function () {
      $location.path('/bp-list');
    };
    $scope.invokeBP = function (bpid) {
        $http({
        url: 'process/' + bpid + '/invoke',
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
    $scope.bpid = $routeParams.id;
    $scope.selectedTab = 1;
    $scope.user = UserFactory.show({id: $routeParams.id});
  }]);

  gabblerControllers.controller('UserCreationCtrl', ['$scope', 'UsersFactory', '$location',
  function ($scope, UsersFactory, $location) {

  
    $scope.createNewUser = function () {
      UsersFactory.create($scope.user);
      $location.path('/bp-list');
    }
  }]);




gabblerControllers.controller('ProcessCtrl', ['$scope', 'Message', function($scope, Message) {

//$scope.messages = [{'username': "lol", "text":"textss", "value": false, "type": "Block"}, $scope.mess];
//$scope.messages = []
$scope.getMessages = function() {
   $scope.messages = []
   var messages = Message.query(function() {
    $scope.messages = messages.concat($scope.messages);
  });

  console.log(messages);
};
$scope.getMessages();
$scope.message = new Message({  "id": null,
  "title": "",
  "address": "",
  "city": "",
  "state": "",
  "zip": "" });

$scope.sendMessage = function() {
  var object = $scope.message.$save(); // POST Request
  console.log($scope.message);
  console.log(object);
  $scope.getMessages();
  //$scope.message = new Message({  "id": null,
  //"title": "",
  //"address": "",
  //"city": "",
  //"state": "",
  //"zip": "" });
};
}]);

