module.exports = class ChunkLoggerPlugin {
  constructor(options) {
    this.options = options || {}
  }
  apply (compiler) {
    compiler.hooks.done.tap("bundleSizePlugin", function (stats) {
      const path = require('path')
      const ui = require('cliui')({ width: process.stdout.columns || 80 })
      const chalk = require('chalk')
      const fs = require('fs')
      const zlib = require('zlib')
      const absolutePath = compiler.options.output.path
      const dir = path.relative(__dirname, absolutePath)
      const json = stats.toJson({
        hash: false,
        modules: false,
        chunks: false
      })

      let assets = json.assets || json.children.reduce((acc, child) => acc.concat(child.assets), [])

      function makeRow (a, b, c) {
        return `  ${a}\t    ${b}\t ${c}`
      }
      function formatSize (size) {
        return (size / 1024).toFixed(2) + ' KiB'
      }

      function deDuplicate (assets) {
        const extsSeen = {}
        assets.map((a) => {
          a.name = a.name.split('?')[0]
          a.ext = /\.([^.]+)$/.exec(a.name)?.pop()
          return a
        }).filter(a => {
          const { ext, name } = a
          const extSeen = extsSeen[ext] || (extsSeen[ext] = new Map())
          if (extSeen.has(name)) {
            return false
          }
          extSeen.set(name, a)
          return true
        })
        const result = []
        function getArrayByMap (m) {
          return [...m]
            .map(([key, value]) => value)
            .sort((a, b) => b.size - a.size)
        }
        const sortKey = ['js', 'css', 'html']
        sortKey.forEach(key => {
          if (extsSeen[key]) {
            result.push(...getArrayByMap(extsSeen[key]))
            delete extsSeen[key]
          }
        })
        for (const [ext, m] of Object.entries(extsSeen)) {
          result.push(...getArrayByMap(m))
        }
        return result
      }
      assets = deDuplicate(assets)

      function getFileTypeColor (ext) {
        switch (ext) {
          case 'js':
            return "yellow"
          case 'css':
            return "blue"
          case 'html':
            return "green"
          case "jpg":
          case "jpeg":
          case "png":
          case "gif":
          case "svg":
            return "cyan"
          default:
            return "white"
        }
      }

      function getGzippedSize (asset) {
        const filepath = path.join(absolutePath, asset.name)
        const buffer = fs.readFileSync(filepath)
        return formatSize(zlib.gzipSync(buffer).length)
      }

      ui.div(
        makeRow(
          chalk.cyan.bold('File'),
          chalk.cyan.bold('Size'),
          chalk.cyan.bold('Gzipped'))
        + '\n\n'
        + assets.map(a => {
          const name = path.join(dir, a.name)
          return makeRow(
            chalk[getFileTypeColor(a.ext)](name),
            formatSize(a.size),
            getGzippedSize(a)
          )
        }).join('\n')
      )


      console.log(ui.toString())
    })
  }
}

