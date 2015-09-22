// `main.js` is the file that sbt-web will use as an entry point
(function (requirejs) {
  'use strict';

  // -- RequireJS config --
  requirejs.config({
    // Packages = top-level folders; loads a contained file named 'main.js"
    // baseUrl: '/assets/javascripts',
    waitSeconds: 200,
    packages: ['common'],//, 'home', 'user', 'dashboard'],
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

      'pnotifycore': {
       deps: ['angular'],
       exports: 'pnotifycore'
      },

      'angular-moment': {
       deps: ['moment', 'angular'],
       exports: 'angular-moment'
      },

      'livestamp': {
       deps: ['angular'],
       exports: 'livestamp'
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


'app': {
  deps: ['angular', 'toastr', 'toaster', 'roundProgress'],
  export: 'app'
},
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
  deps: ['angular', 'app', 'controllers', 'toastr'],
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
'procElementController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'procElementController'
},
'reflectionController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'reflectionController'
},
'sessionController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'sessionController'
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
'offline': { deps: [], export: 'offline' },
'offlineSimulator': { deps: ['offline'], export: 'offlineSimulator' },
'shepherd': { deps: ['tether'], export: 'shepherd' }



      //'bootstrap': ['jquery']
    },
    paths: {
     'requirejs': '../lib/requirejs/require',
     'angularAMD': '../javascripts/angularAMD',
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
     'selectize':  '../js/selectize',
     'mobileDetect': '../js/mobile-detect',

      //'jquery': '../lib/jquery/jquery',
      //'angular': '../lib/angularjs/angular',
      //'angular-route': '../lib/angularjs/angular-route',
      //'angular-cookies': '../lib/angularjs/angular-cookies',
      //'bootstrap': '../lib/bootstrap/js/bootstrap',

  'angularanimate': '../bower_components/angular-animate/angular-animate',
  'angular': '../bower_components/angular/angular',
  'angular-websocket': '../bower_components/angular-websocket/angular-websocket',
  'toastr': '../bower_components/angular-toastr/toastr',
  //'toastr-tpl': '../bower_components/angular-toastr/toastr.tpl',
  'angular-pageslide-directive': '../bower_components/angular-pageslide-directive/src/angular-pageslide-directive',
  'jcs-auto-validate': '../bower_components/angular-auto-validate/dist/jcs-auto-validate.min',
  'angular-classy': '../bower_components/angular-classy/angular-classy.min',
  'angular-resource': '../bower_components/angular-resource/angular-resource',
  'angular-cookies': '../bower_components/angular-cookies/angular-cookies',
  'select': '../bower_components/angular-ui-select/dist/select',
  'pnotifycore': '../bower_components/pnotify/pnotify.core',
  'roundProgress': '../bower_components/angular-svg-round-progressbar/src/roundProgress',
  'angular-moment': '../bower_components/angular-moment/angular-moment',
  'livestamp': 'https://cdn.rawgit.com/mattbradley/livestampjs/1.1.2/livestamp.min',
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

  'app': '../js/app',
  'filters': '../js/filters',
  'services': '../js/services',
  'launches': '../js/services/launches',
 // 'popupService': '../js/popupService',
  'treebuilder': '../js/treebuilder',
  'controllers': '../js/controllers/controllers',
  'procPermController': '../js/controllers/procPermController',
  'procController': '../js/controllers/procController',
  'procCreateController': '../js/controllers/processes/procCreateController',
  'procDetailController': '../js/controllers/processes/procDetailController',
  'requestController': '../js/controllers/requestController',
  'loggerController': '../js/controllers/loggerController',
  'stationController': '../js/controllers/stationController',
  'procElementController': '../js/controllers/procElementController',
  'reflectionController': '../js/controllers/reflectionController',
  'sessionController': '../js/controllers/sessionController',
  'directives': '../js/directives',
  'classie': '../js/classie',
  'cssParser': '../js/cssParser',
  'tether': '../bower_components/tether/dist/js/tether',
  'shepherd': '../bower_components/tether-shepherd/dist/js/shepherd',
  'tour': '../javascripts/tour',
  'offline': '../bower_components/offline/offline',
  'offlineSimulator': '../bower_components/offlinejs-simulate-ui/offline-simulate-ui.min'
  }});

  requirejs.onError = function (err) {
    console.log(err);
  };

  // Load the app. This is kept minimal so it doesn't need much updating.
require(['requirejs','jsRoutes','jquery', 'mobileDetect','popupoverlay','drag-on','jquery.nicescroll','ssl','offline','offlineSimulator','header','tooltip','dropdown','underscore','moment','selectize', 'tether', 'shepherd','tour',
  ],//'jquery', 'bootstrap'],//, './app'],
    function (requirejs,jsRoutes,$,mobileDetect,popupoverlay,dragOn,niceScroll,ssl,offline,offlineSimulator,header,tooltip,dropdown,underscore,moment,selectize,tether,shepherd,tour) {
        document.tour = tour;
      $(document).ready(function(){
        document.mobileDetect = new mobileDetect(window.navigator.userAgent);
        document.isMobile = (document.mobileDetect.phone() != null) ? true : false;
       

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
        window.location.href = "a#/launches";
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

$('#addMembersForm').slideToggle();

$('#addMembersForm button.posRight').on('click', function(event) {

event.preventDefault();
  var emails = $('textarea#newUsersForGroup').val().split(',');
  var admin =  $('#teamAdminRole').prop("checked");
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
var data = $('.inputEmployee').map(function(c){return [$(this).find('.flatInput').val(), $(this).find('.flatCheckbox input').is(':checked') ] })
var n = 2;
var lists = _.groupBy(data, function(element, index){
  return Math.floor(index/n);
});
lists = _.filter(_.toArray(lists), function(arr){ return arr[0] != "" });
var admin = _.filter(lists, function(arr) { return arr[1] == true });
var employee = _.filter(lists, function(arr) { return arr[1] == false });

console.log("admin");
console.log(admin);
console.log("employee");
console.log(employee);

/** 
 * Submiting
 */

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

$('#addMembersForm').slideToggle();

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
}
navActive();

$(window).on('hashchange', function(e){
    navActive();
});

});
   
})(requirejs);