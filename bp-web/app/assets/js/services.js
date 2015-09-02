'use strict';

define(['angular', 'app', 'angularanimate', 'jsRoutes'], function (angular, minorityApp, angularanimate, jsRoutes) {

/* Services */
var minorityAppServices =
  angular.module(
    'minorityApp.services',
    [
      'ngResource'
    ]
  );



minorityAppServices.factory(
  'Message', ['$resource',
  function($resource) {
    return $resource('/bprocesses');
  }]);


var baseUrl = jsRoutes.controllers.ProfileController.dashboard().absoluteURL(document.ssl_enabled);
//'http://localhost\\:9000';

minorityAppServices.factory('AuthInterceptor', ['$window', '$q', function ($window, $q) {
    return {
        request: function(config) {
            config.headers = config.headers || {};
            if ($window.sessionStorage.getItem('token')) {
                $http.defaults.headers.common['auth-token'] = $window.sessionStorage.getItem('token');
                config.headers.Authorization = $window.sessionStorage.getItem('token');
                config.headers.Access_Name = 'John';
            }
            return config || $q.when(config);
        },
        response: function(response) {
            if (response.status === 401) {
              console.log("401");
                // TODO: Redirect user to login page.
            }
            return response || $q.when(response);
        }
    };
}]);
/***********************************************************************************************************************************
******************************************  BProcess *******************************************************************************
************************************************************************************************************************************/

/*
**  Processes FACTORY
*/
minorityAppServices.factory('BProcessesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocesses', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('BProcessFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:id/info', {}, {
        show: { method: 'GET', params: { id: '@id'} },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
}]);


/*
** BProc Elements FACTORY
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
minorityAppServices.factory('ElementTopologsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/element_topos', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);
minorityAppServices.factory('BPElemsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/elements', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST', params: {id: '@BPid'}  }
    })
}]);
minorityAppServices.factory('BPElemFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/element/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', BPid: '@bprocess'} },
        delete: { method: 'DELETE', params: {id: '@id', BPid: '@bprocess'} }
    })
}]);

minorityAppServices.factory('BPSpacesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/spaces', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST', params: {id: '@BPid'} }
    })
}]);
minorityAppServices.factory('BPSpaceFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/space/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', BPid: '@bprocess'} },
        delete: { method: 'DELETE', params: {id: '@id', BPid: '@bprocess'} }
    })
}]);
minorityAppServices.factory('BPSpaceElemsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/space_elems', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('BPSpaceElemFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/space_elem/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id', BPid: '@bprocess'} },
        delete: { method: 'DELETE', params: {id: '@id', BPid: '@bprocess'} }
    })
}]);


/*
** BProc stations FACTORY
*/
minorityAppServices.factory('BPServicesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocesses/services', {}, {
        query: { method: 'GET', isArray: true },
    })
}]);
minorityAppServices.factory('BPStationsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/stations', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' },
        note: { method: 'POST' }
    })
}]);
minorityAppServices.factory('BPStationFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/station/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);


/*
** Sessions FACTORY
*/
minorityAppServices.factory('SessionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'sessions/', {}, {
        query: { method: 'GET', isArray: true },
        delete: { method: 'DELETE', isArray: false, url: 'session/:session_id' }
        //create: { method: 'POST' },
        //        perms: { method: 'GET', isArray: false, url: 'bprocess/:BPid/perms' }, // perms only

    })
}]);
minorityAppServices.factory('BPSessionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/sessions', {}, {
        query: { method: 'GET', isArray: false }
    })
}]);
minorityAppServices.factory('BPSessionFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/session/:id', {}, {
        show: { method: 'GET' },
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
/*
** State FACTORY
*/
minorityAppServices.factory('BPStatesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/states', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);
minorityAppServices.factory('BPStateFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/state/:id', {}, {
        show: { method: 'GET' },
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
minorityAppServices.factory('BPSessionStatesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/session/:id/states', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);
minorityAppServices.factory('BPSessionStateFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/session/:id/state/:state_id', {}, {
        show: { method: 'GET' },
        delete: { method: 'DELETE', params: {id: '@id', state_id: '@state_id'} } 
    })
}]);
minorityAppServices.factory('SwitchesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/switches', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }

    })
}]);
minorityAppServices.factory('SwitchFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/switch/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
// Reaction
minorityAppServices.factory('ReactionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/reactions', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }

    })
}]);
minorityAppServices.factory('ReactionFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/reaction/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);







/************************************************************************************************
**
** Refs Factories
**
*************************************************************************************************/
minorityAppServices.factory('RefsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'refs/', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('RefFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);







// ELEMS
minorityAppServices.factory('RefElemsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/:id/elems', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('RefElemFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/elem/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
// SPACES
minorityAppServices.factory('RefSpacesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/:id/spaces', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('RefSpaceFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/space/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
// SPACE ELEMENTS
minorityAppServices.factory('RefSpaceElemsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/:id/spaceelems', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('RefSpaceElemFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/spaceelem/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
// STATES
minorityAppServices.factory('RefStatesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/:id/states', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }

    })
}]);
minorityAppServices.factory('RefStateFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/state/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
// SWITCHES
minorityAppServices.factory('RefSwitchesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/:id/switches', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }

    })
}]);
minorityAppServices.factory('RefSwitchFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/switch/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);
// Reaction
minorityAppServices.factory('RefReactionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/:id/reactions', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }

    })
}]);
minorityAppServices.factory('RefReactionFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'ref/reaction/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} }, 
        delete: { method: 'DELETE', params: {id: '@id'} } 
    })
}]);







