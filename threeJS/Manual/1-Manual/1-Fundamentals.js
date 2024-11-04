import * as THREE from '../build/three.module.js'


function main () {
  const canvas = document.querySelector('#canvas-1-1')
  console.log(canvas)

  const field_of_view = 75, aspect = 2, near = 0.1, far = 5
  const camera = new THREE.PerspectiveCamera(field_of_view, aspect, near, far)

  camera.position.z = 2
}

main()