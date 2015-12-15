module.exports = {
  entry: './core.js',
  output: {
    filename: 'bundle.js'
  },
  devtool: 'source-map',
  module: {
    loaders: [
      {test: /\.css$/, loader: 'style!css!'}
    ]
  }
};