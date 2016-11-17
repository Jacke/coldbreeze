// `main.js` is the file that sbt-web will use as an entry point
(function (requirejs) {
  'use strict';

  // -- RequireJS config --
  requirejs.config({
    // Packages = top-level folders; loads a contained file named 'main.js"
    // baseUrl: '/assets/javascripts',
    waitSeconds: 400,
    packages: ['common'],//, 'home', 'user', 'dashboard'],

 config: {
    jsx: {
 transformer: "babel",
    babelOptions: {
      sourceMaps: 'inline'
    }
    }
  },
    jsx: {
 transformer: "babel",
    babelOptions: {
      sourceMaps: 'inline'
    }
    },

    shim: {
      'jsRoutes': {
        deps: [],
        // it's not a RequireJS module, so we have to tell it what var is returned
        exports: 'jsRoutes'
      },
      // Hopefully this all will not be necessary but can be fetched from WebJars in the future
      'angular': {
        deps: ['jquery'],
        exports: 'angular'
      },
      'mobileDetect': {
        exports: 'mobileDetect'
      },
      'selectize': {
        deps: ['jquery'],
        exports: 'selectize'
      },
      'popupoverlay': {
        deps: ['jquery'],
        exports: 'popupoverlay'
      },
     'angularAMD': ['angular'],

      'angular-route': {
       deps: ['angular'],
       exports: 'angular-route'
      },

      'angularanimate': {
       deps: ['angular'],
       exports: 'angularanimate'
      },

      'angular-websocket': {
       deps: ['angular'],
       exports: 'angular-websocket'
      },


      'toastr': {
       deps: ['angular'],
       exports: 'toastr'
      },
      'angularToasty': {
       deps: ['angular'],
       exports: 'angularToasty'
      },
      'angularAudio': {
       deps: ['angular'],
       exports: 'angularAudio'
      },
//
//      'toastr-tpl': {
//      deps: ['angular'],
//      exports: 'toastr-tpl'
//      },

      'angular-pageslide-directive': {
       deps: ['angular'],
       exports: 'angular-pageslide-directive'
      },

      'jcs-auto-validate': {
       deps: ['angular'],
       exports: 'jcs-auto-validate'
      },

      'angular-classy': {
       deps: ['angular'],
       exports: 'angular-classy'
      },

      'angular-resource': {
       deps: ['angular'],
       exports: 'angular-resource'
      },

      'angular-cookies': {
       deps: ['angular'],
       exports: 'angular-cookies'
      },

      'select': {
       deps: ['angular'],
       exports: 'select'
      },

      'pnotify': {
       deps: ['angular'],
       exports: 'pnotify'
      },

      'pnotifyconfirm': {
        deps: ['pnotify','jquery'],
        exports: 'pnotifyconfirm'
      },
      'pnotifybuttons': {
        deps: ['pnotify', 'jquery'],
        exports: 'pnotifybuttons'
      },
      'angularpnotify': {
        deps: ['angular','pnotify','jquery'],
        exports: 'angularpnotify'
      },
      'moment': {
       deps: ['jquery'],
       exports: 'moment'
      },
      'angular-moment': {
       deps: ['moment', 'angular'],
       exports: 'angular-moment'
      },
      'livestamp': {
       deps: ['moment'],
       exports: 'livestamp',
      },
      'ngDialog': {
       deps: ['angular'],
       exports: 'ngDialog'
      },
      'roundProgress': {
        deps: ['angular'],
        exports: 'roundProgress'
      },
      'angular-ui-tree': {
       deps: ['angular'],
       exports: 'angular-ui-tree'
      },
      'angular-underscore': {
       deps: ['angular'],
       exports: 'angular-underscore'
      },
      'loading-bar': {
       deps: ['angular'],
       exports: 'loading-bar'
      },
      'ng-slide-down': {
       deps: ['angular'],
       exports: 'ng-slide-down'
      },
      'ui-bootstrap': {
       deps: ['angular'],
       exports: 'ui-bootstrap'
      },
      'ui-bootstrap-tpls': {
       deps: ['angular', 'ui-bootstrap'],
       exports: 'ui-bootstrap-tpls'
      },
      'toaster': {
       deps: ['angular'],
       exports: 'toaster'
      },
      'angularLocalStorage': {
       deps: ['angular'],
       exports: 'angularLocalStorage'
      },
      'angular-awesome-error': {
       deps: ['angular'],
       exports: 'angular-awesome-error'
      },
      'angular-translate': {
       deps: ['angular'],
       exports: ''
      },
      'daterangepicker': {
       deps: ['angular'],
       exports: 'daterangepicker'
      },

      'angular-daterangepicker': {
       deps: ['angular', 'daterangepicker'],
       exports: 'angular-daterangepicker'
      },


"react": {
      "exports": "React"
    },
"react-modal":{
   deps: ['react'],
   exports: 'reactModal'
},
//"JSXTransformer": "JSXTransformer",

"ease": {
  deps: [],
  exports: 'ease'
},
"segment": {
  deps: [],
  exports: 'segment'
},

'app': {
  deps: ['angular', 'toastr', 'toaster', 'roundProgress'],
  export: 'app'
},

//'lkgooglepicker': {
//  deps: ['angular', 'app'],
//  export: 'lkgooglepicker'
//},
'filters': {
  deps: ['angular', 'app'],
  export: 'filters'
},
'services': {
  deps: ['angular', 'app'],
  export: 'services'
},
'launches': {
  deps: ['angular', 'app'],
  export: 'launches'
},
'fastResourceCostCreation': {
  deps: ['angular', 'app'],
  export: 'fastResourceCostCreation'
},

//'popupService': {
//  deps: ['angular', 'app', 'services'],
//  export: 'services'
//},
'treebuilder': {
  deps: ['angular', 'app'],
  export: 'treebuilder'
},
'controllers': {
  deps: ['angular', 'app', 'toastr', 'toaster'],
  export: 'controllers'
},

'actionController': {
  deps: ['angular', 'app', 'controllers'],
export: 'actionController'
},
'launchDataController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'launchDataController'
},
'procPermController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'procPermController'
},
'procController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'procController'
},
'procDetailController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'procDetailController'
},
'procCreateController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'procCreateController'
},
'requestController': {
  deps: ['angular', 'app', 'controllers', 'toaster'],
  export: 'requestController'
},
'loggerController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'loggerController'
},
'stationController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'stationController'
},
'ngsanitize': {
    deps: ['angular', 'app'],
  export: 'ngsanitize'
},
'restangular': {
  deps: ['angular', 'app'],
  export: 'restangular'
},
'actionFormGenerator': {
  deps: ['angular', 'app'],
  export: 'actionFormGenerator'
},
'actionFormDesctructor': {
  deps: ['angular', 'app'],
  export: 'actionFormDesctructor'
},

