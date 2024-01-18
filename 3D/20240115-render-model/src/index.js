import * as THREE from 'three'
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js'
import { DRACOLoader } from 'three/addons/loaders/DRACOLoader.js'
import ringModel from '@/assets/alliance_white_gold_ring.obj'
import ringCluster from '@/assets/ring_cluster.glb'
import cameraCanon from '@/assets/camera_canon.glb'

const scene = new THREE.Scene()
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.0001, 1000)
const renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
document.body.appendChild(renderer.domElement)

window.addEventListener('resize', () => {
  camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()
  renderer.setSize(window.innerWidth, window.innerHeight)
})

function renderCubeDemo () {
  const geometry = new THREE.BoxGeometry(1, 1, 1)
  const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 })
  const cube = new THREE.Mesh(geometry, material)
  scene.add(cube)
  console.log(cube)

  camera.position.z = 5

  function animate () {
    requestAnimationFrame(animate)
    cube.rotation.x += 0.01
    cube.rotation.y += 0.01
    // cube.rotation.x += 0.01;
    renderer.render(scene, camera)
  }
  animate()
}
// renderCubeDemo()

function renderRing () {
  const loader = new OBJLoader()
  loader.load(
    ringModel,
    (object) => {
      scene.add(object)
      camera.position.z = 3

      // 添加环境光
      const ambientLight = new THREE.AmbientLight(0xffffff, 0.7)
      scene.add(ambientLight)

      // 添加点光源
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
        renderer.render(scene, camera)
      }
      animate()
    }
  )
}
// renderRing()


function renderRingCluster () {
  const dracoLoader = new DRACOLoader()
  dracoLoader.setDecoderPath('/assets/draco/gltf/')
  const loader = new GLTFLoader()
  loader.setDRACOLoader(dracoLoader)
  loader.load(
    ringCluster,
    (object) => {
      const model = object.scene
      scene.add(model)
      camera.position.z = 3

      // 添加环境光
      const ambientLight = new THREE.AmbientLight(0xffffff, 0.7)
      scene.add(ambientLight)

      renderer.shadowMap.enabled = true

      // 为模型和光源设置阴影
      model.castShadow = true

      function animate () {
        requestAnimationFrame(animate)
        model.rotation.z += 0.001
        renderer.render(scene, camera)
      }
      animate()
    }
  )
}
// renderRingCluster()

function renderCanon () {
  const dracoLoader = new DRACOLoader()
  dracoLoader.setDecoderPath('/assets/draco/gltf/')
  const loader = new GLTFLoader()
  loader.setDRACOLoader(dracoLoader)
  loader.load(
    cameraCanon,
    (object) => {
      const model = object.scene
      scene.add(model)

      //设置相机距离物体的位置
      camera.position.z = 3
      // 添加环境光
      const ambientLight = new THREE.AmbientLight(0xffffff, 100)
      scene.add(ambientLight)

      function animate () {
        requestAnimationFrame(animate)
        model.rotation.z += 0.001
        model.rotation.y += 0.001
        model.rotation.x += 0.001
        renderer.render(scene, camera)
      }
      animate()
    }
  )
}
renderCanon()

