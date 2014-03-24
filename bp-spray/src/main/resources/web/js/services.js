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
    return $resource('/processes');
  });

var baseUrl = 'http://127.0.0.1\\:8080';

myAppServices.factory('UsersFactory', function ($resource) {
    return $resource(baseUrl + '/processes', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
});

myAppServices.factory('UserFactory', function ($resource) {
    return $resource(baseUrl + '/process/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
});

// Demonstrate how to register services
// In this case it is a simple value service.
//angular.module('myApp.services', []).
//  value('version', '0.1');