'hljs': {
  deps: ['angular', 'app'],
  export: 'hljs'
},
'hljsangular': {
  deps: ['angular', 'app', 'hljs'],
  export: 'hljsangular'
},

'angularDragAndDropLists': {
  deps: ['angular', 'app'],
  export: 'angularDragAndDropLists'
},

'cgNotify': {
  deps: ['angular', 'app'],
  export: 'cgNotify'
},
'ngFileUploadShim': {
  deps: ['angular', 'app'],
  export: 'ngFileUploadShim'
},
'ngFileUpload': {
  deps: ['angular', 'app'],
  export: 'ngFileUpload'

},
'angular-tooltips': {
    deps: ['angular', 'app'],
  export: 'angular-tooltips'
},
'angular-hovercard': {
  deps: ['angular', 'app'],
  export: 'angular-hovercard'
},
'ui-select': {
  deps: ['angular', 'app'],
  export: 'ui-select'
},
'apiCheck': {
  deps: ['angular', 'app'],
  export: 'apiCheck'
},
'angular-formly': {
  deps: ['angular', 'app'],
  export: 'angular-formly'
},
'angular-cache': {
  deps: ['angular', 'app'],
  export: 'angular-cache'
},
'angularformlybootstrap': {
  deps: ['angular', 'app'],
  export: 'angularformlybootstrap'
},

'procElementController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'procElementController'
},
'launchedProcElementController':{
  deps: ['angular','app', 'controllers'],
  export: 'launchedProcElementController'
},
'reflectionController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'reflectionController'
},
'launchesController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'launchesController'
},
'directives': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'directives'
},

