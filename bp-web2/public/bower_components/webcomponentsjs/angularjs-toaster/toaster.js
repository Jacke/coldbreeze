'use strict';

angular.module('toaster', [])
	.service('toaster', ['$rootScope', function($rootScope) {
    	this.show = function() {
    		$rootScope.$emit('toaster-show');
    	};
    	this.hide = function() {
    		$rootScope.$emit('toaster-hide');
    	};
	}])
	.directive('toaster', ['$rootScope', function($rootScope) {
			return {
				replace: true,
				restrict: 'EA',
				transclude: true,
				scope: true, 
				template: 	'<div class="toaster-container" ng-class="{\'toaster-hide\':hidden}">' + 
								'<div class="toaster"><ng-transclude></ng-transclude></div>' +
							'</div>',
				controller: ['$scope', function ($scope) {
					$scope.hidden = true;
				}],
				link: function(scope) {
					$rootScope.$on('toaster-show', function () {
                		scope.hidden = false;
            		});
            		$rootScope.$on('toaster-hide', function () {
                		scope.hidden = true;
            		});
				}
			};
		}
	]);