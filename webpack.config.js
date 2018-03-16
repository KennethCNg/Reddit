var path = require('path');
var webpack = require("webpack");

module.exports = {
    context: __dirname,
    entry: './frontend/reddit.jsx',
    output: {
      path: path.resolve(__dirname),
      filename: './app/assets/javascripts/bundle.js',
    },
    // plugins: plugins, comment back in if using for production
    module: {
      loaders: [
        {
          test: [/\.jsx?$/],
          exclude: /(node_modules)/,
          loader: 'babel-loader',
          query: {
            presets: ['es2015', 'react']
          }
        }
      ]
    },
    devtool: 'source-map',
    resolve: {
      extensions: ['.js', '.jsx', '*']
    }
  };