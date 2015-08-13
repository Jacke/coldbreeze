// `main.js` is the file that sbt-web will use as an entry point
(function (requirejs) {
  'use strict';

  // -- RequireJS config --
  requirejs.config({
    // Packages = top-level folders; loads a contained file named 'main.js"
    baseUrl: '/assets/javascripts',
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
      'selectize': {
        deps: ['jquery'],
        exports: 'selectize'
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
      'toastr-tpl': {
      deps: ['angular'],
      exports: 'toastr-tpl'
      },

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
  deps: ['angular', 'toastr','toastr-tpl', 'toaster'],
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
'treebuilder': {
  deps: ['angular', 'app'],
  export: 'treebuilder'
},
'controllers': {
  deps: ['angular', 'app', 'toastr','toastr-tpl', 'toaster'],
  export: 'controllers'
},
'procPermController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'procPermController'
},
'procController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'procController'
},
'requestController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'requestController'
},
'loggerController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'loggerController'
},
'stationController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'stationController'
},
'procElementController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'procElementController'
},
'reflectionController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'reflectionController'
},
'sessionController': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
  export: 'sessionController'
},
'directives': {
  deps: ['angular', 'app', 'controllers', 'toastr','toastr-tpl'],
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
}



      //'bootstrap': ['jquery']
    },
    paths: {
     'requirejs': ['../lib/requirejs/require'],
     'angularAMD': '../javascripts/angularAMD',
     'jsRoutes': ['/jsroutes'],
	   'jquery':  ['../javascripts/jquery-2.1.3.min'],
	   'drag-on':  ['../js/drag-on'],
	   'jquery.nicescroll':  ['../bower_components/jquery.nicescroll/jquery.nicescroll'],
	   'ssl':  ['../javascripts/ssl'],
	   'header':  ['../javascripts/header'],
	   'tooltip':  ['../bower_components/bootstrap/js/tooltip'],
	   'dropdown':  ['../bower_components/bootstrap/js/dropdown'],
	   'underscore':  ['../bower_components/underscore/underscore'],
	   'moment':  ['../bower_components/moment/moment'],
	   'selectize':  ['../js/selectize'],

      //'jquery': ['../lib/jquery/jquery'],
      //'angular': ['../lib/angularjs/angular'],
      //'angular-route': ['../lib/angularjs/angular-route'],
      //'angular-cookies': ['../lib/angularjs/angular-cookies'],
      //'bootstrap': ['../lib/bootstrap/js/bootstrap'],

  'angularanimate': ['../bower_components/angular-animate/angular-animate'],
  'angular': ['../bower_components/angular/angular'],
  'angular-websocket': ['../bower_components/angular-websocket/angular-websocket'],
  'toastr': ['../bower_components/angular-toastr/toastr'],
  'toastr-tpl': ['../bower_components/angular-toastr/toastr.tpl'],
  'angular-pageslide-directive': ['../bower_components/angular-pageslide-directive/src/angular-pageslide-directive'],
  'jcs-auto-validate': ['../bower_components/angular-auto-validate/dist/jcs-auto-validate.min'],
  'angular-classy': ['../bower_components/angular-classy/angular-classy.min'],
  'angular-resource': ['../bower_components/angular-resource/angular-resource'],
  'angular-cookies': ['../bower_components/angular-cookies/angular-cookies'],
  'select': ['../bower_components/angular-ui-select/dist/select'],
  'pnotifycore': ['../bower_components/pnotify/pnotify.core'],
  'angular-moment': ['../bower_components/angular-moment/angular-moment'],
  'livestamp': ['https://cdn.rawgit.com/mattbradley/livestampjs/1.1.2/livestamp.min'],
  'ngDialog': ['../bower_components/ngDialog/js/ngDialog'],
  'angular-ui-tree': ['../bower_components/angular-ui-tree/dist/angular-ui-tree'],
  'angular-underscore': ['../bower_components/angularjs-toaster/angularunderscore'],
  'loading-bar': ['../bower_components/angular-loading-bar/src/loading-bar'],
  'ng-slide-down': ['../bower_components/ng-slide-down/dist/ng-slide-down'],
  'ui-bootstrap': ['../bower_components/angular-bootstrap/ui-bootstrap'],
  'ui-bootstrap-tpls': ['../bower_components/angular-bootstrap/ui-bootstrap-tpls'],
  'toaster': ['../bower_components/angularjs-toaster/toaster'],
  'angularLocalStorage': ['../bower_components/angularLocalStorage/src/angularLocalStorage'],
  'angular-awesome-error': ['../bower_components/angular-errors-directive/angular-awesome-error'],
  'angular-translate': ['../js/angular-translate'],
  'daterangepicker': ['../bower_components/bootstrap-daterangepicker/daterangepicker'],
  'angular-daterangepicker': ['../bower_components/angular-daterangepicker/js/angular-daterangepicker'],

  'app': ['../js/app'],
  'filters': ['../js/filters'],
  'services': ['../js/services'],
  'treebuilder': ['../js/treebuilder'],
  'controllers': ['../js/controllers/controllers'],
  'procPermController': ['../js/controllers/procPermController'],
  'procController': ['../js/controllers/procController'],
  'requestController': ['../js/controllers/requestController'],
  'loggerController': ['../js/controllers/loggerController'],
  'stationController': ['../js/controllers/stationController'],
  'procElementController': ['../js/controllers/procElementController'],
  'reflectionController': ['../js/controllers/reflectionController'],
  'sessionController': ['../js/controllers/sessionController'],
  'directives': ['../js/directives'],
  'classie': ['../js/classie'],
  'cssParser': ['../js/cssParser']
  }});

  requirejs.onError = function (err) {
    console.log(err);
  };

  // Load the app. This is kept minimal so it doesn't need much updating.
require(['requirejs','jsRoutes','jquery','drag-on','jquery.nicescroll','ssl','header','tooltip','dropdown','underscore','moment','selectize'
  ],//'jquery', 'bootstrap'],//, './app'],
    function (requirejs,jsRoutes,$,dragOn,niceScroll,ssl,header,tooltip,dropdown,underscore,moment,selectize) {
    	$(document).ready(function(){
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
jsRoutes.controllers.users.EmployeeController.create_new().ajax({data: JSON.stringify({emails: emails, manager: admin}), dataType: "json", contentType: 'application/json',
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