'classie': {
  deps: ['angular'],
  export: 'classie'
},
'cssParser': {
  deps: ['angular'],
  export: 'cssParser'
},
'dropdown': {
  deps: ['jquery'],
  export: 'dropdown'
},
'drag-on': {
  deps: ['jquery'],
  export: 'drag-on'
},
'tooltip': {
    deps: ['jquery'],
  export: 'dropdown'
},
'tether': { deps: [], export: 'tether' },
'shepherd': { deps: ['tether'], export: 'shepherd' },
'notie': {deps: [], export: 'notie'},


      //'bootstrap': ['jquery']
    },
    paths: {
     'requirejs': '../lib/requirejs/require',
     'angularAMD': '../javascripts/angularAMD',
     'ease': '../javascripts/ease',
     'segment': '../javascripts/segment',

     'jsRoutes': '/jsroutes',
     'jquery':  '../javascripts/jquery-2.1.3.min',
     'popupoverlay': '../js/jquery.popupoverlay',
     'drag-on':  '../js/drag-on',
     'jquery.nicescroll':  '../bower_components/jquery.nicescroll/jquery.nicescroll',
     'ssl':  '../javascripts/ssl',
     'header':  '../javascripts/header',
     'tooltip':  '../bower_components/bootstrap/js/tooltip',
     'dropdown':  '../bower_components/bootstrap/js/dropdown',
     'underscore':  '../bower_components/underscore/underscore',
     'moment':  '../bower_components/moment/moment',

  es6: "../bower_components/requirejs-babel/es6",
  babel: "../bower_components/requirejs-babel/babel-5.8.34.min",

     'selectize':  '../js/selectize',
     'mobileDetect': '../js/mobile-detect',

      //'jquery': '../lib/jquery/jquery',
      //'angular': '../lib/angularjs/angular',
      //'angular-route': '../lib/angularjs/angular-route',
      //'angular-cookies': '../lib/angularjs/angular-cookies',
      //'bootstrap': '../lib/bootstrap/js/bootstrap',
  'angularanimate': '../bower_components/angular-animate/angular-animate',
  'angular': '../bower_components/angular/angular',
  'react': '../bower_components/react/react-with-addons',
  'react-dom': '../bower_components/react/react-dom',
  'react-modal': '../bower_components/react-modal/dist/react-modal',

  'angular-websocket': '../bower_components/angular-websocket/angular-websocket',
  'toastr': '../bower_components/angular-toastr/toastr',
  'angularToasty': '../bower_components/angular-toasty/dist/angular-toasty',
  'angularAudio': '../bower_components/angular-audio/app/angular.audio',
  //'toastr-tpl': '../bower_components/angular-toastr/toastr.tpl',
  'angular-pageslide-directive': '../bower_components/angular-pageslide-directive/src/angular-pageslide-directive',
  'jcs-auto-validate': '../bower_components/angular-auto-validate/dist/jcs-auto-validate.min',
  'angular-classy': '../bower_components/angular-classy/angular-classy.min',
  'angular-resource': '../bower_components/angular-resource/angular-resource',
  'angular-cookies': '../bower_components/angular-cookies/angular-cookies',
  'select': '../bower_components/angular-ui-select/dist/select',

'apiCheck': '../bower_components/api-check/dist/api-check',
'angular-formly': '../bower_components/angular-formly/dist/formly',
'angularformlybootstrap': '../bower_components/angular-formly-templates-bootstrap/dist/angular-formly-templates-bootstrap',

  'pnotify': '../bower_components/pnotify/pnotify.core',
  'ngFileUploadShim': '../bower_components/ng-file-upload/ng-file-upload-shim',

  'ngFileUpload': '../bower_components/ng-file-upload/ng-file-upload-all',

  'pnotifyconfirm':'../bower_components/pnotify/pnotify.confirm',
  'pnotifybuttons':'../bower_components/pnotify/pnotify.buttons',
  'angularpnotify':'../bower_components/angular-pnotify/src/angular-pnotify',
'restangular':'../bower_components/restangular/dist/restangular',
'actionFormGenerator': '../js/services/actionFormGenerator',
'actionFormDesctructor':'../js/services/actionFormDesctructor',

'hljsangular':'../bower_components/angular-highlightjs/build/angular-highlightjs',
'hljs':'../javascripts/highlightjs',
'angularDragAndDropLists':'../bower_components/angular-drag-and-drop-lists/angular-drag-and-drop-lists',
'cgNotify': '../bower_components/angular-notify/dist/angular-notify',
'angular-cache':'../bower_components/angular-cache/dist/angular-cache',
'angular-hovercard':'../bower_components/angular-hovercard/dist/angular-hovercard',
'angular-tooltips':'../bower_components/angular-tooltips/dist/angular-tooltips.min',
'ui-select': '../bower_components/ui-select/src/select3',
'notie': '../bower_components/notie/notie',

  'roundProgress': '../bower_components/angular-svg-round-progressbar/src/roundProgress',
  'angular-moment': '../bower_components/angular-moment/angular-moment',
  'livestamp': '../bower_components/livestamp/livestamp',
  'ngDialog': '../bower_components/ngDialog/js/ngDialog',
  'angular-ui-tree': '../bower_components/angular-ui-tree/dist/angular-ui-tree',
  'angular-underscore': '../bower_components/angularjs-toaster/angularunderscore',
  'loading-bar': '../bower_components/angular-loading-bar/src/loading-bar',
  'ng-slide-down': '../bower_components/ng-slide-down/dist/ng-slide-down',
  'ui-bootstrap': '../bower_components/angular-bootstrap/ui-bootstrap',
  'ui-bootstrap-tpls': '../bower_components/angular-bootstrap/ui-bootstrap-tpls',
  'toaster': '../bower_components/angularjs-toaster/toaster',
  'angularLocalStorage': '../bower_components/angularLocalStorage/src/angularLocalStorage',
  'angular-awesome-error': '../bower_components/angular-errors-directive/angular-awesome-error',
  'angular-translate': '../js/angular-translate',
  'daterangepicker': '../bower_components/bootstrap-daterangepicker/daterangepicker',
  'angular-daterangepicker': '../bower_components/angular-daterangepicker/js/angular-daterangepicker',

//  'filepicker': '../bower_components/filepicker-js/dist/filepicker',
//  'angularfilepicker': '../bower_components/angular-filepicker/dist/angular_filepicker',
  'lkgooglepicker': '../bower_components/angular-google-picker/dist/google-picker',

//"JSXTransformer": "../bower_components/react/JSXTransformer",
    "jsx": "../bower_components/requirejs-react-jsx/jsx",
    "text": "../bower_components/requirejs-text/text",

  'app': '../js/app',

  'reactapp': '../js/reactapp',
  'filters': '../js/filters',
  'services': '../js/services',
  'launches': '../js/services/launches',
  'fastResourceCostCreation': '../js/services/fastResourceCostCreation',
 // 'popupService': '../js/popupService',
  'treebuilder': '../js/treebuilder',
  'controllers': '../js/controllers/controllers',
  'actionController':'../js/controllers/actions/actionController',
  'launchDataController':'../js/controllers/data/launchDataController',
  'procPermController': '../js/controllers/procPermController',
  'procController': '../js/controllers/procController',
  'historyController': '../js/controllers/historyController',
  'procCreateController': '../js/controllers/processes/procCreateController',
  'procDetailController': '../js/controllers/processes/procDetailController',
  'requestController': '../js/controllers/requestController',
  'loggerController': '../js/controllers/loggerController',
  'stationController': '../js/controllers/stationController',
  'procElementController': '../js/controllers/procElementController',
  'launchedProcElementController': '../js/controllers/launchedProcElementController',


  'reflectionController': '../js/controllers/reflectionController',
  'launchesController': '../js/controllers/launchesController',
  'directives': '../js/directives',
  'classie': '../js/classie',
  'cssParser': '../js/cssParser',
  'tether': '../bower_components/tether/dist/js/tether',
  'shepherd': '../bower_components/tether-shepherd/dist/js/shepherd',
  'tour': '../javascripts/tour',
  }});

  requirejs.onError = function (err) {
    throw err;//console.log(err);
  };


  // Load the app. This is kept minimal so it doesn't need much updating.
