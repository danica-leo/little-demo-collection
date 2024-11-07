import * as THREE from 'three'

function main () {
  // 初始化场景、相机和渲染器
  const scene = new THREE.Scene()
  const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
  camera.position.z = 5

  const canvas = document.querySelector('#canvas-0-1')
  const renderer = new THREE.WebGLRenderer({ antialias: true, canvas })
  renderer.setSize(window.innerWidth, window.innerHeight)
  document.body.appendChild(renderer.domElement)

  // 创建一条线段
  const points = [
    new THREE.Vector3(-1, 0, 0),
    new THREE.Vector3(1, 0, 0)
  ]
  const geometry = new THREE.BufferGeometry().setFromPoints(points)
  const material = new THREE.LineBasicMaterial({ color: 0x0000ff })
  const line = new THREE.Line(geometry, material)
  scene.add(line)

  // 创建一个圆点
  const circleGeometry = new THREE.CircleGeometry(0.05, 32) // 半径0.05的圆点
  const circleMaterial = new THREE.MeshBasicMaterial({ color: 0xff0000 })
  const circle = new THREE.Mesh(circleGeometry, circleMaterial)
  scene.add(circle)

  // 创建动画混合器
  const mixer = new THREE.AnimationMixer(line)
  const mixer2 = new THREE.AnimationMixer(circle)

  // 定义颜色关键帧
  const times = [0, 1, 2, 3] // 时间点，以秒为单位
  const colors = [
    Math.random(), Math.random(), Math.random(), // 初始颜色
    Math.random(), Math.random(), Math.random(), // 1秒时的颜色
    Math.random(), Math.random(), Math.random(), // 2秒时的颜色
    Math.random(), Math.random(), Math.random()  // 3秒时的颜色
  ]

  // 创建颜色关键帧轨迹
  const colorTrack = new THREE.ColorKeyframeTrack('.material.color', times, colors)

  // 使用line的坐标点定义圆点位置动画轨迹
  const timesPosition = [0, 1, 2] // 定义巡回的时间点（0秒、1秒、2秒）
  const positions = [
    points[0].x, points[0].y, points[0].z, // 起点位置
    points[1].x, points[1].y, points[1].z, // 终点位置
    points[1].x, points[1].y, points[1].z, // 停留在终点
  ]
  const positionTrack = new THREE.VectorKeyframeTrack('.position', timesPosition, positions)




  // 创建动画片段，并设置为循环播放
  const clip = new THREE.AnimationClip('colorChange', -1, [colorTrack])
  const action = mixer.clipAction(clip)
  action.play()

  const clip2 = new THREE.AnimationClip('lineAnimation', -1, [positionTrack])
  const action2 = mixer2.clipAction(clip2)
  // action2.loop = THREE.LoopPingPong
  action2.play()

  // 渲染循环
  const clock = new THREE.Clock()
  function animate () {
    requestAnimationFrame(animate)

    const delta = clock.getDelta()
    mixer.update(delta) // 更新动画
    mixer2.update(delta) // 更新动画

    renderer.render(scene, camera)
  }
  animate()
}
main()