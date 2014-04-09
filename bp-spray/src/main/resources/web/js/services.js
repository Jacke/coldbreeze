'use strict';

/* Services */
var minorityAppServices =
  angular.module(
    'minorityApp.services',
    [
      'ngResource'
    ]
  );

minorityAppServices.factory(
  'Message',
  function($resource) {
    return $resource('/bprocesses');
  });


var baseUrl = 'http://127.0.0.1\\:8080';


/*
**  Processes FACTORY
*/
minorityAppServices.factory('BProcessesFactory', function ($resource) {
    return $resource(baseUrl + '/bprocesses', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
});
minorityAppServices.factory('BProcessFactory', function ($resource) {
    return $resource(baseUrl + '/bprocess/:id/info', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
});


/*
** Proc Elements FACTORY
*/
/*
[{
  "id": 6,
  "title": "xx",
  "desc": "",
  "business": 2,
  "bprocess": 2,
  "b_type": "block",
  "type_title": "test block",
  "order": 1,
  "comps": [{
    "a_string": "betas",
    "a_int": 0,
    "b_int": 0,
    "a_bool": false,
    "b_bool": false
  }]
}]

*/
minorityAppServices.factory('BPElemsFactory', function ($resource) {
    return $resource(baseUrl + '/bprocess/:BPid/elements', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
});
minorityAppServices.factory('BPElemFactory', function ($resource) {
    return $resource(baseUrl + '/bprocess/:BPid/element/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
});

// Demonstrate how to register services
// In this case it is a simple value service.
//angular.module('minorityApp.services', []).
//  value('version', '0.1');
