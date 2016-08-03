'use strict';

/* Controllers */
  /*.run(function ($rootScope, $templateCache) {
  $rootScope.$on('$viewContentLoaded', function () {
    $templateCache.removeAll();
  });'angularanimate'], function (angular, toastr, angularanimate) {
});*/
define(['angular', 'app', 'angularanimate'], function (angular, minorityApp, angularanimate) {


var actionFormBuilderService = angular.module('minorityApp.ActionFormBuilderService', ['minorityApp.services'])
    .constant('MODULE_VERSION', '1.0.0')
    .value('defaults', {
        foo: 'bar'
    })


actionFormBuilderService.factory('ActionFormBuilder', ['LaunchElemsFactory', 
  'LaunchSpacesFactory', 'LaunchSpaceElemsFactory', 'BPElemsFactory','BPSpacesFactory', 
  'BPSpaceElemsFactory',
  function(LaunchElemsFactory, LaunchSpacesFactory, LaunchSpaceElemsFactory, BPElemsFactory,BPSpacesFactory, BPSpaceElemsFactory) {


var vm = this;


var setStrategyFields = function(strategy, action, newBpelem) {
  console.log(newBpelem);
  
  if (newBpelem.selectedRef != undefined) {
  if (action.selectedRefFields == undefined) {  // if fields doesnt set
  action.selectedRefFields = _.map(newBpelem.selectedRef.strategies,function(strategyL) {
  var bases = _.filter(newBpelem.selectedRef.bases, function(base){
    return base.strategy == strategy.id
  });

  return {
    strategy: strategy,
    fields: _.flatten(_.map(bases, function(base) {
        if (base.baseType == "duration") {
          var fieldType = 'number'
          var placeholder = '';
          var label = 'Duration';
        } else if (base.baseType == "datetime") {
          var fieldType = 'text'
          var placeholder = 'DD/MM/YEAR HH:MM:SS';
          var label = 'Schedule';
        } else if (base.baseType == "url") { 
          var fieldType = 'url'
          var label = 'URL';                  
          var placeholder = 'http://example.com/api/v1/resource';
        } else if (base.baseType == "headers") {
          var fieldType = 'headers'
          var label = 'HEADERS';                  
          var placeholder = 'KEY:Value';          
        } else {
          var fieldType = 'text'
          var placeholder = '';
          var label = '';
        }

      return [
        {
          key: "base_id",
          type: 'input',
          className: 'hidden',
          defaultValue: base.id,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Base id",
            placeholder: ""
          }
        },
        {
          key: "field_type",
          type: "input",
          className: 'hidden',
          defaultValue: fieldType,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Field type",
            placeholder: ""
          }

        },
        {
        key: base.key,
        type: 'input',
        className: 'new-elem-action__action-base__action-base-form__field',
        templateOptions: {
          className: 'new-elem-action__action-base__action-base-form__field',
          type: fieldType,
          label: label,
          placeholder: placeholder
        }
        }];
    }))
  }

  });
  };
} else {
  action.selectedRefFields = {};
}

}

/*****
 * Fields for strategy in new element form
 */
vm.fieldsForStrategy = function(strategy, action, newBpelem) {
  setStrategyFields(strategy, action, newBpelem);
  var f = _.find(action.selectedRefFields, function(r){ return r.strategy.id == strategy.id });
  if (f !== undefined) {
    return f.fields;
  } else {
    return undefined;
  }
}

var fieldsForStrategy = function(strategy, action, newBpelem) {
  console.log('fieldsForStrategy', strategy, action);
  setStrategyFields(strategy, action, newBpelem);
  var f = _.find(action.selectedRefFields, function(r){ return r.strategy.id == strategy.id });
  if (f !== undefined) {
    console.log('return fields');
    return f.fields;
  } else {
    console.log('return null');
    return undefined;
  }
}



var setStrategyEditFields = function(strategy, action, newBpelem) {
  if (action.selectedRefFields == undefined) {  // if fields doesnt set
  action.selectedRefFields = _.map([strategy], function(strategyL) {
  var bases = _.filter(action.strategy_bases, function(base){
    return base.strategy == strategy.id
  });

  return {
    strategy: strategy,
    fields: _.flatten(_.map(bases, function(base) {
        if (base.baseType == "duration") {
          var fieldType = 'number'
          var placeholder = '';
          var label = 'Duration';
        } else if (base.baseType == "datetime") {
          var fieldType = 'text'
          var placeholder = 'DD/MM/YEAR HH:MM:SS';
          var label = 'Schedule';
        } else if (base.baseType == "url") { 
          var fieldType = 'url'
          var label = 'URL';                  
          var placeholder = 'http://example.com/api/v1/resource';
        } else if (base.baseType == "headers") {
          var fieldType = 'headers'
          var label = 'HEADERS';                  
          var placeholder = 'KEY:Value';          
        } else {
          var fieldType = 'text'
          var placeholder = '';
          var label = '';
        }

      return [
        {
          key: "base_id",
          type: 'input',
          className: 'hidden',
          defaultValue: base.id,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Base id",
            placeholder: ""
          }
        },
        {
          key: "field_type",
          type: "input",
          className: 'hidden',
          defaultValue: fieldType,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Field type",
            placeholder: ""
          }

        },
        {
        key: base.key,
        type: 'input',
        className: 'new-elem-action__action-base__action-base-form__field',
        templateOptions: {
          className: 'new-elem-action__action-base__action-base-form__field',
          type: fieldType,
          label: label,
          placeholder: placeholder
        }
        }];
    }))
  }

  });
  };

}
/*****
 * Fields for strategy in edit form
 */
vm.editFieldsForStrategy = function(strategy, action, bases) {
  if (action.selectedRefFields == undefined || action.selec) {  // if fields doesnt set

  console.log('editFieldsForStrategy: ', bases);
  var f = _.flatten(_.map([bases], function(base) {
      if (base.baseType == "duration") {
        var fieldType = 'number'
        var placeholder = '';
        var label = 'Duration';
        var defaultValue = parseInt(base.valueContent)
      } else if (base.baseType == "datetime") {
        var fieldType = 'text'
        var placeholder = 'DD/MM/YEAR HH:MM:SS';
        var label = 'Schedule';
        var defaultValue = base.valueContent;
      } else if (base.baseType == "url") { 
          var fieldType = 'url'
          var label = 'URL';        
          var placeholder = 'http://example.com/api/v1/resource';
          var defaultValue = base.valueContent;

        } else if (base.baseType == "headers") {
          var fieldType = 'headers'
          var label = 'HEADERS';                  
          var placeholder = 'KEY:Value';          
        } else {
          
        var fieldType = 'text'
        var placeholder = '';
        var label = '';
        var defaultValue = base.valueContent;

      }

    return [
      {
        key: "base_id",
        type: 'input',
        defaultValue: base.id,
        className: 'hidden',
        templateOptions: {
          type: "text",
            className: 'hidden',
          label: "Base id",
          placeholder: ""
        }
      },
      {
        key: "field_type",
        type: "input",
        defaultValue: fieldType,
        className: 'hidden',
        templateOptions: {
          type: "text",
            className: 'hidden',
          label: "Field type",
          placeholder: ""
        }

      },
      {
      key: base.key,
      type: 'input',
      className: 'new-elem-action__action-base__action-base-form__field',
      defaultValue: defaultValue,
      templateOptions: {
        className: 'new-elem-action__action-base__action-base-form__field',
        type: fieldType,
        label: label,
        placeholder: placeholder
      }
      }];
    }));

  console.log('f', f);
  action.selectedRefFields = f;
  return f;

} else {
  return undefined;
}


}


/**
 * Form generator
 */

 /*
  * 1 Structure wrapper
  */

 /*
  * 2 Rednering
  */





  return {
    setStrategyFields: setStrategyFields,
    fieldsForStrategy: fieldsForStrategy,
    setStrategyEditFields: setStrategyEditFields,
      vm: { fieldsForStrategy: vm.fieldsForStrategy,
          editFieldsForStrategy: vm.editFieldsForStrategy
      }
  }



}]);



return actionFormBuilderService;

});





