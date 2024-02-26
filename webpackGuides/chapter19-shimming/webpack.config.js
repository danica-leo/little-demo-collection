const path = require('path')
const webpack = require('webpack')

module.exports = {
  mode: 'production',
  entry: "./src/index.js",
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  },
  plugins: [
    new webpack.ProvidePlugin({
      join: ['lodash', 'join']
    })
  ]
}