/*
** Employees FACTORY
*/
minorityAppServices.factory('EmployeesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'actors', {}, {
        query: { method: 'GET', isArray: false }
    })
}]);


/*
** Permissions FACTORY
*/
minorityAppServices.factory('PermissionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'elemperms', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);

minorityAppServices.factory('ProcPermissionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/elemperms', {}, {
        query: { method: 'GET', isArray: false },
        peoples: { method: 'GET', isArray: false, url: 'api/v1/peoples'  }, // groups and employees only
        perms: { method: 'GET', isArray: false, url: 'bprocess/:BPid/perms' }, // perms only

        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('PermissionFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'elemperm/:id', {}, {
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
}]);



/* 
** BPInputLogger FACTORY
*/
minorityAppServices.factory('BPInLoggersFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/input_logs', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);
minorityAppServices.factory('BPInLoggersSessionFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/input_logs/:session_id', {}, {
        query: { method: 'GET', isArray: true }
    })
}]);


minorityAppServices.factory('InteractionsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'interact/:session_id', {}, {
        query: { method: 'GET', isArray: false }
    })
}]);

/*
** BPLoggers FACTORY
*/
minorityAppServices.factory('BPLogsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/logs', {}, {
        query: { method: 'GET', isArray: false },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('BPLogFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/log/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
}]);
minorityAppServices.factory('BPLogStationFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/logs/:station_id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {station_id: '@station_id'} },
        delete: { method: 'DELETE', params: {station_id: '@station_id'} }
    })
}]);


/*
** BPRequest
*/

minorityAppServices.factory('BPRequestFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'bprocess/:BPid/request/:station_id', {}, {
        //query: { method: 'GET', isArray: true },
        scheme: { method: 'GET'}, //, params: {bprocess_id: '@id'} },
        send: { method: 'POST' }
    })
}]);


/***********************************************************************************************************************************
****************************************** Resources *******************************************************************************
************************************************************************************************************************************/

/*
** Business
*/
minorityAppServices.factory('BusinessesFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'businesses/', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('BusinessFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'business/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
}]);


/*
** Clients
*/
minorityAppServices.factory('ClientsFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'business/:BID/clients/', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('ClientFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'business/:BID/client/:id', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
}]);


/*
** Observers
*/
minorityAppServices.factory('ObserversFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'observers/:process/:station', {}, {
        query: { method: 'GET', params: {id: '@process', station: '@station'}, isArray: true },
        create: { method: 'POST' }
    })
}]);
minorityAppServices.factory('ObserverFactory', ['$resource', function ($resource) {
    return $resource(baseUrl + 'observe/:observe_id', {}, {
        show: { method: 'GET' },
        delete: { method: 'DELETE', params: {observe_id: '@observe_id'} }
    })
}]);



// Demonstrate how to register services
// In this case it is a simple value service.
//angular.module('minorityApp.services', []).
//  value('version', '0.1');
// 
  return minorityAppServices; 
   
});