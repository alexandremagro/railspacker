// Add dependencies
// 
// `yarn add webpack clean-webpack-plugin webpack-manifest-plugin`

const path               = require('path');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const ManifestPlugin     = require('webpack-manifest-plugin');
const webpack            = require('webpack');

module.exports = (env) => {
  const config = {};
  const outputPath = (env == 'test') ? 'public/packs-test' : 'public/packs';

  config.entry = {
    app: './app/webpack/index.js'
  };

  config.plugins = [
    // Generate a manifest.json to output. Is requred to Railspacker.
    new ManifestPlugin(),

    // Clean output directory before builds
    new CleanWebpackPlugin([outputPath]),
  ];

  config.output = {
    filename: '[name].js',
    path: path.resolve(__dirname, outputPath)
  };

  // development environment
  if (env == 'development') {
    config.mode = 'development'
    config.devtool = 'inline-source-map'

    // This set of options is picked up by webpack-dev-server
    config.devServer = {
      contentBase: path.resolve(__dirname, 'app/webpack'),
      port: 3001,
      hot: true,
      headers: {
        "Access-Control-Allow-Origin": "*"
      }
    }

    config.plugins = config.plugins.concat([
      // Enables Hot Module Replacement, otherwise known as HMR.
      new webpack.HotModuleReplacementPlugin()
    ])

    config.output.publicPath = 'http://localhost:3001/'
  };

  // test environment
  if (env === 'test') {
    config.mode = 'development'
    config.devtool = 'inline-source-map'
    config.output.publicPath = 'packs-test/'
  };

  // production environment
  if (env === 'production') {
    config.mode = 'production'
    config.output.publicPath = 'packs/'
  };

  return config;
};
