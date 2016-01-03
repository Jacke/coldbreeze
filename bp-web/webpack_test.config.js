var path = require('path');

module.exports = {
context: __dirname + "/app/assets",
    //entry: "./javascripts/app_core.js",
    //entry: __dirname + "/app/assets/javascripts/core.js",
        entry: {
        //core: [__dirname + "/app/assets/javascripts/core.js"],
        //app_core: [__dirname + "/app/assets/javascripts/app_core.js"],
        react_core: [__dirname + "/app/assets/javascripts/react_core.js"]
    },
    output: {
        path: path.join(__dirname, '/app/assets/dist/js/'), //__dirname + "/app/assets/javascripts/",
        filename: "[name].bundle.js",
        webpack_public_path: "/assets/dist/js/",
        publicPath: "/assets/dist/js/",
  },
  module: {
      loaders: [
          { test: /\.js$/, exclude: /node_modules/, loader: "babel", query: {presets:['react','es2015']}}
      ]
  },
   devServer: {
        proxy: {
            '/some/path*': {
                target: 'https://other-server.example.com',
                secure: false,
            },
        },
    },

  alias: {
     'reactapp': __dirname + '/app/assets/javascripts/reactapp',
   }
};
