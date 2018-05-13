var path = require('path');
//"use strict";
var webpack = require('webpack');
//var WebpackDevServer = require('webpack-dev-server');
//var proxy = require('proxy-middleware');
console.log(__dirname);

module.exports = {
    devtool: 'eval',
    context: __dirname + "/app/assets",
    //entry: "./javascripts/app_core.js",
    //entry: __dirname + "/app/assets/javascripts/core.js",
    entry: [
        'webpack-dev-server/client?http://localhost:3000',
        'webpack/hot/only-dev-server',
        path.join(__dirname, '/app/assets/javascripts/react_core.js'),
        //core: [__dirname + "/app/assets/javascripts/core.js"],
        //app_core: [__dirname + "/app/assets/javascripts/app_core.js"],
        //react_core: [__dirname + "/app/assets/javascripts/react_core.js"]
    ],
    output: {
        path: path.join(__dirname, '/app/assets/dist/js/'), //__dirname + "/app/assets/javascripts/",
        filename: "[name].bundle.js",
        webpack_public_path: "/assets/dist/js/",
        //publicPath: "/assets/dist/js/",
        publicPath: "/assets/dist/js/",
  },
  module: {
      loaders: [
          { test: /\.js$/, exclude: /node_modules/, loaders: ['react-hot','babel'], 
          include: [path.join(__dirname, './app/assets/javascripts/'),
                    path.join(__dirname, './react-hot-boilerplate/src'),
          ]}
      ]
  },
 plugins: [
    new webpack.HotModuleReplacementPlugin()
  ],  
/*   devServer: {
        proxy: {
            '/some/path*': {
                target: 'https://other-server.example.com',
                secure: false,
            },
        },
    },
*/
  //alias: {
  //   'reactapp': __dirname + '/app/assets/javascripts/reactapp',
  // }
};