require(['requirejs','jsRoutes','jquery','pnofiy','ease','segment', 'mobileDetect','popupoverlay','drag-on','ngFileUploadShim','jquery.nicescroll','ssl','header','tooltip','dropdown','underscore','moment','selectize', 'tether', 'shepherd','tour','notie',
  ],//'jquery', 'bootstrap'],//, './app'],
    function (requirejs,jsRoutes,$, pnofiy,ease,segment, mobileDetect, popupoverlay,dragOn,ngFileUploadShim,niceScroll,ssl,header,tooltip,dropdown,underscore,moment,selectize,tether,shepherd,tour,notie) {
        document.tour = tour;

      $(document).ready(function(){

//if (document.getElementById('menu-icon-trigger') != undefined) {
document.coolButtons = function(elmm) {
  var elm = elmm[0];
  /* In animations (to close icon) */

  var beginAC = 80,
      endAC = 320,
      beginB = 80,
      endB = 320;

  function inAC(s) {
      s.draw('80% - 240', '80%', 0.3, {
          delay: 0.1,
          callback: function() {
              inAC2(s)
          }
      });
  }

  function inAC2(s) {
      s.draw('100% - 545', '100% - 305', 0.6, {
          easing: ease.ease('elastic-out', 1, 0.3)
      });
  }

  function inB(s) {
      s.draw(beginB - 60, endB + 60, 0.1, {
          callback: function() {
              inB2(s)
          }
      });
  }

  function inB2(s) {
      s.draw(beginB + 120, endB - 120, 0.3, {
          easing: ease.ease('bounce-out', 1, 0.3)
      });
  }

  /* Out animations (to burger icon) */

  function outAC(s) {
      s.draw('90% - 240', '90%', 0.1, {
          easing: ease.ease('elastic-in', 1, 0.3),
          callback: function() {
              outAC2(s)
          }
      });
  }

  function outAC2(s) {
      s.draw('20% - 240', '20%', 0.3, {
          callback: function() {
              outAC3(s)
          }
      });
  }

  function outAC3(s) {
      s.draw(beginAC, endAC, 0.7, {
          easing: ease.ease('elastic-out', 1, 0.3)
      });
  }

  function outB(s) {
      s.draw(beginB, endB, 0.7, {
          delay: 0.1,
          easing: ease.ease('elastic-out', 2, 0.4)
      });
  }

  /* Awesome burger default

  var pathA = document.getElementById('pathA'),
    pathB = document.getElementById('pathB'),
    pathC = document.getElementById('pathC'),
    segmentA = new Segment(pathA, beginAC, endAC),
    segmentB = new Segment(pathB, beginB, endB),
    segmentC = new Segment(pathC, beginAC, endAC),
    trigger = document.getElementById('menu-icon-trigger'),
    toCloseIcon = true,
    dummy = document.getElementById('dummy'),
    wrapper = document.getElementById('menu-icon-wrapper');

  wrapper.style.visibility = 'visible';

  trigger.onclick = function() {
    if (toCloseIcon) {
      inAC(segmentA);
      inB(segmentB);
      inAC(segmentC);

      dummy.className = 'dummy dummy--active';
    } else {
      outAC(segmentA);
      outB(segmentB);
      outAC(segmentC);

      dummy.className = 'dummy';
    }
    toCloseIcon = !toCloseIcon;
  };
 */


  function addScale(m) {
    m.className = 'menu-icon-wrapper scaled';
  }

  function removeScale(m) {
    m.className = 'menu-icon-wrapper';
  }

  /* Awesome burger scaled */


    var pathD =  elm.querySelector('#pathD'),
      pathE =  elm.querySelector('#pathE'),
      pathF =  elm.querySelector('#pathF'),
      segmentD = new Segment(pathD, beginAC, endAC),
      segmentE = new Segment(pathE, beginB, endB),
      segmentF = new Segment(pathF, beginAC, endAC),
      wrapper2 =  elm.querySelector('#menu-icon-wrapper2'),
      trigger2 = elm.querySelector('#menu-icon-trigger2'),
      toCloseIcon2 = true,
      dummy2 =  elm.querySelector('#dummy2');

    wrapper2.style.visibility = 'visible';
    console.log('trigger', trigger2);
    trigger2.onclick = function() {
      addScale(wrapper2);
      if (toCloseIcon2) {
        inAC(segmentD);
        inB(segmentE);
        inAC(segmentF);

        //dummy2.className = 'dummy dummy--active';
      } else {
        outAC(segmentD);
        outB(segmentE);
        outAC(segmentF);

        //dummy2.className = 'dummy';
      }
      toCloseIcon2 = !toCloseIcon2;
      setTimeout(function() {
        removeScale(wrapper2)
      }, 450);

  }
}
//();
//}


        document.mobileDetect = new mobileDetect(window.navigator.userAgent);
        document.isMobile = (document.mobileDetect.phone() != null) ? true : false;
        $('[data-toggle="tooltip"]').tooltip();


        // Tours
        var dashBoardTour = function() {
          if (location.pathname == "/") {
            document.tour.dashboardTour.start()
          }
        }
        if (localStorage.dashBoardTour == undefined) {
          localStorage.setItem("dashBoardTour", true);
          dashBoardTour();
          localStorage.setItem("dashBoardTour", false);
        } else {
          if (localStorage.dashBoardTour == "true") {
            dashBoardTour();
            localStorage.setItem("dashBoardTour", false);
          }
        }


        if (document.isMobile) {
          $('.overlay_mobile').toggleClass('visible_overlay');
          $('#container').hide();
          $('.overlay_mobile a').on('click', function(event) {
                $('.overlay_mobile').toggleClass('visible_overlay');
                $('#container').show();

          });
        }

        $("html").niceScroll({styler:"fb",cursorcolor:"#000", cursorwidth:"10px", scrollspeed: 100});

        var now = moment();
        $('time').each(function(i, e) {
            var time = moment($(e).attr('datetime'));

            if(now.diff(time, 'days') != 1) {
                $(e).text('Started ' + time.from(now));
            }
        });
        $(function () {
            $('#dashTab a:last').tab('show');
        })
        $('.date-span').each(function(i, e) {
            var time = moment($(e).data('date')).format('MMMM Do YYYY, h:mm:ss a');
            $(e).text(time);
        });
$('a.bill-field.bill-pay-btn').click(function(e) {
e.preventDefault();
$(this).parent().children('.bill-form').toggle();
$(this).toggleClass('highlighted');
});

$('a.appLink').click(function(e) {
  e.preventDefault();
  if (location.hash.split('#').length > 1) {
        window.location.href = "a#/bprocesses";
  } else {
            window.location.href = "/a";

  }
})

$('.settings-insert-title').click(function(e) {
  $(this).parent().children('.settings-insert').toggle();
  $(this).toggleClass('highlighted');
})

// Utils for fast process run on dashboard
if ($('.process__list .process_title').length > 0) {
  $('.process__list .process_run_button.process_run_inline').on('click', function(ev){
    ev.preventDefault;
    $(this).addClass('loading');
    var data = $( this ).data();
    
    console.log($( this ).data())
  });
}




// Utils for fast input on dashboard
if ($('.dashboard_sessions').length > 0) {
  $('.instant-input button').on('click', function(ev){
    ev.preventDefault;
    $(this).parent().addClass('loading');
    var data = $( this ).data();
    jsRoutes.controllers.ProcessInputController.invokeFrom(data.sessionId, data.processId).ajax({
      dataType: 'json',contentType: 'application/json',data: JSON.stringify( [{ "reaction_id": data.reactionId }] )
    }).done(function() {
        console.log( "success" );
        var el = $($($(this)).parent()[0]).children('.instant-input-file-list');
        if (el.length > 0) {
          var data = $.map(el.children(), function(el) {return { obj_type: "type", obj_content: el.getAttribute('href'), obj_title: el.textContent } });
          console.log(data);

       if (data != undefined && data.length > 0) {
         jQuery.ajax({
          url: '/warp?launch_id=' + launch_id,
          method: "POST",
          data: { payload: payload },
          }).done(function(response) {
           jQuery.ajax({
            url: '/warp/send',
            method: "POST",
            data: response.data.message,
            }).done(function(response) {
              console.log(response)
            });

          });
       };
}

        window.location.reload();//.href = "a#/launches";
      })
      .fail(function() {
        $(this).parent().remove('loading');
        $(this).parent().text('Error');
        console.log( "error" );
      })
    console.log($( this ).data())
  });
}








});
$('.showServiceForm span.moicon.moicon-plus').first().click(function(event) {
  event.preventDefault();
  $('.serviceForm').toggle();
});

// Settings
//
$('#select-country').selectize();
$('#sideTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});

//
// Peoples
//
$('.manageWholeTeam').toggleClass('upmenu');

 $('.teamCreationForm button').on('click', function(event) {
    event.preventDefault();
    jsRoutes.controllers.GroupController.create_new().ajax({data: JSON.stringify({title: $('.teamCreationForm input').val(), business: -1}), dataType: "json", contentType: 'application/json',
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            }}).done(function( data ) { console.log(data);
              location.reload();
            })
});
$('a.delete-group').on('click', function (event) {
  event.preventDefault();
  var id = $(this).attr('class').split(' ')[1].split('-')[1];

  jsRoutes.controllers.GroupController.destroy(id).ajax().done(function( data ) { console.log(data);
              location.reload();
            });
});

//$('#addMembersForm').slideToggle();
var map = Array.prototype.map;

$('#addMembersForm button.posRight').on('click', function(event) {

event.preventDefault();
  var emails = _.map(document.querySelectorAll('.inputEmployee input#newUsersForGroup'), function( l ){ return l.value }).filter(function(o){return o != "" })
if (emails.length > 0) {

/*
jsRoutes.controllers.users.EmployeeController.create_new().ajax({
        data: JSON.stringify({emails: emails, manager: admin}), dataType: "json", contentType: 'application/json',
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            }}).done(function( data ) { console.log(data);
            location.reload();
            $('#addMembersForm').slideToggle();
//$('.form-horizontal')[0].submit();
}).fail(function( jqXHR, textStatus) {
    //$('.loginFlowPage').prepend('<div class="messageBoxWrap"><p class="message">'+ JSON.parse(jqXHR.responseText).error +'</p></div>');
  });
*/
//var map = Array.prototype.map;
// map.call(document.querySelectorAll('.inputEmployee input#newUsersForGroup'), function( l ){ return l.value })

var data = $('.inputEmployee').map(function(c){return [$(this).find('.flatInput').val(), $(this).find('.flatCheckbox input').is(':checked') ] })
var n = 2;
var lists = _.groupBy(data, function(element, index){
  return Math.floor(index/n);
});
lists = _.filter(_.toArray(lists), function(arr){ return arr[0] != "" });
var admin = _.map(_.filter(lists, function(arr) { return arr[1] == true }), function(a){return a[0] });
var employee = _.map(_.filter(lists, function(arr) { return arr[1] == false }), function(a){return a[0]});

console.log("admin");
console.log(admin);
console.log("employee");
console.log(employee);

/**
 * Submiting
 */
var admin_status = false;
if (admin.length > 0) {
jsRoutes.controllers.users.EmployeeController.create_new().ajax({
        data: JSON.stringify({emails: admin, manager: true}), dataType: "json", contentType: 'application/json',
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            }}).done(function( data ) { console.log(data);
            reload("admin");
            $('#addMembersForm').slideToggle();
//$('.form-horizontal')[0].submit();
}).fail(function( jqXHR, textStatus) {
    //$('.loginFlowPage').prepend('<div class="messageBoxWrap"><p class="message">'+ JSON.parse(jqXHR.responseText).error +'</p></div>');
  });
} else { admin_status = true; }
if (employee.length > 0) {
jsRoutes.controllers.users.EmployeeController.create_new().ajax({
        data: JSON.stringify({emails: employee, manager: false}), dataType: "json", contentType: 'application/json',
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            }}).done(function( data ) { console.log(data);
            reload("employee");
            $('#addMembersForm').slideToggle();
//$('.form-horizontal')[0].submit();
}).fail(function( jqXHR, textStatus) {
    //$('.loginFlowPage').prepend('<div class="messageBoxWrap"><p class="message">'+ JSON.parse(jqXHR.responseText).error +'</p></div>');
  });
}

var reload = function(obj) {
  if (obj == "admin" && employee.length == 0) {
    location.reload();
  }
  if (obj == "employee" && admin.length == 0) {
    location.reload();
  }
  if (obj == "employee" && admin.length > 0) {
    location.reload();
  }
}

}
});
$('#addMembersForm .cancelButton').on('click', function(event) {
    event.preventDefault();
    $('#addMembersForm').slideToggle();
});
$('.addMembersLink').on('click', function(event) {
    event.preventDefault();
    $('#addMembersForm').slideToggle();
});
$('.dropdown-toggle').dropdown();

