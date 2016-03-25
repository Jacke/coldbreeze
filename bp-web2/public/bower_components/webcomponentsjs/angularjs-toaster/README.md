angular-toaster
===============

Simple toaster directive for angular

##bower

`bower install angular-toaster --save`


## example

```HTML
<!doctype html>
<html class="no-js" ng-app="myModule">
<head>
    <meta charset="utf-8">
    <title>angular-toaster</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="toaster.css">
    <style>
        .rotate-infinite{
            -animation: spin .7s infinite linear;
            -webkit-animation: spinWebkit .7s infinite linear;
            -moz-animation: spinMoz .7s infinite linear;
            -o-animation: spinO .7s infinite linear;
            -ms-animation: spin .7s infinite linear;
        }

        @keyframes spin {
            from { transform: scale(1) rotate(0deg);}
            to { transform: scale(1) rotate(360deg);}
        }

        @-webkit-keyframes spinWebkit {
            from { -webkit-transform: rotate(0deg);}
            to { -webkit-transform: rotate(360deg);}
        }

        @-moz-keyframes spinMoz {
            from { -moz-transform: rotate(0deg);}
            to { -moz-transform: rotate(360deg);}
        }

        @-o-keyframes spinO {
            from { -o-transform: rotate(0deg);}
            to { -o-transform: rotate(360deg);}
        }
    </style>   
</head>
<body>
    <div class="container">
        <h1>angular-toaster example</h1>
        <!-- toaster directive -->
        <div toaster>
            <span class="glyphicon glyphicon-refresh rotate-infinite" aria-hidden="true"></span>
            Loading...
        </div>
        <div class="form-group" ng-controller="TestCtrl" style="position:relative;top:150px;">
            <button type="button" ng-click="show()" class="btn btn-primary">show</button>
            <button type="button" ng-click="hide()" class="btn">hide</button>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.4/angular.min.js"></script>
    <script src="toaster.js"></script>
    <script type="text/javascript">
        angular
        .module('myModule', ['toaster'])
        .controller('TestCtrl', function($scope, toaster) {
            $scope.show = function() {
                console.log("show toaster");
                toaster.show();
            };
            $scope.hide = function() {
                console.log("hide toaster");
                toaster.hide();
            };
        });
    </script>
</body>
</html>
````

