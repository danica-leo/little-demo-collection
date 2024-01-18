const path = require('path')
const HTMLWebpackPlugin = require('html-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
module.exports = {
  mode: 'none',
  entry: {
    three: "three",
    main: {
      dependOn: 'three',
      import: './src/index.js'
    },
    pageRing: {
      dependOn: 'three',
      import: "./src/pageRing.js"
    }
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'dist'),
    clean: true,
    wasmLoading: 'async-node',
  },
  plugins: [
    new HTMLWebpackPlugin({
      title: "3D render - main",
      chunks: ['main', 'three'],
      filename: 'main.html'
    }),
    new HTMLWebpackPlugin({
      title: "3D render - ring",
      chunks: ['pageRing', 'three'],
      filename: 'pageRing.html'
    }),
    new CopyWebpackPlugin({
      patterns: [
        {
          from: `${path.dirname(
            require.resolve(`three/examples/jsm/libs/draco/gltf/draco_decoder.js`)
          )}`,
          to: 'assets/draco/gltf'
        },
      ],
    }),
  ],
  module: {
    rules: [
      {
        test: /\.obj/i,
        use: 'file-loader',
        generator: {
          filename: "assets/models/[name].[contenthash:6][ext]"
        }
      },
      {
        test: /\.glb/i,
        use: 'file-loader'
      },
    ],
  },
  devServer: {
    static: './dist'
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src')
    }
  },
  experiments: {
    asyncWebAssembly: true,
  }
}