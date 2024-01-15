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
  module: {
    rules: [
      {
        test: /\.obj/i,
        use: 'file-loader',
        generator: {
          filename: "assets/models/[name].[contenthash:6][ext]"
        }
      }
    ],
  },
  devServer: {
    static: './dist'
  },
  resolve:{
    alias:{
      '@': path.resolve(__dirname, 'src')
    }
    
  }
}