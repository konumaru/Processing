import SimpleOpenNI.*;
SimpleOpenNI kinect;

void setup(){
  size(640, 480);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}

void draw(){
  kinect.update();
  PImage depth = kinect.depthImage();
  image(depth, 0, 0);
}

void mousePressed(){
  //1ピクセルごとに値を全て取得して保存している。1列に並ぶ箱の中に詰めるように。
  //今回は640*480個の配列になっている。
  int [] depthValues = kinect.depthMap();
  //だからこんな計算をしてる。
  int clickPosition = mouseX+(mouseY*640);
  int clickedDepth = depthValues[clickPosition];
  
  float inches = clickedDepth/25.4;
  
  println("inches:"+inches);
}

