'use strict';





define(['angular', 'toaster','toastr', 'angularanimate','roundProgress'], function (angular, toaster, toastr,angularanimate, roundProgress) {



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
/*
[ "chieffancypants.loadingBar",
"ngAnimate",
"ngSanitize",
"ngResource",
"ngCookies",
"ui.router",
"ui.bootstrap",
"colorpicker.module",
"iso-3166-country-codes",
"infinite-scroll",
"angulartics",
"angulartics.google.analytics",
"angulartics.mixpanel",
"ac-adWordsTracking",
"angular-chartist",
"daterangepicker",
"angular-clipboard",
"ac-presence" ]);
*/
var minorityApp =
  angular.module(
    'minorityApp',
    [
      'minorityApp.services',
      'minorityApp.TreeBuilderService',
      'minorityApp.controllers',
      'ngRoute',
      'formly',
      'formlyBootstrap',
      'ngResource',
      'jcs-autoValidate',
      'chieffancypants.loadingBar',
      'ngCookies',
      'cgNotify',
      'angularLocalStorage',
      'angular-progress-arc',
      'classy',
      //'angular-filepicker',
      'ngAudio',
      'jlareau.pnotify',
      'yaru22.hovercard',
      'dndLists',
      '720kb.tooltips',
      'ngSanitize',
      'ngAngularError',
      'restangular',
      'hljs',
      'ui.select',
      'angular-cache',
      'toaster',
      'ngAnimate',
      'toastr',
      'ngFileUpload',
      'ngWebSocket',
      'angular-underscore',
      'angular-toasty',
      'ui.bootstrap',
      'ui.select',
      'ng-slide-down',
      //'ui.sortable',
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

minorityApp.filter("toProcessArray", function() {
   return function(input) {
       if(!input) return;

       if (input instanceof Array) {
           return input;
       }

       return [];
   };
});

minorityApp.filter('getExtension', function () {
  return function (url) {
    return url.split('.').pop();
  };
})

minorityApp.config(['toastyConfigProvider', function(toastyConfigProvider) {
    toastyConfigProvider.setConfig({
        sound: true,
        shake: false
    });
}]);

minorityApp.factory(
  'popupFactory', ['$resource', 'ngDialog',
  function($resource, ngDialog) {

    var methods = {
        //collection: collection,
        pop: function(object) {
          console.log("popup");
          console.log(object)//dataStream.send(JSON.stringify({ action: 'get' }));
          if (object.target == "first-launch") {
          ngDialog.open({
                template: '/assets/partials/popup/first-process-launch.html',
                //template: '/assets/partials/popup/first-process-finished.html',
                controller: 'LaunchesCtrl'
              });
          }
          if (object.target == "first-finished")
              ngDialog.open({
                    template: '/assets/partials/popup/first-process-finished.html',
                    //template: '/assets/partials/popup/first-process-finished.html',
                    controller: 'LaunchesCtrl'
                  });
          }

      };

      return methods;

  }]);

minorityApp.factory('NotificationBroadcaster', ['$rootScope','$websocket', 'notify','$window', 'toastr','toasty','ngAudio', 'popupFactory',
function($rootScope,$websocket, notify,$window, toastr,toasty, ngAudio, popupFactory) {
      // Open a WebSocket connection
      var baseUrl = $window.location.host;
      if (document.ssl_enabled) {
         var ws_type = "wss://";
      } else { var ws_type = "ws://" }

      notify.config({
        duration: 10000,
        position: 'right'
      })
      var collection = [];
      var isError = false;
      var socketLoad = function (isError) {

          var dataStream = $websocket(ws_type + baseUrl + '/notify');
          dataStream.onMessage(function(message) {
            console.log(message);
            var object = JSON.parse(message.data);
            notify({ message: message.data, duration: 10000});
            toasty.success({
              title: message.type,
              msg: object.msg
            });
                                    
            if (object.type == "message") {
                if (object.msg == "cache") {
                  // clean cache
                  var i = $window.sessionStorage.length;
                  while(i--) {
                    var key = $window.sessionStorage.key(i);
                    if(/angular-cache.caches/.test(key)) {
                      $window.sessionStorage.removeItem(key);
                    }
                  }
                } else {
                  console.log('object', object);
                  var sound = ngAudio.load("/assets/audio/notification.mp3");
                  sound.play();

                  toasty.success({
                    title: message.type,
                    msg: object.msg
                  })
                }
                //toastr.success(message.type, object.msg);
            }
            // laucnh locker
            if (object.type == "launchLocker") {
               $rootScope.$broadcast('launchLocker', {launchId: object.launchId, lockState: object.state });
            }
            // laucnh locker
            if (object.type == "resourceUpdate") {
               console.log('resource update', object);
               $rootScope.$broadcast('resourceUpdate', { });
            }

            if (object.type == "popup") {
              popupFactory.pop(object);
            }
            collection.push(object);
          });
          dataStream.onClose(function(message) {
            if (isError != true) {
              socketLoad();
            }
          });
          dataStream.onerror = function(message) {
            console.log("ws error");
            isError = true;
            console.log(message);//socketLoad();
          };
          return dataStream;

      }
      var dataStream = socketLoad();


      var methods = {
        collection: collection,
        get: function() {
          dataStream.send(JSON.stringify({ action: 'get' }));
        }
      };

      return methods;
}]);


minorityApp.provider('lkGoogleSettings', function () {
    this.apiKey   = 'AIzaSyC_wPVwox46HJlkHVQWgKhy6dnZ0kYfCaA';
    this.clientId = '629371862094-egfiim60lfulkrvb9e3iqpl5a2nk5c69.apps.googleusercontent.com';
    this.scopes   = ['https://www.googleapis.com/auth/drive'];
    this.features = ['MULTISELECT_ENABLED'];
    this.views    = [
      'DocsView().setIncludeFolders(true)',
      'DocsUploadView().setIncludeFolders(true)'
    ];
    this.locale   = 'en'; // Default to English

    /**
     * Provider factory $get method
     * Return Google Picker API settings
     */
    this.$get = ['$window', function ($window) {
      return {
        apiKey   : this.apiKey,
        clientId : this.clientId,
        scopes   : this.scopes,
        features : this.features,
        views    : this.views,
        locale   : this.locale,
        origin   : this.origin || $window.location.protocol + '//' + $window.location.host
      }
    }];

    /**
     * Set the API config params using a hash
     */
    this.configure = function (config) {
      for (var key in config) {
        this[key] = config[key];
      }
    };
  })

  minorityApp.directive('lkGooglePicker', ['lkGoogleSettings', function (lkGoogleSettings) {
    return {
      restrict: 'A',
      scope: {
        onLoaded: '&',
        onCancel: '&',
        onPicked: '&'
      },
      link: function (scope, element, attrs) {
        var accessToken = null;

/*
        function instanciate () {
          // gapi.load('auth', { 'callback': onApiAuthLoad });
          // gapi.load('picker');
        }


        function onApiAuthLoad () {
          var authToken = gapi.auth.getToken();

          if (authToken) {
            handleAuthResult(authToken);
          } else {
            gapi.auth.authorize({
              'client_id' : lkGoogleSettings.clientId,
              'scope'     : lkGoogleSettings.scopes,
              'immediate' : false
            }, handleAuthResult);
          }
        }

        function handleAuthResult (result) {
          if (result && !result.error) {
            accessToken = result.access_token;
            openDialog();
          }
        }


        function openDialog () {
          var picker = new google.picker.PickerBuilder()
                                 .setLocale(lkGoogleSettings.locale)
                                 .setOAuthToken(accessToken)
                                 .setCallback(pickerResponse)
                                 .setOrigin(lkGoogleSettings.origin);

          if (lkGoogleSettings.features.length > 0) {
            angular.forEach(lkGoogleSettings.features, function (feature, key) {
              picker.enableFeature(google.picker.Feature[feature]);
            });
          }

          if (lkGoogleSettings.views.length > 0) {
            angular.forEach(lkGoogleSettings.views, function (view, key) {
              view = eval('new google.picker.' + view);
              picker.addView(view);
            });
          }

          picker.build().setVisible(true);
        }

        function pickerResponse (data) {
          gapi.client.load('drive', 'v2', function () {
            if (data.action == google.picker.Action.LOADED && scope.onLoaded) {
              (scope.onLoaded || angular.noop)();
            }
            if (data.action == google.picker.Action.CANCEL && scope.onCancel) {
              (scope.onCancel || angular.noop)();
            }
            if (data.action == google.picker.Action.PICKED && scope.onPicked) {
              (scope.onPicked || angular.noop)({docs: data.docs});
            }
            scope.$apply();
          });
        }

        gapi.load('auth');
        gapi.load('picker');

        element.bind('click', function (e) {
          instanciate();
        });
        */
      }
    }
  }]);

minorityApp.filter('prettyJSON', function () {
    function prettyPrintJson(json) {
      return JSON ? JSON.stringify(json, null, '  ') : 'your browser doesnt support JSON so cant pretty print';
    }
    return prettyPrintJson;
});

minorityApp.provider("DropBoxSettings", function() {
    this.box_linkType = 'shared', this.box_multiselect = 'true', this.box_clientId = null, this.linkType = 'preview', this.multiselect = false, this.$get = function() {
        return {
            linkType: this.linkType,
            multiselect: this.multiselect,
            //extensions: this.extensions,
            box_linkType: this.box_linkType,
            box_multiselect: this.box_multiselect,
            box_clientId: this.box_clientId

        }
    },
    this.configure = function (config) {
      for (var key in config) {
        this[key] = config[key];
      }
    };

});
minorityApp.directive("dropBoxPicker", ["DropBoxSettings",
            function(DropBoxSettings) {
    return {
        restrict: "A",
        scope: {
            dbpickerFiles: "="
        },
        link: function(scope, element, attrs) {
            function instanciate() {
                Dropbox.choose(dropboxOptions);
            }
            var dropboxOptions = {
                success: dropboxsuccess,
                cancel: function() {},
                linkType : DropBoxSettings.linkType,
                multiselect: DropBoxSettings.multiselect
                //extensions : DropBoxSettings.extensions,
            };
            function dropboxsuccess(files){
                scope.$apply(function() {
                     console.log(scope);
                    for (var i = 0; i < files.length; i++){
                        if (scope.dbpickerFiles != undefined) {
                        scope.dbpickerFiles.push(files[i]);
                      } else { scope.$parent.reaction.dpfiles.push(files[i]) }
                    }
                });
            };
            element.bind("click", function() {
                instanciate()
            })
        }
    }
}]);


minorityApp.directive("boxPicker", ["DropBoxSettings",
            function(DropBoxSettings) {
    return {
        restrict: "A",
        scope: {
            boxpickerFiles: "="
        },
        link: function(scope, element, attrs) {
            function instanciate() {
                var success = false;
                var boxSelect = new BoxSelect(boxoptions);
                boxSelect.launchPopup();
                boxSelect.success(function(files) {
                    if(!success){
                        boxSelect.closePopup();
                        scope.$apply(function() {
                            for (var i = 0; i < files.length; i++){
                                scope.boxpickerFiles.push(files[i]);
                        if (scope.boxpickerFiles != undefined) {
                        scope.boxpickerFiles.push(files[i]);
                      } else { scope.$parent.reaction.boxfiles.push(files[i]); }

                            }
                        });
                        //boxSelect.unregister(boxSelect.SUCCESS_EVENT_TYPE, successCallbackFunction);
                        success = true
                    }
                });
                boxSelect.cancel(function() {
                    console.log("The user clicked cancel or closed the popup");
                    boxSelect.closePopup();
                });
            }

            function successCallbackFunction(){
                boxSelect.closePopup();
            }

            var boxoptions = {
                clientId: DropBoxSettings.box_clientId,
                linkType: DropBoxSettings.box_linkType,
                multiselect: DropBoxSettings.box_multiselect
            };
            element.bind("click", function() {
                instanciate()
            })
        }
    }
}]);

minorityApp.config(['DropBoxSettingsProvider', function(DropBoxSettingsProvider) {
      // Configure the options
        DropBoxSettingsProvider.configure({
            linkType: 'preview',//dropbox link type
            multiselect: true,//dropbox multiselect
//            extensions: ['.pdf', '.doc', '.docx'],//dropbox file extensions
            box_clientId: '9nmk1hao8ea3cgpz1opysjtva6zhqd8h',// box CLient Id
            box_linkType: 'shared',//box link type
            box_multiselect: 'true'//box multiselect
          });
}]);
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
                 resolve: { Auth: ['$http', '$q', '$window', '$rootScope', 'NotificationBroadcaster', function($http, $q, $window, $rootScope, NotificationBroadcaster) {
//                    var deffered = $q.defer();
                  var token = $window.sessionStorage.getItem('token');
                  var biz_id = $window.localStorage.getItem('business');
                  $rootScope.notify = NotificationBroadcaster;
                  //if (biz_id == undefined || biz_id == "-1") {
                   $rootScope.whoami = $http.post(jsRoutes.controllers.Application.whoami().absoluteURL(document.ssl_enabled), {
                    headers:  {'X-Auth-Token': token, 'Access_Name': 'user'}}).then(function (profile) {
                        $window.sessionStorage.setItem("business", profile.data.business);
                        $window.localStorage.setItem("business", profile.data.business);
                        $rootScope.business = profile.data.business;
                        $rootScope.manager = profile.data.manager;

                        $rootScope.bb_ping = profile.data.bb_ping;
                        //console.log(profile.data);
                        console.log($rootScope.bb_ping)
                        $window.localStorage.setItem("manager", profile.data.manager);

                        $window.sessionStorage.setItem("employee", profile.data.employee);
                        $window.sessionStorage.setItem("manager", profile.data.manager);
                  })
                  //}

 //                   $rootScope.whoami = $http.post('https://min.ority.us/whoami', {headers:  {'X-Auth-Token': token, 'Access_Name': 'user'}})
  //                    .then(function (profile) {
   //                    console.log("profile " + profile);
     //                  $window.sessionStorage.setItem('manager', profile.manager);
                $rootScope.manager = $window.localStorage.getItem('manager') == "true";
                //$rootScope.business = parseInt($window.sessionStorage.getItem('business'));
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
/*I*/$routeProvider.when('/bprocess/:BPid/elements', {templateUrl: '/assets/partials/bp_elements/elements-list.html', controller: 'BPelementListCtrl', reloadOnSearch: false});
/*C*/$routeProvider.when('/bprocess/:BPid/element/new', {templateUrl: '/assets/partials/bp_elements/bpelem-new.html', controller: 'BPelementCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/element/:id/show', {templateUrl: '/assets/partials/bp_elements/bpelem-detail.html', controller: 'BPelementDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/element/:id/edit', {templateUrl: '/assets/partials/bp_elements/bpelem-edit.html', controller: 'BPelementDetailCtrl'});

    // Stations
/*A*/$routeProvider.when('/launches', {templateUrl: '/assets/partials/launches/launches.html', controller: 'LaunchesCtrl'});
/*I*/$routeProvider.when('/bprocess/:BPid/launches', {templateUrl: '/assets/partials/proc_launches/launch-list.html', controller: 'ProcLaunchesListCtrl'});
/*C*/$routeProvider.when('/bprocess/:BPid/launch/new', {templateUrl: '/assets/partials/proc_launches/launch-new.html', controller: 'ProcLaunchesCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/launch/:id/show', {templateUrl: '/assets/partials/proc_launches/launch-detail.html', controller: 'ProcLaunchesDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/launch/:id/edit', {templateUrl: '/assets/partials/proc_launches/launch-edit.html', controller: 'ProcLaunchesDetailCtrl'});

   // Permissions
/*I*/$routeProvider.when('/bprocess/:BPid/perms', {templateUrl: '/assets/partials/perms/perm-list.html', controller: 'BPPermListCtrl'});
/*C*/$routeProvider.when('/bprocess/:BPid/perm/new', {templateUrl: '/assets/partials/perms/perm-new.html', controller: 'BPPermCreationCtrl'});
/*R*/$routeProvider.when('/bprocess/:BPid/perm/:id/show', {templateUrl: '/assets/partials/perms/perm-detail.html', controller: 'BPPermDetailCtrl'});
/*U*/$routeProvider.when('/bprocess/:BPid/perm/:id/edit', {templateUrl: '/assets/partials/perms/perm-edit.html', controller: 'BPPermDetailCtrl'});
     // Inputs
/*C*/$routeProvider.when('/bprocess/:BPid/input', {templateUrl: '/assets/partials/inputs/inputs.html', controller: 'BPRequestCtrl'});
     // Reflections
/*I*/$routeProvider.when('/ref', {templateUrl: '/assets/partials/reflections/ref-list.html', reloadOnSearch: false, controller: 'ReflectionCtrl'});
/*C*/$routeProvider.when('/ref/new', {templateUrl: '/assets/partials/reflections/ref-list.html', controller: 'ReflectionCtrl'});

/*I*/$routeProvider.when('/playground', {
 templateUrl: '/assets/partials/motivation.html',
 controller: 'PlaygroundController',
 resolve: { Auth: ['$http', '$q', '$window', '$rootScope', 'NotificationBroadcaster', function($http, $q, $window, $rootScope, NotificationBroadcaster) {

    }]
  }
});

     $routeProvider.otherwise({redirectTo: '/bprocesses'});



}]).run(['$q','$window','$http' ,'$rootScope', '$injector', function($q, $window, $http, $rootScope,$injector) {
    var token = $window.sessionStorage.getItem('token');

    $rootScope.type_short = {
      "container_brick":"CN",
      "confirm":"CF",
      "positive":"PH",
      "placeholder":"PH",
      "delay": "DE" 
    }; // Letters for element types
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

return minorityApp;
});



/* Filters

angular.module('myApp.filters', []).
  filter('interpolate', ['version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    }
  }]);
*/
