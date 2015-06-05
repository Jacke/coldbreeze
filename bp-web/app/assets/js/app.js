
'use strict';


var translationsEN = {
  PERMISSIONS: 'Permissions',
  SESSIONS: 'Sessions',
  ALL_SESSIONS: 'All Sessions',
  DELETE: 'Delete',
  ADD: 'Add',
  PEOPLE: 'People',
  SHARE: 'Share',
  STATIONS: 'Launches',
  ALL_SERVICES: 'All services',
  SERVICE: 'Service',
  NEW_PROCESS:'New process',
  PROCESS:'Process',
  TREE: 'Tree',
  EDIT: 'Edit',
  ADD_TO_SPACE: 'Add',
  SPACE: 'Space',
  UPDATE: 'Update',
  CREATE: 'Create',
  CONTAINER: 'Container',
  CONFIRM: 'Confirm',
  CANCEL: 'Cancel',
  TITLE: 'Title',
  DESC: 'Description',
  CONFDESC: 'Element, that require confirmation from user before it will completed.',
  CONTDESC: 'Element, that store inside other element.',
  CONFDESCFULL: 'Element, that require confirmation from user before it will completed. Use it, for steps that require confirmation from employee.',
  CONTDESCFULL: 'Element, that store inside other element. Use it, for separate your process logic.',
  RUNNED: 'Process arleady runned, if you edit that, all launches',
  WILL_BE_SHUTDOWN:'will be shut down' ,
  CREATE_OR_COPY: 'You can create',
  CREATE_OR_COPY2: 'of that process and continue editing.',
  COPY: 'copy',
  SEARCH_PROC: 'Search processes',
  CREATE_NEW_PROC: 'Create Process',
  AFTER_PAYING: 'This features avaliable only after paying',
  OBSERVERS: 'OBSERVERS',
  EMBEDING: 'EMBEDING',
  OBSERV_DESC: 'Client access to your process launches',
  EMB_DESC: 'Embed your processes to your website',
  STARTED: 'Started',
  FINISHED: 'Finished',
  CANCELED: 'Canceled',
  PAUSED: 'Paused',
  LOGS: 'Logs',
  ILOGS: 'Input Logs',
  RUN: 'Launch',
  RUN_SCRATCH: 'Run from scratch',
  RUN_FROM_DESC: 'Arleady runned and paused',
  TURN_DOWN: 'Turn down',
  RUN_FROM: 'Run from',
  RUN_FROM_ANOT: 'Run from specific active point',
  // Tables
  ELEMENT: 'Element',
  DATE: 'Date',
  STEP: 'Step',
  CV: 'Values',
  USER: 'User',
  ACTION: 'Action',
  ARGIMENTS: 'Arguments',
  INVOKED: 'Invoked',
  SHOW_ALL: 'Show all',
  EMBED_AFTER_TRIAL: 'Embeding on your Website or Application will be avaliable after one week of using Minority.',
  EMAILS: 'Emails',
  MAKE_CONFIRMED: 'Its confirmed',
  FULL_NAME: 'Full name',
  ADD_OBSERVER: 'Add observer',
  OPEN: 'Open'
};
 
var translationsRU= {
  PERMISSIONS: 'Права',
  DELETE: 'Удалить',
  ADD: 'Добавить',
  PEOPLE: 'Люди',
  SESSIONS: 'Сессии',
  ALL_SESSIONS: 'All Sessions',
  SHARE: 'Поделиться',
  STATIONS: 'Запуски',
  SERVICE: 'Услуга',
  ALL_SERVICES: 'Все услуги',
  NEW_PROCESS:'Новый процесс',
  PROCESS:'Процесс',
  TREE: 'Дерево',
  EDIT: 'Редактировать',
  ADD_TO_SPACE: 'Добавить',
  SPACE: 'Пространство',
  UPDATE: 'Обновить',
  CREATE: 'Добавить',
  CONTAINER: 'Контейнер',
  CONFIRM: 'Потдверждение',
  CANCEL: 'Отменить',
  TITLE: 'Заголовок',
  DESC: 'Описание',
  CONFDESC: 'Блок Подтверждения',
  CONTDESC: 'Блок контейнер',
  CONFDESCFULL: 'Описание блока подтверждения',
  CONTDESCFULL: 'Описание контейнера',
  RUNNED: 'Процесс уже запущен, если выхотите редактировать его',
  WILL_BE_SHUTDOWN:'будет отключен.' ,
  CREATE_OR_COPY: 'Вы можете создать',
  CREATE_OR_COPY2: 'этого процесса и продолжить редактирование.',
  COPY: 'копию',
  SEARCH_PROC: 'Поиск процессов',
  CREATE_NEW_PROC: 'Создать процесс',
  AFTER_PAYING: 'Эта функция будет доступна после оплаты',
  OBSERVERS: 'Наблюдятели',
  EMBEDING: 'Встраивание',
  OBSERV_DESC: 'Доступ для ваших клиентов к актуальному состоянию процесса.',
  EMB_DESC: 'Встраивание процесса на сайт',
  STARTED: 'Запущен',
  FINISHED: 'Заверщен',
  CANCELED: 'Отменен',
  PAUSED: 'Приостановлен',
  LOGS: 'Логи',
  ILOGS: 'Логи взаимодействия',
  RUN: 'Запуск',
  RUN_SCRATCH: 'Запуск с чистого листа',
  RUN_FROM_DESC: 'Запуск с приостановленного состояния',
  TURN_DOWN: 'Завершить',
  RUN_FROM: 'Запуск с',
  RUN_FROM_ANOT: 'Запуск с приостановленного состояния',
  // Tables
  ELEMENT: 'Элемент',
  DATE: 'Дата',
  STEP: 'Шаг',
  CV: 'Значения',
  USER: 'Пользователь',
  ACTION: 'Действие',
  ARGIMENTS: 'Аргументы',
  INVOKED: 'Выполнен',
  SHOW_ALL: 'Показать все',
  EMBED_AFTER_TRIAL: 'Встраивание Minority на ваш ВебСайт или приложение будет доступно после одной недели использования Minority.',
  EMAILS: 'Emails',
  MAKE_CONFIRMED: 'Подтверждить',
  FULL_NAME: 'Имя',
  ADD_OBSERVER: 'Добавить наблюдателя',
  OPEN: 'Открыть'
};




