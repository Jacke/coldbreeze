'use strict';

/* Controllers */

angular.module('myApp.controllers', []).
  controller('StrcCtrl', [function() {

  }])
  .controller('PrdCtrl', [function() {

  }])  
  .controller('ReportsCtrl', [function() {

  }])  
  .controller('ProcessCtrl', [function() {

  }]);

var gabblerControllers =
angular.module(
  'myApp.controllers',
  [
    'myApp.services'
  ]
);
gabblerControllers.controller('PrdCtrl', ['$scope', 'Message', function($scope, Message) {

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

