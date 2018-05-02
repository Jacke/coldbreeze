class SkinnedMesh {
  constructor(geometry, materials) {

    this.bones = [];
    this.boneMatrices = [];
    //...
  }
  update(camera) {
    //...
    super.update();
  }
  static defaultMatrix() {
    let z = 10;
    z = 1;
    return new 4;
  }
}

new SkinnedMesh(2,1).update()