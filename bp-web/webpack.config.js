var path = require('path');
var webpack = require('webpack');
var $https = require('https');

// ...

var jsRoutesPath = 'http://192.168.1.102/jsroutes.js' 

module.exports = {
    context: __dirname + "/app/assets",
    entry: "./javascripts/core.js",
    output: {
        path: __dirname, //+ "/dist",
        filename: "./app/assets/javascripts/bundle.js",
        // export itself to a global var
        libraryTarget: "var",
        // name of the global var: "Foo"
        library: "Foo"
    },

    externals: {
        // require("jquery") is external and available
        //  on the global var jQuery
        //"jquery": "jQuery"
        'test2': 'test2'
    },
    plugins: [
       // Doesn't work with ajax, it was replaced by gulp remote-src fetching for jsroutes
       //new webpack.DefinePlugin({
       // JSROUTER: $https.get( 'https://min.ority.us/jsroutes.js', function( res ){
       //   res.on( 'data', function( data ){
       //     eval(data);
       //   });
       // })
       //
       //}),
       new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery",
            "_": "underscore",
            "window.jQuery": "jquery",
            "routerDownloader": "jsRoutes"
        })
    ],
    devtool: "#source-map",
    resolve: {
        //      'popupoverlay': {
        //deps: ['jquery'],
        //exports: 'popupoverlay'
      //},
      //test: /backbone/, loader: 'exports?Backbone!imports?underscore,jquery'
    module: {
        loaders: [
              { test: /test_scripts\/\.js[x]?$/, loader: 'babel-loader?presets[]=es2015&presets[]=react' },

            { test: /app\/assets\/js\/jquery\.popupoverlay\.js$/, 
              loader: 'exports?popupoverlay!imports?jquery'},
            {         test: /.\/jsRoutes\.js$/,
                      loader: 'exports?window._jsRoutes' }  
        ]


    },
    alias: {
     'scriptjs': __dirname + '/app/assets/javascripts/script',
     'jsRoutes': __dirname + '/app/assets/javascripts/test_scripts/jsroutes.js',
     'routeLoader': __dirname + '/app/assets/javascripts/routeLoader',
     //'jquery':  __dirname + '/app/assets/javascripts/jquery.js',
     'popupoverlay': __dirname + '/app/assets/js/jquery.popupoverlay',
     'drag-on':  __dirname + '/app/assets/js/drag-on',
     'jquery.nicescroll':  __dirname + '/app/public/bower_components/jquery.nicescroll/jquery.nicescroll',
     'ssl':  __dirname + '/app/assets/javascripts/ssl',
     'header':  __dirname + '/app/assets/javascripts/header',
     'tooltip':  __dirname + '/app/public/bower_components/bootstrap/js/tooltip',
     'dropdown':  __dirname + '/app/public/bower_components/bootstrap/js/dropdown',
     'underscore':  __dirname + '/app/public/bower_components/underscore/underscore',
     'moment':  __dirname + '/app/public/bower_components/moment/moment',
     'selectize':  __dirname + '/app/assets/js/selectize',
     'mobileDetect': __dirname + '/app/assets/js/mobile-detect',
      //'jquery': '../lib/jquery/jquery',
      //'angular': '../lib/angularjs/angular',
      //'angular-route': '../lib/angularjs/angular-route',
      //'angular-cookies': '../lib/angularjs/angular-cookies',
      //'bootstrap': '../lib/bootstrap/js/bootstrap',
  'angularanimate': __dirname + '/app/public/bower_components/angular-animate/angular-animate',
  'angular': __dirname + '/app/public/bower_components/angular/angular',
  'react': __dirname + '/app/public/bower_components/react/react',
  'angular-websocket': __dirname + '/app/public/bower_components/angular-websocket/angular-websocket',
  'toastr': __dirname + '/app/public/bower_components/angular-toastr/toastr',
  //'toastr-tpl': __dirname + '/app/public/bower_components/angular-toastr/toastr.tpl',
  'angular-pageslide-directive': __dirname + '/app/public/bower_components/angular-pageslide-directive/src/angular-pageslide-directive',
  'jcs-auto-validate': __dirname + '/app/public/bower_components/angular-auto-validate/dist/jcs-auto-validate.min',
  'angular-classy': __dirname + '/app/public/bower_components/angular-classy/angular-classy.min',
  'angular-resource': __dirname + '/app/public/bower_components/angular-resource/angular-resource',
  'angular-cookies': __dirname + '/app/public/bower_components/angular-cookies/angular-cookies',
  'select': __dirname + '/app/public/bower_components/angular-ui-select/dist/select',
  'pnotify': __dirname + '/app/public/bower_components/pnotify/pnotify.core',
  'pnotifyconfirm':__dirname + '/app/public/bower_components/pnotify/pnotify.confirm',
  'pnotifybuttons':__dirname + '/app/public/bower_components/pnotify/pnotify.buttons',
  'angularpnotify':__dirname + '/app/public/bower_components/angular-pnotify/src/angular-pnotify',

  'roundProgress': __dirname + '/app/public/bower_components/angular-svg-round-progressbar/src/roundProgress',
  'angular-moment': __dirname + '/app/public/bower_components/angular-moment/angular-moment',
  'livestamp': 'https://cdn.rawgit.com/mattbradley/livestampjs/1.1.2/livestamp.min',
  'ngDialog': __dirname + '/app/public/bower_components/ngDialog/js/ngDialog',
  'angular-ui-tree': __dirname + '/app/public/bower_components/angular-ui-tree/dist/angular-ui-tree',
  'angular-underscore': __dirname + '/app/public/bower_components/angularjs-toaster/angularunderscore',
  'loading-bar': __dirname + '/app/public/bower_components/angular-loading-bar/src/loading-bar',
  'ng-slide-down': __dirname + '/app/public/bower_components/ng-slide-down/dist/ng-slide-down',
  'ui-bootstrap': __dirname + '/app/public/bower_components/angular-bootstrap/ui-bootstrap',
  'ui-bootstrap-tpls': __dirname + '/app/public/bower_components/angular-bootstrap/ui-bootstrap-tpls',
  'toaster': __dirname + '/app/public/bower_components/angularjs-toaster/toaster',
  'angularLocalStorage': __dirname + '/app/public/bower_components/angularLocalStorage/src/angularLocalStorage',
  'angular-awesome-error': __dirname + '/app/public/bower_components/angular-errors-directive/angular-awesome-error',
  'angular-translate': __dirname + '/app/assets/js/angular-translate',
  'daterangepicker': __dirname + '/app/public/bower_components/bootstrap-daterangepicker/daterangepicker',
  'angular-daterangepicker': __dirname + '/app/public/bower_components/angular-daterangepicker/js/angular-daterangepicker',
  'app': __dirname + '/app/assets/js/app',
  'filters': __dirname + '/app/assets/js/filters',
  'services': __dirname + '/app/assets/js/services',
  'launches': __dirname + '/app/assets/js/services/launches',
 // 'popupService': __dirname + '/app/assets/js/popupService',
  'treebuilder': __dirname + '/app/assets/js/treebuilder',
  'controllers': __dirname + '/app/assets/js/controllers/controllers',
  'procPermController': __dirname + '/app/assets/js/controllers/procPermController',
  'procController': __dirname + '/app/assets/js/controllers/procController',
  'historyController': __dirname + '/app/assets/js/controllers/historyController',
  'procCreateController': __dirname + '/app/assets/js/controllers/processes/procCreateController',
  'procDetailController': __dirname + '/app/assets/js/controllers/processes/procDetailController',
  'requestController': __dirname + '/app/assets/js/controllers/requestController',
  'loggerController': __dirname + '/app/assets/js/controllers/loggerController',
  'stationController': __dirname + '/app/assets/js/controllers/stationController',
  'procElementController': __dirname + '/app/assets/js/controllers/procElementController',
  'reflectionController': __dirname + '/app/assets/js/controllers/reflectionController',
  'sessionController': __dirname + '/app/assets/js/controllers/sessionController',
  'directives': __dirname + '/app/assets/js/directives',
  'classie': __dirname + '/app/assets/js/classie',
  'cssParser': __dirname + '/app/assets/js/cssParser',
  'tether': __dirname + '/app/public/bower_components/tether/dist/js/tether',
  'shepherd': __dirname + '/app/public/bower_components/tether-shepherd/dist/js/shepherd',
  'tour': __dirname + '/app/assets/javascripts/tour',
  'offline': __dirname + '/app/public/bower_components/offline/offline',
  'offlineSimulator': __dirname + '/app/public/bower_components/offlinejs-simulate-ui/offline-simulate-ui.min'
        }           
    //  root: path.resolve(__dirname + '/app/assets/javascripts'),
    //  extensions: ['', '.js']
    }
    
}