import _ from 'lodash'
import numRef from './ref.json'

export function numToWord (num) {
  return _.reduce(
    numRef,
    (accumulator, ref) => {
      return ref.num === num ? ref.word : accumulator
    },
    ''
  )
}

export function wordToNum (word) {
  return _.reduce(
    numRef,
    (accumulator, ref) => {
      return ref.word === word && word.toLowerCase() ? ref.num : accumulator
    },
    -1
  )
}
// upper code build result is  72K    ./dist/webpack-numbers.js


// import reduce from 'lodash/reduce'
// import numRef from './ref.json'

// export function numToWord (num) {
//   return reduce(
//     numRef,
//     (accumulator, ref) => {
//       return ref.num === num ? ref.word : accumulator
//     },
//     ''
//   )
// }

// export function wordToNum (word) {
//   return reduce(
//     numRef,
//     (accumulator, ref) => {
//       return ref.word === word && word.toLowerCase() ? ref.num : accumulator
//     },
//     -1
//   )
// }
// du -sh ./dist/webpack-numbers.js
// 20K    ./dist/webpack-numbers.js