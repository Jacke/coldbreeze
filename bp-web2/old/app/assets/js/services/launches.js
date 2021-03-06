'use strict';

define(['angular', 'app', 'angularanimate', 'jsRoutes', 'services'], function (angular, minorityApp, angularanimate, jsRoutes, minorityAppServices) {

var baseUrl = jsRoutes.controllers.ProfileController.dashboard().absoluteURL(document.ssl_enabled);


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
        update: { method: 'PUT', params: {id: '@id', launch_id: '@launch'} },
        delete: { method: 'DELETE', params: {id: '@id', launch_id: '@launch'} }
    })
}]);
minorityAppServices.factory('LaunchSwitchersFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/switchers', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('LaunchSwitcherFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/switcher/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', launch_id: '@launch'} },
        delete: { method: 'DELETE', params: {id: '@id', launch_id: '@launch'} }
    })
}]);
minorityAppServices.factory('LaunchReactionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/reactions', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('LaunchReactionFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/reaction/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', launch_id: '@launch'} },
        delete: { method: 'DELETE', params: {id: '@id', launch_id: '@launch'} }
    })
}]);
minorityAppServices.factory('LaunchInitialStateFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'launch/:launch_id/initial_state', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);

minorityAppServices.factory('DataCostCollection', ['$resource', function ($resource) {
    return $resource(baseUrl + 'data/cost/collection/', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);

minorityAppServices.factory('DataCostAssign', ['$resource', function ($resource) {
    return $resource(baseUrl + 'data/cost/assigns/:BPid', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);
minorityAppServices.factory('DataCostLaunchAssign', ['$resource', function ($resource) {
    return $resource(baseUrl + 'data/cost/launch_assigns/:launchId', {}, {
        query: { method: 'GET', isArray: false }
    })
}]);

minorityAppServices.factory('DataCostElementLaunchAssign', ['$resource', function ($resource) {
    return $resource(baseUrl + 'data/cost/elem_launch_assigns/:launchId', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);




});
