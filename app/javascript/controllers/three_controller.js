// app/javascript/controllers/three_controller.js
import * as THREE from 'three';

export default class extends ApplicationController {
  static targets = ['canvas'];

  connect() {
    this.scene = new THREE.Scene();

    this.camera = new THREE.PerspectiveCamera(
      75,
      this.canvas.width / this.canvas.height,
      0.1,
      1000
    );
    this.camera.position.z = 5;

    this.renderer = new THREE.WebGLRenderer({
      canvas: this.canvas,
      antialias: true,
    });
    this.renderer.setSize(this.canvas.width, this.canvas.height);

    const geometry = new THREE.BoxGeometry(1, 1, 1);
    const material = new THREE.MeshStandardMaterial({ color: 0x00ff00 });
    this.cube = new THREE.Mesh(geometry, material);
    this.scene.add(this.cube);

    this.light = new THREE.DirectionalLight(0xffffff, 1);
    this.light.position.set(0, 1, 1);
    this.scene.add(this.light);

    this.animate();
  }

  animate() {
    requestAnimationFrame(this.animate.bind(this));

    this.cube.rotation.x += 0.01;
    this.cube.rotation.y += 0.01;

    this.renderer.render(this.scene, this.camera);
  }

  get canvas() {
    return this.canvasTarget;
  }
}
