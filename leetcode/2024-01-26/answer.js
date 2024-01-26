//暂时没有正确答案

// 组合穷举

/**
 * @param {number} total
 * @param {number} cost1
 * @param {number} cost2
 * @return {number}
 */
var waysToBuyPensPencils = function (total, cost1, cost2) {
  const startTime = performance.now()


  if (cost1 === cost2) {
    const max = Math.floor(total / cost1)
    console.log("endTime", performance.now() - startTime)
    return max > 0 ? max * max : 1
  }

  //这样写算法复杂度似乎是m*n
  const results = []
  const max1 = Math.floor(total / cost1)


  for (let i = 0; i <= max1; i++) {
    const rest = total - i * cost1
    const max2 = Math.floor(rest / cost2)
    for (let j = 0; j <= max2; j++) {
      if (i * cost1 + j * cost2 <= total) {
        results.push([i, j])
      }
    }
  }
  console.log("endTime", performance.now() - startTime)
  return results.length
}

const tests = [
  [20, 10, 5, 9],
  [5, 10, 10, 1],
  [100, 1, 1, 5151]
  [1000000, 1, 1] //超出时间限制
]

tests.forEach((item) => {
  console.log(waysToBuyPensPencils(...item))
})