$(document).ready(function(){
$(".filterInput.tableMinListFilterInput").keyup(function(){

    // Retrieve the input field text and reset the count to zero
    var filter = $(this).val(), count = 0;
    if(!filter){
        $( "li.userCard" ).hide();
        return;
    }
    var regex = new RegExp(filter, "i");
    // Loop through the user list
    $( "li.userCard" ).each(function(){

        // If the list item does not contain the text phrase fade it out
        if ($( ".block", this ).text().search(regex) < 0) {
            $(this).hide();

        // Show the list item if the phrase matches and increase the count by 1
        } else {
            $(this).show();
            count++;
        }
    });
    // Update the count
    //var numberItems = count;
    //$("#filter-count").text("Number of Comments = "+count);
});
});
//
// Teams
//

//$('#addMembersForm').slideToggle();

$('#addMembersForm button.updateGroup').on('click', function(event) {

event.preventDefault();
var names_assign = [];
var names_unassign = [];
var promises = [];
$('input.assignCheckbox:checked').each(function(thos) { names_assign.push($(this).attr('name')) });
$('input.unassignCheckbox:checked').each(function(thos) { names_unassign.push($(this).attr('name')) });

var uid = "";
var group_id = location.pathname.split("/peoples/")[1];

_.forEach(names_assign, function(uid) {
var promise = jsRoutes.controllers.GroupController.assign_user(uid, group_id).ajax().done(function( data ) { console.log(data);

    })
promises.push(promise);
promise.fail(function( jqXHR, textStatus) {
        //$('.loginFlowPage').prepend('<div class="messageBoxWrap"><p class="message">'+ JSON.parse(jqXHR.responseText).error +'</p></div>');
      });
});
_.forEach(names_unassign, function(uid) {
var promise = jsRoutes.controllers.GroupController.unassign_user(uid, group_id).ajax().done(function( data ) { console.log(data);
    })
    promises.push(promise);
    promise.fail(function( jqXHR, textStatus) {
        //$('.loginFlowPage').prepend('<div class="messageBoxWrap"><p class="message">'+ JSON.parse(jqXHR.responseText).error +'</p></div>');
      });
});

$('#addMembersForm').slideToggle();
$.when.apply($, promises).done(function () {
        location.reload();
});

});
/*
$('#addMembersForm .cancelButton').on('click', function(event) {
event.preventDefault();
$('#addMembersForm').slideToggle();
});
$('.addMembersForm').on('click', function(event) {
event.preventDefault();
$('#addMembersForm').slideToggle();
})
$('.addMembersLink').on('click', function(event) {
event.preventDefault();
$('#addMembersForm').slideToggle();
})
$('.dropdown-toggle').dropdown()
*/


