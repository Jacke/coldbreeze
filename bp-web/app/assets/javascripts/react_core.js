/**
 * Common functionality.
 */

//define(['angularAMD', 'angular',
//	'core',
//'pnotify'//,
         /*
'angular-animate',
'angular-websocket',
'toastr',
//'toastr-tpl',
'angular-pageslide-directive',
'jcs-auto-validate',
'angular-classy',
'angular-resource',
'angular-cookies',
'select',
'pnotifyconfirm',
'pnotifybuttons',
'angularpnotify',

'roundProgress',
'angular-moment',
'livestamp',
'ngDialog',
'angular-ui-tree',
'angular-underscore',
'loading-bar',
'ng-slide-down',
'ui-bootstrap',
'ui-bootstrap-tpls',
'toaster',
'angularLocalStorage',
'angular-awesome-error',
'angular-translate',
'daterangepicker',
'angular-daterangepicker',
'filters',
'services',
'launches',
'treebuilder',
'controllers',
'procPermController',
'historyController',
'procController',
'procDetailController',
'procCreateController',
'requestController',
'loggerController',
'stationController',
'procElementController',
'reflectionController',
'sessionController',
'directives',
'classie',
'cssParser'*/
//],
/*
require(['angularAMD', 'angular',
	'core',
'pnotify'], function(angularAMD, angular, core, pnotify) {
  'use strict';
  console.log(angular);
  console.log(controllers);
  return angularAMD.bootstrap(controllers);
  //.module('yourprefix.common', ['common.helper', 'common.playRoutes', 'common.filters','common.directives.example']);
});
*/
var React = require('react')
var ReactApp = require('./reactapp')

  var reactapp = new ReactApp();
  reactapp.init();


	console.log(reactapp);
//});
