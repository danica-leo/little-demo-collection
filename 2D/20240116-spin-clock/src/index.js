import * as PIXI from 'pixi.js'

const MARK_COUNT = 12
const CIRCLE_RADIUS = 200

// 创建Pixi应用
const app = new PIXI.Application({
  resizeTo: window,
  backgroundColor: 0xcccccc,
})
// app.stage.eventMode = "static"
// app.stage.on(
//   "pointerdown",
//   () => {
//     console.log("click")
//   }
// )
app.view.id = "test"

// 添加画布到HTML文档
document.body.appendChild(app.view)

const test = document.getElementById("test")
// 创建时钟表盘容器
const clockContainer = new PIXI.Container()
app.stage.addChild(clockContainer)


// 添加时钟背景
const clockBackground = new PIXI.Graphics()
clockBackground.beginFill(0xffffff)
clockBackground.drawCircle(0, 0, CIRCLE_RADIUS)
clockBackground.endFill()
clockContainer.addChild(clockBackground)

const clockNumbers = []

// 添加刻度和数字
for (let i = 1; i <= MARK_COUNT; i++) {
  //计算当前所在角度
  const angle = (i / MARK_COUNT) * Math.PI * 2

  //计算所在角度的坐标
  const x = CIRCLE_RADIUS * Math.sin(angle)
  const y = -CIRCLE_RADIUS * Math.cos(angle)

  //绘制刻度小圆圈
  const mark = new PIXI.Graphics()
  mark.beginFill(0x000000)
  mark.drawCircle(x, y, 10)
  mark.endFill()
  clockContainer.addChild(mark)

  //绘制合度数字
  const text = new PIXI.Text(i.toString(), {
    fontSize: 24,
    fill: 0x000000,
  })
  text.anchor.set(0.5)
  text.position.set(x * 1.5, y * 1.5)
  text.rotation = angle
  text.eventMode = 'static'
  text.on('pointerdown', () => {
    console.log(`Clicked on number ${i}`)
  })
  clockContainer.addChild(text)
  clockNumbers.push(text)
}

// 设置时钟容器的位置居中
// clockContainer.position.set(app.screen.width / 2, app.screen.height / 2);
// 设置时钟容器的位置居下
clockContainer.position.set(
  app.screen.width / 2,
  app.screen.height + CIRCLE_RADIUS * 4 * 0.9
)
clockContainer.scale.set(4)

// 设置时钟初始角度
let clockRotation = 0
// 监听左右滑动事件
let startX = 0

// 生成指数可以放大的的旋转范围
function generatePointRange () {
  const PI = Math.PI
  const range = []

  for (let i = MARK_COUNT - 1; i >= 0; i--) {
    const angle = (i / 12) * PI * 2
    const averageAngle = (PI / MARK_COUNT) * 0.5

    if (i === 0) {
      range.push([
        [2 * PI - averageAngle, 2 * PI],
        [0, averageAngle],
      ])
    } else {
      range.push([angle - averageAngle, angle + averageAngle])
    }
  }
  return range
}
const pointerZoomRange = generatePointRange()
function isInRange (number, range) {
  return number >= range[0] && number <= range[1]
}

function handleMoveStart (event) {
  startX = event.touches[0].clientX || event.clientX
}
function handleMove (event) {
  const currentX = event.touches[0].clientX || event.clientX
  const deltaX = currentX - startX
  //控制拖移灵敏度
  clockRotation += deltaX * 0.01

  // 限制旋转在0到2π之间
  clockRotation = (clockRotation + Math.PI * 4) % (Math.PI * 2)

  // 更新整个表盘的旋转角度
  clockContainer.rotation = clockRotation

  // 更新刻度数字的大小
  const zoomIndex = pointerZoomRange.findIndex((average) => {
    if (typeof average[0] === 'number') {
      return isInRange(clockRotation, average)
    } else if (Array.isArray(average[0])) {
      return (
        isInRange(clockRotation, average[0]) ||
        isInRange(clockRotation, average[1])
      )
    }
  })

  // TODO 为放大的数字添加投影
  clockNumbers.forEach((text, index) => {
    // 判断是否旋转到应该放大的范围
    if (index === zoomIndex) {
      text.scale.set(3)
    } else {
      // 恢复初始大小
      text.scale.set(1)
    }
  })
  startX = currentX
}

test.addEventListener('touchstart', handleMoveStart)
test.addEventListener('touchmove', handleMove)
test.addEventListener('touchup', handleMove)
// window.addEventListener('touchstart', handleMoveStart)
// window.addEventListener('touchmove', handleMove)
// 渲染场景
app.ticker.add(() => {
  app.renderer.render(app.stage)
})