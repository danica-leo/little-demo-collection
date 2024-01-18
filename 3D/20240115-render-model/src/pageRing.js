import * as THREE from 'three'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js'
import { DRACOLoader } from 'three/addons/loaders/DRACOLoader.js'
import ringCluster from '@/assets/ring_cluster.glb'


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
renderRingCluster()