var minorityApp =
  angular.module(
    'minorityApp',
    [
  
      'minorityApp.services',
      'minorityApp.TreeBuilderService',
      'minorityApp.controllers',
      'ngRoute',
      'ngResource',
      'chieffancypants.loadingBar',
      'ngCookies',
      'angularLocalStorage',
      'classy',
      'ngAngularError',
      'toaster',
      'angular-underscore',
      'ui.bootstrap',
      'ui.select',
      'ng-slide-down',
//      'ui.sortable',
      'ngDialog',
      'angularMoment',
      'daterangepicker',
      'ui.tree',
      'pascalprecht.translate',
      'pageslide-directive'
    ]
  );
minorityApp.filter('slice', function() {
  return function(arr, start, end) {
    return arr.slice(arr.length-start, end);
  };
});
minorityApp.config(['$translateProvider', function ($translateProvider) {
  // add translation tables
  $translateProvider.translations('en', translationsEN);
  $translateProvider.translations('ru', translationsRU);
  //$translateProvider.useLocalStorage();
  $translateProvider.preferredLanguage('en');
  
  $translateProvider.fallbackLanguage('en');
}]);
minorityApp.directive('loading', ['$http' , function ($http) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            var oldNgClick = attrs.ngClick;
            scope.isLoading = function () {
                return $http.pendingRequests.length > 0;
            };
 
            scope.$watch(scope.isLoading, function (value) {
                if (value) {
                    element.attr("disabled", "disabled");
                    $(element).click(function (event) {
                        event.preventDefault();
                    });
 
                } else {
 
                    if (oldNgClick) {
                        attrs.$set('ngClick', oldNgClick);
                        element.bind('click', function () {
                            scope.$apply(attrs.ngClick);
                        });
                    } else {
                        $(element).unbind('click');
                    }
                    element.removeAttr("disabled");
 
                }
            });
        }
    };
 
}]);
minorityApp.config(['$locationProvider','$routeProvider', '$httpProvider', function($locationProvider, $routeProvider, $httpProvide) {

//$locationProvider.html5Mode(true);

/*Credentials managment*/
     $routeProvider.when('/profile', {templateUrl: '/assets/partials/profile.html', controller: 'ProfileController'});
// BProcess
/*I*/$routeProvider.when('/bprocesses', {
                 templateUrl: '/assets/partials/bprocesses/bp-list.html', 
                 controller: 'BProcessListCtrl',
                 resolve: { Auth: ['$http', '$q', '$window', '$rootScope', function($http, $q, $window, $rootScope) {
//                    var deffered = $q.defer();
              var token = $window.sessionStorage.getItem('token'); 
              var biz_id = $window.localStorage.getItem('business');
              if (biz_id == undefined || biz_id == "-1") {
                 $rootScope.whoami = $http.post(jsRoutes.controllers.Application.whoami().absoluteURL(document.ssl_enabled), { 
                  headers:  {'X-Auth-Token': token, 'Access_Name': 'user'}}).then(function (profile) {
                    $window.sessionStorage.setItem("business", profile.business);
                    $window.sessionStorage.setItem("employee", profile.employee);
                    $window.sessionStorage.setItem("manager", profile.manager);
                  })

              }
 //                   $rootScope.whoami = $http.post('https://min.ority.us/whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'user'}})
  //                    .then(function (profile) {
   //                    console.log("profile " + profile);
     //                  $window.sessionStorage.setItem('manager', profile.manager);
                $rootScope.manager = $window.localStorage.getItem('manager') == "true";
                $rootScope.business = parseInt($window.localStorage.getItem('business'));
         //              $window.localStorage.setItem('business', profile.business);
               $rootScope.employee = $window.localStorage.getItem('employee') == "true";
           //            deffered.resolve(profile);
             //           })

               //         return deffered.promise;
                    }]
                  }
                });
/*C*/$routeProvider.when('/bprocess/new', {templateUrl: '/assets/partials/bprocesses/bp-new.html', controller: 'BPCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:id/show', {templateUrl: '/assets/partials/bprocesses/bp-detail.html', controller: 'BProcessDetailCtrl'});
/*a*/
    // Embed
/*I*/$routeProvider.when('/bprocess/:BPid/embed', {templateUrl: '/assets/partials/bp_elements/embeded.html', controller: 'BPEmbededCtrl'});
    // Proc Elements
/*I*/$routeProvider.when('/bprocess/:BPid/elements', {templateUrl: '/assets/partials/bp_elements/bpelem-list.html', controller: 'BPelementListCtrl', reloadOnSearch: false});
/*C*/$routeProvider.when('/bprocess/:BPid/element/new', {templateUrl: '/assets/partials/bp_elements/bpelem-new.html', controller: 'BPelementCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/element/:id/show', {templateUrl: '/assets/partials/bp_elements/bpelem-detail.html', controller: 'BPelementDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/element/:id/edit', {templateUrl: '/assets/partials/bp_elements/bpelem-edit.html', controller: 'BPelementDetailCtrl'});

    // Stations
/*A*/$routeProvider.when('/sessions', {templateUrl: '/assets/partials/sessions/sessions.html', controller: 'SessionsCtrl'});
/*I*/$routeProvider.when('/bprocess/:BPid/stations', {templateUrl: '/assets/partials/bpstations/bpstation-list.html', controller: 'BPstationListCtrl'});
/*C*/$routeProvider.when('/bprocess/:BPid/station/new', {templateUrl: '/assets/partials/bpstations/bpstation-new.html', controller: 'BPstationCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/station/:id/show', {templateUrl: '/assets/partials/bpstations/bpstation-detail.html', controller: 'BPstationDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/station/:id/edit', {templateUrl: '/assets/partials/bpstations/bpstation-edit.html', controller: 'BPstationDetailCtrl'});

   // Permissions
/*I*/$routeProvider.when('/bprocess/:BPid/perms', {templateUrl: '/assets/partials/perms/perm-list.html', controller: 'BPPermListCtrl'});
/*C*/$routeProvider.when('/bprocess/:BPid/perm/new', {templateUrl: '/assets/partials/perms/perm-new.html', controller: 'BPPermCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/perm/:id/show', {templateUrl: '/assets/partials/perms/perm-detail.html', controller: 'BPPermDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/perm/:id/edit', {templateUrl: '/assets/partials/perms/perm-edit.html', controller: 'BPPermDetailCtrl'});
     // Inputs
/*C*/$routeProvider.when('/bprocess/:BPid/input', {templateUrl: '/assets/partials/inputs/inputs.html', controller: 'BPRequestCtrl'});
     // Reflections
/*I*/$routeProvider.when('/ref', {templateUrl: '/assets/partials/reflections/ref-list.html', controller: 'ReflectionCtrl'});  
/*C*/$routeProvider.when('/ref/new', {templateUrl: '/assets/partials/reflections/ref-list.html', controller: 'ReflectionCtrl'});  
  

     $routeProvider.otherwise({redirectTo: '/bprocesses'});



}]).run(['$q','$window','$http' ,'$rootScope', '$injector', function($q, $window, $http, $rootScope,$injector) {
    var token = $window.sessionStorage.getItem('token');

    $rootScope.type_short = {"container_brick":"CN", "confirm":"CF", "positive":"PH", "placeholder":"PH" }; // Letters for element types
    $rootScope.switcher_conf2 = $http({
      url: 'configuration/',
      method: "PUT",
      data: {  }
      })
      .then(function(response) {
        $rootScope.switcher_conf = response;
      },
      function(response) { }
      );

    $injector.get("$http").defaults.transformRequest = function(data, headersGetter) {
        headersGetter()['X-Auth-Token'] = $window.sessionStorage.getItem('token');

        if (data) {
            return angular.toJson(data);
        }
    };
}]);




/* Filters

angular.module('myApp.filters', []).
  filter('interpolate', ['version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    }
  }]);
*/





