$(document).ready(function(){
$(".filterInput.tableMinListFilterInput").keyup(function(){

    // Retrieve the input field text and reset the count to zero
    var filter = $(this).val(), count = 0;
    if(!filter){
        $( "li.userCard" ).hide();
        return;
    }
    var regex = new RegExp(filter, "i");
    // Loop through the user list
    $( "li.userCard" ).each(function(){

        // If the list item does not contain the text phrase fade it out
        if ($( ".block", this ).text().search(regex) < 0) {
            $(this).hide();

        // Show the list item if the phrase matches and increase the count by 1
        } else {
            $(this).show();
            count++;
        }
    });
    // Update the count
    //var numberItems = count;
    //$("#filter-count").text("Number of Comments = "+count);
});
});


//
//
// Pro layout
//
//
if ($('.pro-layout').length > 0) {
$('.pro-submit').on('click', function(event) {
  //POST /pro/subscribe
  event.preventDefault();
  console.log(event);

  jsRoutes.controllers.Application.subscribePro().ajax({data: JSON.stringify({}),dataType: "json", contentType: "application/json"}).done(function(data) {
      console.log(data);
      document.location.pathname = "/pro";
});

});


$('.ea-submit').on('click', function(event) {
  console.log(event);
  event.preventDefault();
  jsRoutes.controllers.Application.subscribeEa().ajax({data: JSON.stringify({}),dataType: "json", contentType: "application/json"}).done(function(data) {
      console.log(data);
      document.location.pathname = "/pro";
  });

});

}


