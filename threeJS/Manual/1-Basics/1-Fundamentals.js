import * as THREE from 'three'
import * as THREE from '../build/three.module.js'


function main () {
  const canvas = document.querySelector('#canvas-1-1')
  const renderer = new THREE.WebGLRenderer({ antialias: true, canvas })
  console.log(canvas)

  const field_of_view = 75, aspect = 2, near = 0.1, far = 5
  const camera = new THREE.PerspectiveCamera(field_of_view, aspect, near, far)

  camera.position.z = 2

  const scene = new THREE.Scene()

  const boxWidth = 1, boxHeight = 1, boxDepth = 1
  const geometry = new THREE.BoxGeometry(boxWidth, boxHeight, boxDepth)

  // const material = new THREE.MeshBasicMaterial({color: 0x44aa88})
  // const material = new THREE.MeshPhongMaterial({ color: 0x44aa88 })

  // const cube = new THREE.Mesh(geometry, material)
  // scene.add(cube)

  const color = 0xFFFFFF
  const intensity = 3
  const light = new THREE.DirectionalLight(color, intensity)
  light.position.set(-1, 2, 4)
  scene.add(light)



  function makeInstance (geometry, color, x) {
    const material = new THREE.MeshPhongMaterial({ color })
    const cube = new THREE.Mesh(geometry, material)

    scene.add(cube)
    cube.position.x = x

    return cube
  }

  const cubes = [
    makeInstance(geometry, 0x44aa88, 0),
    makeInstance(geometry, 0x8844aa, -2),
    makeInstance(geometry, 0xaa8844, 2)
  ]


  function render (time) {
    // console.log(time)
    // requestAnimationFrame 竟然有入参！！！
    time *= 0.001

    cubes.forEach((cube,ndx)=>{
      const speed = 1 + ndx * 0.1
      const rot = time * speed
      cube.rotation.x = rot
      cube.rotation.y = rot
    })


    renderer.render(scene, camera)
    requestAnimationFrame(render)
  }
  requestAnimationFrame(render)
}

main()