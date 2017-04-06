class star extends Object {
  void display() {
    int vertex_num = 5*2; //頂点数(星を描画、とげの数*2)
    int R; //頂点から中心までの距離(半径)
    int R_out = 20; //中心からとげまでの距離(半径)
    int R_in = R_out/2; //中心から谷までの距離(半径)
    pushMatrix();
    fill(255, 255, 0);
    translate(x, y);
    beginShape();
    for (int i = 0; i < vertex_num; i++) {
      if (i%2 == 0) {
        R = R_out;
      } else {
        R = R_in;
      }
      vertex(R*cos(radians(360*i/vertex_num)), R*sin(radians(360*i/vertex_num)));
    }
    endShape(CLOSE);
    popMatrix();
  }
}

