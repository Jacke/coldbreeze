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



/*****
 * Fields for strategy in new element form
 */
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
var fieldForStrategy = function(strategy, action, newBpelem, base) {
  console.log('fieldForStrategy', strategy, action, base);
  setStrategyField(strategy, action, newBpelem, base);
  var f = _.find(base.selectedRefFields, function(r){ return r.strategy.id == strategy.id });
  if (f !== undefined) {
    console.log('return fields');
    return f.fields;
  } else {
    console.log('return null');
    return undefined;
  }
}

var fieldDecorator = function(base) {

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
  return {
    fieldType: fieldType,
    placeholder: placeholder,
    label: label,
    defaultValue: defaultValue
  }
}

var setStrategyField = function(strategy, action, newBpelem, base) {
  console.log('setStrategyField', strategy, action, newBpelem, base);
  
  if (newBpelem.selectedRef != undefined) {
  if (base.selectedRefFields == undefined) {  // if fields doesnt set
  base.selectedRefFields = _.map(newBpelem.selectedRef.strategies,function(strategyL) {
  var bases = [base]

  return {
    strategy: strategy,
    fields: _.flatten(_.map(bases, function(base) {
    var fieldDecoration = fieldDecorator(base);

      if (base.baseType == 'headers') {
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
          defaultValue: fieldDecoration.fieldType,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Field type",
            placeholder: ""
          }
        },        
        {
          type: 'repeatSection',
          key: 'HEADERS',
          ngModelAttrs: {
            myCustomValue: {
              bound: 'ng-my-custom-value',
              attribute: 'my-custom-value'
            }
          },          
          templateOptions: {
            btnText:'Add header',
            fields: [
              {
                className: 'row headers',
                fieldGroup: [
                  {
                    className: 'col-xs-4',
                    type: 'input',
                    key: 'key',
                    templateOptions: {
                      label: 'Key',
                      required: true
                    }
                  },
                  {
                    type: 'input',
                    key: 'value',
                    className: 'col-xs-4',
                    templateOptions: {
                      label: 'value'
                    }
                  }
                ]
              }
            ]
          }
         }
        ]
      } else {
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
          defaultValue: fieldDecoration.fieldType,
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
          type: fieldDecoration.fieldType,
          label: fieldDecoration.label,
          placeholder: fieldDecoration.placeholder
        }
        }];
      }


    }))
  }

  });
  };
} else {
  base.selectedRefFields = {};
}

}


var setStrategyFields = function(strategy, action, newBpelem) {
  console.log('setStrategyFields', strategy, newBpelem);
  
  if (newBpelem.selectedRef != undefined) {
  if (action.selectedRefFields == undefined) {  // if fields doesnt set
  action.selectedRefFields = _.map(newBpelem.selectedRef.strategies,function(strategyL) {
  var bases = _.filter(newBpelem.selectedRef.bases, function(base){
    return base.strategy == strategy.id
  });

  return {
    strategy: strategy,
    fields: _.flatten(_.map(bases, function(base) {

      var fieldDecoration = fieldDecorator(base);
      if (base.baseType == 'headers') {
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
          defaultValue: fieldDecoration.fieldType,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Field type",
            placeholder: ""
          }
        },        
        {
          type: 'repeatSection',
          key: 'HEADERS',
          ngModelAttrs: {
            myCustomValue: {
              bound: 'ng-my-custom-value',
              attribute: 'my-custom-value'
            }
        },          
          templateOptions: {
            btnText:'Add header',
            fields: [
              {
                className: 'row headers',
                fieldGroup: [
                  {
                    className: 'col-xs-4',
                    type: 'input',
                    key: 'key',
                    templateOptions: {
                      label: 'Key',
                      required: true
                    }
                  },
                  {
                    type: 'input',
                    key: 'value',
                    className: 'col-xs-4',
                    templateOptions: {
                      label: 'value'
                    }
                  }
                ]
              }
            ]
          }
         }
        ]
      } else {
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
          defaultValue: fieldDecoration.fieldType,
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
          type: fieldDecoration.fieldType,
          label: fieldDecoration.label,
          placeholder: fieldDecoration.placeholder
        }
        }];
      }


    }))
  }

  });
  };
} else {
  action.selectedRefFields = {};
}

}

/*****
 * Fields for strategy in edit form
 */
vm.editFieldForStrategy = function(strategy, action, base) {
  if (action.selectedRefFields == undefined || action.selec) {  // if fields doesnt set

  console.log('editFieldForStrategy: ', base);
  var f = _.flatten(_.map([base], function(base) {
    var fieldDecoration = fieldDecorator(base);
      base.updatedStrategy = {
        base_id: base.id,
        field_type: fieldDecoration.fieldType,
      } 
      base.updatedStrategy[base.key] = JSON.parse(base.valueContent);

      if (base.baseType == 'headers') {
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
          defaultValue: fieldDecoration.fieldType,
          templateOptions: {
            className: 'hidden',
            type: "text",
            label: "Field type",
            placeholder: ""
          }
        },        
        {
          type: 'repeatSection',
          key: 'HEADERS',
          ngModelAttrs: {
            myCustomValue: {
              bound: 'ng-my-custom-value',
              attribute: 'my-custom-value'
            }
        },          
          templateOptions: {
            btnText:'Add header',
            fields: [
              {
                className: 'row headers',
                fieldGroup: [
                  {
                    className: 'col-xs-4',
                    type: 'input',
                    key: 'key',
                    templateOptions: {
                      label: 'Key',
                      required: true
                    }
                  },
                  {
                    type: 'input',
                    key: 'value',
                    className: 'col-xs-4',
                    templateOptions: {
                      label: 'value'
                    }
                  }
                ]
              }
            ]
          }
         }
        ]
      } else {
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
        defaultValue: fieldDecoration.fieldType,
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
      defaultValue: fieldDecoration.defaultValue,
      templateOptions: {
        className: 'new-elem-action__action-base__action-base-form__field',
        type: fieldDecoration.fieldType,
        label: fieldDecoration.label,
        placeholder: fieldDecoration.placeholder
      }
      }];
    }

  }));

  console.log('f', f);
  base.selectedRefFields = f;
  return f;

} else {
  return undefined;
}


}


/**
 * Form generator
 */
  return {
  /*
  * 1 Structure wrapper
  * collection
  * default
  * optional
  ******
  * header(key-value) => {key:value}
  * url(url)
  */

 /*
  * 2 Rednering
  */
  
    setStrategyFields: setStrategyFields,
    setStrategyField: setStrategyField,

    fieldsForStrategy: fieldsForStrategy,
      vm: { fieldsForStrategy: fieldsForStrategy,
          editFieldForStrategy: vm.editFieldForStrategy,

          fieldForStrategy: fieldForStrategy
      },
    /**
     * Desctucturing for sending to minority
     */  
    destructBase: function(base){return base}
  }



}]);



return actionFormBuilderService;

});