///// settings
var url = document.location.toString();
if (url.match('#')) {
    $('.nav a[href="#' + url.split('#')[1] + '"]').tab('show');
}

// Change hash for page-reload
$('.nav a').on('shown.bs.tab', function (e) {
    window.location.hash = e.target.hash;
})





//
// Databoard
//



$('.showEditEntityForm').on('click', function(ev){
  ev.preventDefault;
  var id = $(this).attr('id').split('showEditEntityForm-')[1];
  $(this).toggleClass('plugedin');
  $('form#entity-'+id).toggle()
});

$('button.add-entity-toggle').on('click', function(ev){
  ev.preventDefault;
  $(this).toggleClass('plugedin');
  $(this).parent().parent().find('form').toggle();
});



        var scntDiv = $('#p_scents');
        if (scntDiv != undefined) {
        var i = $('div.meta_fields').size() + 1;
        var name = $('#addScnt').data('name');

        $('#addScnt').on('click', function() {
                $('<div class="meta_fields"><label for="p_scnts"><input type="text" id="p_scnt" size="20" name="'+name + '[' + i +'].key" value="" placeholder="Key" /></label><input type="text" id="p_scnt" size="20" name="'+name + '[' + i +'].value" value="" placeholder="Value" /></label><a href="#" id="remScnt">Remove</a></div>').appendTo(scntDiv);
                i++;
                return false;
        });

        $('#remScnt').on('click', function() {
                if( i > 2 ) {
                        $(this).parents('p').remove();
                        i--;
                }
                return false;
        });
        $('.removeMeta').on('click', function(ev) {
            ev.preventDefault;
                if( i > 2 ) {
                        $(this).parents('div.meta_fields').remove();
                        i--;
                }
                return false;
        });

        //        $('#addScnt').data('name')
        }
