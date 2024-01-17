const path = require('path')

module.exports = (env) => {
  console.log("env", env)
  return {
    mode: "none",
    entry: "./src/index.js",
    output: {
      path: path.resolve(__dirname, 'dist'),
      filename: 'webpack-numbers.js',
      library: {
        // https://docs.npmjs.com/creating-and-publishing-private-packages
        name: 'webpackNumbers',
        type: 'umd',
      },
      clean: true
    },
    externals: {
      lodash: {
        commonjs: 'lodash',
        commonjs2: 'lodash',
        amd: 'lodash',
        root: '_'
      }
    }
  }
}

