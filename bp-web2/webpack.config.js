var path = require('path');
var webpack = require('webpack');
var $https = require('https');
var BowerWebpackPlugin = require("bower-webpack-plugin");

// ...

var jsRoutesPath = 'http://192.168.1.102/jsroutes.js' 

module.exports = {
    context: __dirname + "/app/assets",
    //entry: "./javascripts/app_core.js",
    //entry: __dirname + "/app/assets/javascripts/core.js",
        entry: {
        core: [__dirname + "/app/assets/javascripts/core.js"],
        app_core: [__dirname + "/app/assets/javascripts/app_core.js"],
        //react_core: [__dirname + "/app/assets/javascripts/react_core.js"]
    },
    output: {
        path: path.join(__dirname, '/app/assets/dist/js/'), //__dirname + "/app/assets/javascripts/",
        filename: "[name].bundle.js",
        webpack_public_path: "/assets/dist/js/",
        publicPath: "/assets/dist/js/",

/*
    entry: {
        core: "./javascripts/core.js",
        app_core: "./javascripts/app_core.js"
    }
    */        
        // export itself to a global var
        //libraryTarget: "var",
        // name of the global var: "Foo"
        //library: "Foo"
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
       new webpack.optimize.UglifyJsPlugin({compress: {
          warnings: false
       }, minimize: true}),
       new BowerWebpackPlugin({
        modulesDirectories: ["bower_components"],
        manifestFiles:      "bower.json",
        includes:           /.*/,
        excludes:           [],
        searchResolveModulesDirectories: true
      }),

       new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery",
            "_": "underscore",
            'angular': 'angular',
            //"moment": "moment",
            "window.jQuery": "jquery",
            "routerDownloader": "jsRoutes"

        }),
       
        new webpack.ResolverPlugin(
            new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
        )
    
    ],
    devtool: "#source-map",
    resolve: {
          root: [path.join(__dirname, "/public/bower_components"), path.join(__dirname, "/app/assets/javascripts")],

        //      'popupoverlay': {
        //deps: ['jquery'],
        //exports: 'popupoverlay'
      //},
      //test: /backbone/, loader: 'exports?Backbone!imports?underscore,jquery'
    module: {
        loaders: [
            { test: /\.jsx?$/, loader: 'babel?presets[]=react,presets[]=es2015'},
            //{ test: /test_scripts\/\.js[x]?$/, loader: 'babel-loader?presets[]=es2015&presets[]=react' },
            //{ test: /\.js$/, loader: "script" },
            { test: /\.js$/, 
    exclude: /node_modules/, 
    loader: "babel", 
    query:
      {
        presets:['react']
      } },
            { test: /app\/assets\/js\/jquery\.popupoverlay\.js$/, loader: 'exports?popupoverlay!imports?jquery'},
            { test: /.\/jsRoutes\.js$/, loader: 'exports?window._jsRoutes' },
            { test: /\.coffee$/, loader: "coffee" },
            { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" },
            //{ test: /\.css$/, loader: "style-loader!css-loader" },
            { test: /\.png$/, loader: "url-loader?limit=100000" },
            { test: /\.jpg$/, loader: "file-loader" },  
// SHIMS
/*
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

      'pnotify': {
       deps: ['angular'],
       exports: 'pnotify'
      },

      'pnotifyconfirm': {
        deps: ['pnotify','jquery'],
        exports: 'pnotifyconfirm'
      },
      'pnotifybuttons': {
        deps: ['pnotify', 'jquery'],
        exports: 'pnotifybuttons'
      },
      'angularpnotify': {
        deps: ['angular','pnotify','jquery'],
        exports: 'angularpnotify'
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
  deps: ['angular', 'app', 'controllers', 'toaster'],
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
'launchesController': {
  deps: ['angular', 'app', 'controllers', 'toastr'],
  export: 'launchesController'
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
*/
           { test: /angularanimate/, loader: 'exports?angular-animate!imports?angular' }






        ],
        noParse: [/.css/]


    },
    extensions: ['', '.js', '.json', '.coffee', '.jsx'],
    modulesDirectories: [__dirname + '/app/bower_components', __dirname + '/../node_modules'],
    //__dirname + "/../node_modules", 
    alias: {
     'scriptjs': __dirname + '/app/assets/javascripts/script',
     'jsRoutes': __dirname + '/app/assets/javascripts/test_scripts/jsroutes.js',
     'routeLoader': __dirname + '/app/assets/javascripts/routeLoader',
     'requirejs': __dirname + '/app/assets/javascripts/requirejs',
     //'jquery':  __dirname + '/app/assets/js/jquery.js',
     'popupoverlay': __dirname + '/app/assets/js/jquery.popupoverlay',
     'drag-on':  __dirname + '/app/assets/js/drag-on',
     'jquery.nicescroll':  __dirname + '/public/bower_components/jquery.nicescroll/jquery.nicescroll',
     'ssl':  __dirname + '/app/assets/javascripts/ssl.coffee',
     'header':  __dirname + '/app/assets/javascripts/header.coffee',
     'tooltip':  __dirname + '/public/bower_components/bootstrap/js/tooltip',
     'dropdown':  __dirname + '/public/bower_components/bootstrap/js/dropdown',
     'underscore':  __dirname + '/public/bower_components/underscore/underscore',
     //'moment':  __dirname + '/public/bower_components/momentjs/moment',
     'selectize':  __dirname + '/app/assets/js/selectize',
     'mobileDetect': __dirname + '/app/assets/js/mobile-detect',
      //'jquery': '../lib/jquery/jquery',
      //'angular': '../lib/angularjs/angular',
      //'angular-route': '../lib/angularjs/angular-route',
      //'angular-cookies': '../lib/angularjs/angular-cookies',
      //'bootstrap': '../lib/bootstrap/js/bootstrap',
      'angularanimate': __dirname + '/public/bower_components/angular-animate/angular-animate',
      'angular': __dirname + '/public/bower_components/angular/angular',
      'react': __dirname + '/public/bower_components/react/react-with-addons',
      'react-dom': __dirname + '/public/bower_components/react/react-dom',
      'react-modal': __dirname + '/public/bower_components/react-modal/dist/react-modal',
     // 'reactapp': __dirname + '/app/assets/javascripts/reactapp',

      'angular-websocket': __dirname + '/public/bower_components/angular-websocket/angular-websocket.js',
      'toastr': __dirname + '/public/bower_components/angular-toastr/toastr',
      //'toastr-tpl': __dirname + '/public/bower_components/angular-toastr/toastr.tpl',
      'angular-pageslide-directive': __dirname + '/public/bower_components/angular-pageslide-directive/src/angular-pageslide-directive',
      'jcs-auto-validate': __dirname + '/public/bower_components/angular-auto-validate/dist/jcs-auto-validate.min',
      'angular-classy': __dirname + '/public/bower_components/angular-classy/angular-classy.min',
      'angular-resource': __dirname + '/public/bower_components/angular-resource/angular-resource',
      'angular-cookies': __dirname + '/public/bower_components/angular-cookies/angular-cookies',
      'select': __dirname + '/public/bower_components/angular-ui-select/dist/select',
      'pnotify': __dirname + '/public/bower_components/pnotify/pnotify.core',
      'pnotifyconfirm':__dirname + '/public/bower_components/pnotify/pnotify.confirm',
      'pnotifybuttons':__dirname + '/public/bower_components/pnotify/pnotify.buttons',
      'angularpnotify':__dirname + '/public/bower_components/angular-pnotify/src/angular-pnotify',
      'roundProgress': __dirname + '/public/bower_components/angular-svg-round-progressbar/src/roundProgress',
      'angular-moment': __dirname + '/public/bower_components/angular-moment/angular-moment',
      'livestamp': __dirname + '/app/assets/javascripts/livestamp',
      'ngDialog': __dirname + '/public/bower_components/ngDialog/js/ngDialog',
      'angular-ui-tree': __dirname + '/public/bower_components/angular-ui-tree/dist/angular-ui-tree',
      'angular-underscore': __dirname + '/public/bower_components/angularjs-toaster/angularunderscore',
      'loading-bar': __dirname + '/public/bower_components/angular-loading-bar/src/loading-bar',
      'ng-slide-down': __dirname + '/public/bower_components/ng-slide-down/dist/ng-slide-down',
      'ui-bootstrap': __dirname + '/public/bower_components/angular-bootstrap/ui-bootstrap',
      'ui-bootstrap-tpls': __dirname + '/public/bower_components/angular-bootstrap/ui-bootstrap-tpls',
      'toaster': __dirname + '/public/bower_components/angularjs-toaster/toaster',
      'angularLocalStorage': __dirname + '/public/bower_components/angularLocalStorage/src/angularLocalStorage',
      'angular-awesome-error': __dirname + '/public/bower_components/angular-errors-directive/angular-awesome-error',
      'angular-translate': __dirname + '/app/assets/js/angular-translate',
      'daterangepicker': __dirname + '/public/bower_components/bootstrap-daterangepicker/daterangepicker',
      'angular-daterangepicker': __dirname + '/public/bower_components/angular-daterangepicker/js/angular-daterangepicker',
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
      'launchesController': __dirname + '/app/assets/js/controllers/launchesController',
      'directives': __dirname + '/app/assets/js/directives',
      'classie': __dirname + '/app/assets/js/classie',
      'cssParser': __dirname + '/app/assets/js/cssParser',
      'tether': __dirname + '/public/bower_components/tether/dist/js/tether.js',
      'shepherd': __dirname + '/public/bower_components/tether-shepherd/dist/js/shepherd.js',
      'tour': __dirname + '/app/assets/javascripts/tour',
      'offline': __dirname + '/public/bower_components/offline/offline',
      'offlineSimulator': __dirname + '/public/bower_components/offlinejs-simulate-ui/offline-simulate-ui.min'
      }           
    //  root: path.resolve(__dirname + '/app/assets/javascripts'),
    //  extensions: ['', '.js']
    }
    
}