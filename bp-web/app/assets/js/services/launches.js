'use strict';

define(['angular', 'app', 'angularanimate', 'jsRoutes', 'services'], function (angular, minorityApp, angularanimate, jsRoutes, minorityAppServices) {

minorityAppServices.factory('LaunchElementTopologsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/element_topos', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);
minorityAppServices.factory('LaunchElemsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/elements', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST', params: {id: '@launch'}  }
    })
}]);
minorityAppServices.factory('LaunchElemFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/element/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', launch: '@launch'} },
        delete: { method: 'DELETE', params: {id: '@id', launch: '@launch'} }
    })
}]);

minorityAppServices.factory('LaunchSpacesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/spaces', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST', params: {id: '@launch'} }
    })
}]);
minorityAppServices.factory('LaunchSpaceFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/space/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', launch: '@launch'} },
        delete: { method: 'DELETE', params: {id: '@id', launch: '@launch'} }
    })
}]);
minorityAppServices.factory('LaunchSpaceElemsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/space_elems', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('LaunchSpaceElemFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/space_elem/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', BPid: '@launch'} },
        delete: { method: 'DELETE', params: {id: '@id', BPid: '@launch'} }
    })
}]);


});
