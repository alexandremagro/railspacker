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
    // Generate a manifest.json to output. Is requred to Railspack.
    new ManifestPlugin(),

    // Clean output directory before builds
    new CleanWebpackPlugin([outputPath]),

    // Enables Hot Module Replacement, otherwise known as HMR.
    new webpack.HotModuleReplacementPlugin()
  ];
  config.output = {
    filename: '[name].js',
    path: path.resolve(__dirname, outputPath)
  };

  if (env === 'development' || env === 'test') {
    config.mode = 'development'
    config.devtool = 'inline-source-map'
    config.devServer = {
      contentBase: path.resolve(__dirname, 'app/webpack'),
      port: 3001,
      hot: true
    }
  };

  if (env === 'production') {
    config.mode = 'production'
  };

  return config;
};
