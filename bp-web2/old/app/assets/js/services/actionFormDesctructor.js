define(['angular', 'app', 'actionFormGenerator'], function (angular, minorityApp, actionFormBuilderService) {

  actionFormBuilderService.factory('ActionFormDestructor', ['LaunchElemsFactory', 
  'LaunchSpacesFactory', 'LaunchSpaceElemsFactory', 'BPElemsFactory','BPSpacesFactory', 
  'BPSpaceElemsFactory',
  function(LaunchElemsFactory, LaunchSpacesFactory, LaunchSpaceElemsFactory, BPElemsFactory,BPSpacesFactory, BPSpaceElemsFactory) {

    var test = function(test) {
        console.log('test') 
    }

    return {
      test: test
    }



  }]);
  return actionFormBuilderService;

});