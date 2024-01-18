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
    filename: 'js/[name].js',
    path: path.resolve(__dirname, 'dist'),
    clean: true,
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
        test: /\.(obj|glb)$/i,
        use: {
          loader: 'file-loader',
          options: {
            outputPath: 'assets/models'
          }
        },
        generator: {
          filename: "[name].[ext]"
        }
      }
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