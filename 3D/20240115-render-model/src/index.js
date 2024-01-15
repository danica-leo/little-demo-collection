import * as THREE from 'three'
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js'
import ringModel from '@/assets/alliance_white_gold_ring.obj'

const scene = new THREE.Scene()
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.0001, 1000)
const renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
document.body.appendChild(renderer.domElement)

// function renderCubeDemo () {
//   const geometry = new THREE.BoxGeometry(1, 1, 1)
//   const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 })
//   const cube = new THREE.Mesh(geometry, material)
//   scene.add(cube)
//   console.log(cube)

//   camera.position.z = 5

//   function animate () {
//     requestAnimationFrame(animate)
//     cube.rotation.x += 0.01
//     cube.rotation.y += 0.01
//     // cube.rotation.x += 0.01;
//     renderer.render(scene, camera)
//   }
//   animate()
// }
// renderCubeDemo()

function renderRing () {
  let ring = undefined
  const loader = new OBJLoader()
  loader.load(
    ringModel,
    (object) => {
      console.log(object)
      scene.add(object)

      camera.position.z = 3
      

      // 添加环境光
      const ambientLight = new THREE.AmbientLight(0xffffff, 0.7)
      scene.add(ambientLight)

      const pointLight = new THREE.PointLight(0xffffff, 500)
      pointLight.position.set(0, 0, 0)
      scene.add(pointLight)
      // 启用阴影
      renderer.shadowMap.enabled = true

      // 为模型和光源设置阴影
      // mesh.castShadow = true
      pointLight.castShadow = true
      function animate () {
        requestAnimationFrame(animate)
        object.rotation.y += 0.01
      
        // object.rotation.y += 0.01
        // cube.rotation.x += 0.01;
        renderer.render(scene, camera)
      }
      animate()
    },
    function (xhr) {
      console.log("onProgress", xhr)
    },
    function (error) {
      console.log("onError", error)
    }
  )

}
renderRing()

window.addEventListener('resize', () => {
  camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()
  renderer.setSize(window.innerWidth, window.innerHeight)
})