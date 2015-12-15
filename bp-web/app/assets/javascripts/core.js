var popupoverlay = require('popupoverlay');
var jsRoutesLoader = require('routeLoader');
var test1 = require('./test1.js');
//require("imports?window=>{}!exports?window.XModule!./file.js
var test1 = require('imports?this=>global!exports?global.Zeta!./test1.js');



//var a = require("script!./jsRoutes.js");
console.log('good');
//console.log(popupoverlay);
console.log(jsRoutesLoader);
console.log(jsRoutes);
console.log(test1);
//console.log(a);
//console.log(jsRoutes.load());
document.routes = jsRoutes;
document.popupoverlay = popupoverlay;
document.test1 = test1;


require(['jsRoutes','jquery','react','moment','pnotify','mobileDetect','popupoverlay','drag-on','jquery.nicescroll','offline','offlineSimulator','tooltip','dropdown','underscore','selectize', 'tether', 'shepherd','tour',
  ],//'jquery', 'bootstrap'],//, './app'],
    function (jsRoutes,$,react, moment,pnotify,mobileDetect,popupoverlay,dragOn,niceScroll,offline,offlineSimulator,tooltip,dropdown,underscore,selectize,tether,shepherd,tour) {
		var header = require("coffee!./header.coffee");
		header();
		var ssl = require("coffee!./ssl.coffee");
		ssl();
    console.log(moment);
		var moment2 = require("script!./moment.js");
    console.log(moment2);
        document.tour = tour;
      $(document).ready(function(){
        document.mobileDetect = new mobileDetect(window.navigator.userAgent);
        document.isMobile = (document.mobileDetect.phone() != null) ? true : false;
        document.react = react;
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
  var emails = map.call(document.querySelectorAll('.inputEmployee input#newUsersForGroup'), function( l ){ return l.value }).filter(function(o){return o != "" })
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
var admin = _.filter(lists, function(arr) { return arr[1] == true })._.map(function(el){return el[0] })
var employee = _.filter(lists, function(arr) { return arr[1] == false })._.map(function(el){return el[0] })

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
//
// Databoard
//

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
  $( ".inlineEntityForm" ).slideDown();
});
$(".tableMinListFilter.search-process-input.add-resource-field.filterLayer #resourceTitle").focusout(function() {
  if ($('#resourceTitle').val() != "") {

  } else {
  $( ".inlineEntityForm" ).hide();
  }
});


  $('#createResourceBtn').click(function(ev){ 
    ev.preventDefault(); 
    $('#createResourceBtn').hide();
    var resource = { title: $('#resourceTitle').val(), business: 0 };
    

    var attribute = {
    title: $('#newInlineAttrTitleField').val(), 
    boardId: 'ce6ffac0-df91-4ec6-a1dd-3fa7f7833589', // Random UUID, doesnt make sense, will regenerated
    description: $('#newInlineAttrDescField').val(), 
    publisher: '', 
    etype: $('#newInlineAttrEtypeField').val(), 
    default: $('#newInlineAttrDefaultField').val()
    };

    jsRoutes.controllers.DataController.api_create_resource().ajax({
      dataType: 'json',contentType: 'application/json',data: JSON.stringify( { "resource": resource, 
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

});
   
