float top= 0;

void setup(){
  size(400, 400, P3D);
  
  //上下の頂点の計算。
  top = 50*sqrt(2);
}


void draw(){
  background(255);
  
  //原点を中心に、マウスで視点の位置を変えられるように。
  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  
  //正八面体, 一辺を100としてみる。
  fill(255, 190, 0);
  beginShape();
  vertex(0, 0, -top);
  vertex(50, 50, 0);
  vertex(50, -50, 0);
  vertex(0, 0, -top);
  endShape();
  
  beginShape();
  vertex(0, 0, -top);
  vertex(50, -50, 0);
  vertex(-50, -50, 0);
  vertex(0, 0, -top);
  endShape();
  
  beginShape();
  vertex(0, 0, -top);
  vertex(-50, -50, 0);
  vertex(-50, 50, 0);
  vertex(0, 0, -top);
  endShape();
  
  beginShape();
  vertex(0, 0, -top);
  vertex(-50, 50, 0);
  vertex(50, 50, 0);
  vertex(0, 0, -top);
  endShape();
  
  //--------------------------
  beginShape();
  vertex(0, 0, top);
  vertex(50, 50, 0);
  vertex(50, -50, 0);
  vertex(0, 0, top);
  endShape();
  
  beginShape();
  vertex(0, 0, top);
  vertex(50, -50, 0);
  vertex(-50, -50, 0);
  vertex(0, 0, top);
  endShape();
  
  beginShape();
  vertex(0, 0, top);
  vertex(-50, -50, 0);
  vertex(-50, 50, 0);
  vertex(0, 0, top);
  endShape();
  
  beginShape();
  vertex(0, 0, top);
  vertex(-50, 50, 0);
  vertex(50, 50, 0);
  vertex(0, 0, top);
  endShape();
  
}