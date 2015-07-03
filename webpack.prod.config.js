var path = require('path');
var webpack = require('webpack');

module.exports = {
  entry: [
    './src/index'
  ],
  output: {
    path: path.join(__dirname, 'build'),
    filename: 'bundle.js',
  },
  plugins: [
    new webpack.NoErrorsPlugin()
  ],
  resolve: {
    extensions: ['', '.js', '.jsx', '.cjsx', '.coffee']
  },
  module: {
    loaders: [{
      test: /\.jsx?$/,
      loaders: ['react-hot', 'babel'],
      include: path.join(__dirname, 'src')
    },{
      test: /\.cjsx?$/,
      loaders: ['react-hot', 'coffee', 'cjsx'],
      include: path.join(__dirname, 'src')
    },{
      test: /\.coffee?$/,
      loaders: ['react-hot', 'coffee'],
      include: path.join(__dirname, 'src')
    },{
      test: require.resolve("react"),
      loader: "expose?React"
    },{
      test: /\.json?$/,
      loader: "json"
    },{
      test: /\.css$/,
      loader: "style-loader!css-loader"
    }]
  }
};
