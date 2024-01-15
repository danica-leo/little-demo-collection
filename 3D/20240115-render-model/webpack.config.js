const path = require('path')
const HTMLWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  mode: 'none',
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
    clean: true
  },
  plugins: [
    new HTMLWebpackPlugin({
      title: "3D render Practice"
    })
  ],
  devServer: {
    static: './dist'
  }
}