// Databoard
//
// case class ResourceAttributeContainer(resource: ResourceDTO, attribute: Entity)
/*
Entity
  title: String,
  boardId: UUID,
  description: String,
  publisher: String,
  etype: String,
  default: String = "",
ResourceDTO
  title
  business
*/
if ($('#createResourceBtn').length > 0) {

$('#resourceTitle').change(function() {
  if ($( this ).val() != "") {
  $(".resources-list button#createResourceBtn").removeClass('offed');
} else {
  $(".resources-list button#createResourceBtn").addClass('offed');
}
});
$('.newResourceForm').on('input', function() {
  if ($( this ).val() != "") {
  $(".resources-list button#createResourceBtn").addClass('offed');
} else {   $(".resources-list button#createResourceBtn").removeClass('offed');
}
});


$(".tableMinListFilter.search-process-input.add-resource-field.filterLayer #resourceTitle").focusin(function() {
  $( "#newResourceEntityForm" ).slideDown();
});
$(".tableMinListFilter.search-process-input.add-resource-field.filterLayer #resourceTitle").focusout(function() {
  if ($('#resourceTitle').val() != "") {

  } else {
    $( "#newResourceEntityForm" ).hide();
  }
});


  $('#createResourceBtn1').click(function(ev){
    ev.preventDefault();
    $('#createResourceBtn').hide();
    var resource = { title: $('#resourceTitle').val(), business: 0 };


    var attribute = {
      title: $('#newInlineAttrTitleField').val(),
      boardId: 'ce6ffac0-df91-4ec6-a1dd-3fa7f7833589', // Random UUID, doesnt make sense, will regenerated
      description: $('#newInlineAttrDescField').val(),
      publisher: '',
      meta: [],
      etype: $('#newInlineAttrEtypeField').val(),
      default: $('#newInlineAttrDefaultField').val(),
    };

    jsRoutes.controllers.DataController.api_create_resource().ajax({
      dataType: 'json',contentType: 'application/json', data: JSON.stringify( { "resource": resource,
        "attribute": attribute } )
    }).done(function() {
        document.location.reload();
        console.log( "success" );
      })
      .fail(function() {
        document.location.reload();
        console.log( "error" );
      })
    console.log($( this ).data())
  });
}


//
// Plans
//
/*
$('.active form').card({
    container: $('.card-wrapper'),
    nameInput: 'input[name="first-name"], input[name="last-name"]'
})
*/

var navActive = function () {
  var path = decodeURIComponent(window.location.pathname.replace(/\/$/, ""))
  $('.themeDark .minorityMenu .minMenuItem a').each(function () {
        var href = $(this).attr('href');
        $(this).removeClass('active');
        if (window.location.hash == '#/launches' && href == '/a#/launches') {
          $(this).addClass('active');
        } else {
        if (path.substring(0, href.length) === href && window.location.hash != '#/launches') {
            $(this).addClass('active');
        }
        }
    });
  if (window.location.pathname.split('/')[1] == "data") {
    $('body').addClass('dataPage');
  }
}
navActive();

$(window).on('hashchange', function(e){
    navActive();
});




function AdjustHeight() {
    var height = document.getElementsByTagName('header')[0].offsetHeight;
    if (height > 81) { // for extra big nav
      document.getElementsByClassName("app-container")[0].style.marginTop = height + 'px';
    }
}
$(document).ready(AdjustHeight);
$(window).resize(AdjustHeight);














});

})(requirejs);
