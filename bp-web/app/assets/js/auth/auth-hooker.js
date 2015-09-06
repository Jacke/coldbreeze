
$(function domReadyLoginFlow () {
  
  var getUrlParameter = function(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}

  var whoamiCreds = function (data) {
    $.ajax({url: jsRoutes.controllers.ProfileController.dashboard().absoluteURL(document.ssl_enabled) + "whoami", type: 'post', headers: {
      "Access_Name": "User", "X-Auth-Token": data.token
    }}).done(function(who) {
    localStorage.setItem("manager", who.manager);
    localStorage.setItem("business", who.business);
    localStorage.setItem("employee", who.employee);
    //$('.form-horizontal button').toggleClass('loading');
  });
  }

  $('.form-horizontal button').on('click', function(event) {

  event.preventDefault();
  var name = $('.form-horizontal #username').val();
  var pswd = $('.form-horizontal #password').val();
  $('.messageBoxWrap').remove();
  $('.form-horizontal button').toggleClass('loading');
    $.post(jsRoutes.controllers.ProfileController.dashboard().absoluteURL(document.ssl_enabled) + "auth/api/authenticate/userpass", { username: name , password: pswd })
  .done(function( data ) {
  localStorage.setItem("token", data.token);
  sessionStorage.setItem("token", data.token);
  
  // Fetch whoami creds
  whoamiCreds(data);
  // Submit main form
  $('.form-horizontal')[0].submit();


  }).fail(function( jqXHR, textStatus) {
      $('.form-horizontal button').toggleClass('loading');
      $('.loginFlowPage').prepend('<div class="messageBoxWrap"><p class="message">'+ JSON.parse(jqXHR.responseText).error +'</p></div>');
    });

  });


  if (getUrlParameter('demo') != undefined && getUrlParameter('demo') == "ycombinator") {

    $('input#username').val('testing@minorityapp.com');
    $('input#password').val('12344321');
    $('button#l_submit').text('PRESS TO ENTER');

  }
  
  $('.loginView a.switchView2').on('click', function clickViewSwitch(e) {
    var nextPage;
    e.preventDefault();
    e = $(this).closest('.loginPage');
    if (e.hasClass('loginPage__active')) {
      e.removeClass('loginPage__active');
      nextPage = e.next();
      if (!nextPage || !nextPage.length) {
        nextPage = e.prev();
      }
      if (!nextPage || !nextPage.length) {
        return false;
      }
      nextPage.addClass('loginPage__active')
        .find('input:first-of-type').trigger('focus');
    }
    return false;
  });

  var suggestedEmail = null, $suggestionTip = null, $emailInputs;

  $emailInputs = $('.loginView form').on('click', '.suggestionTip', function (e) {
    var a;
    if (a = suggestedEmail) {
      e = $(this);
      e.prev().val(e.find('strong').text());
      $suggestionTip.el.addClass('notUsed');
      $suggestionTip.el.prev().removeClass('suggestionShowed');
    }
  }).on('blur', 'input[type=email]', function (e) {
    e = $(e.target);
    e.mailcheck({
      suggested: function ($inp, suggestion) {
        if ($suggestionTip && suggestion && suggestion.full) {
          $inp.next().find('strong').text(suggestion.full);
          $inp.addClass('suggestionShowed').next().removeClass('notUsed');
          suggestedEmail = suggestion;
        }
      },
      empty: function ($inp) {
        $suggestionTip.el.addClass('notUsed');
        $suggestionTip.el.prev().removeClass('suggestionShowed');
        suggestedEmail = null;
      }
    });
  }).find('input[type=email]');

  if ($emailInputs.length) {
    $suggestionTip = {
      el: $('<span></span>').addClass('suggestionTip notUsed').append('<span>Did you mean</span> <strong>at</strong><span>?</span>').insertAfter($emailInputs)
    };
    $suggestionTip.addr = $suggestionTip.el.find('strong');
  }


  $('.loginView form').on('submit', function submittedForm (e) {
    var $requireds;
    e.preventDefault();
    e = $(this);
    $requireds = e.find('input[required]').filter(function(){return this.value==="";});
    if ($requireds.length) {
      $requireds.get(0).focus();
      return false;
    }
    //e.find('button[type="submit"],input[type="submit"]').versionedtr('disabled', 'disabled').text(function updateTextOfSubmit(ind, text) {
    //  return text + '...';
    //});
    e.off();
    setTimeout(function submitTheForm () {
      e.trigger('submit');
    }, 200);
  });

  var el = $('input.onchangeGenerateSubdomain');
  if (el && el.length) {
    el.on('change keyup', function changeInputVal (e) {
      if (this.value && this.value.trim().length > 0) {
        $('#' + $(this).data('onchange')).text(this.value.trim().replace(/[^a-z0-9]/gi, '').toLowerCase());
      }
    }).trigger('change');
  }


  $('a.to_nav').on('click', function(event) {
  event.preventDefault();
  console.log(event);
  $('#navigation').toggleClass('expanded');
});

  
});
