'use strict';

/* Services */
var myAppServices =
  angular.module(
    'myApp.services',
    [
      'ngResource'
    ]
  );

myAppServices.factory(
  'Message',
  function($resource) {
    return $resource('/process');
  });



// Demonstrate how to register services
// In this case it is a simple value service.
//angular.module('myApp.services', []).
//  value('version', '0.1');
