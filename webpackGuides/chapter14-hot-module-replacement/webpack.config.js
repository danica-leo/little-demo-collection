const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const webpack = require("webpack")
const webpackDevServer = require("webpack-dev-server")
const config = {
  mode: "development",
  entry: {
    index: './src/index.js',
    hot: "webpack/hot/dev-server.js",
    client: "webpack-dev-server/client/index.js?hot=true&live-reload=true"
  },
  output: {
    filename: "[name].bundle.js",
    path: path.resolve(__dirname, 'dist'),
    clean: true
  },
  devtool: "inline-source-map",
  // devServer: {
  //   static: './dist',
  //   hot: false,
  //   client: false
  // },
  optimization: {
    runtimeChunk: "single"
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: "Development"
    }),
    new webpack.HotModuleReplacementPlugin()
  ]
}

const complier = webpack(config)

const server = new webpackDevServer({
  hot: false,
  client: false
}, complier);


(async () => {
  await server.start()
  console.log('dev server is starting')
})()