import processing.opengl.*;
import SimpleOpenNI.*;

SimpleOpenNI kinect;

//現在の回転角度を保存する変数。単位は度
float rotation = 0;

void setup(){
  size(1024, 768, OPENGL);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}

void draw(){
  background(0);
  kinect.update();
  
  //XY軸方向の中央に、Z軸方向には1000ピクセル
  //近づいた位置に描画するよう準備する
  translate(width/2, height/2, -1000);
  //ポイントクラウドの上下を反転
  rotateX(radians(180));
  //Y軸の周りに回転し、回転速度を増加
  ///これを止めれば回転しない！
  rotateY(radians(rotation));
  rotation++;
  
  //回転の中心をポイントクラウドの内部へ移動
  //(kinectから約1Mの位置を中心にポイントクラウドを回転させる)
  //translate(0, 0, -1000);
  float mouseRotation = map(mouseX, 0, width, -180, 180);
  rotateY(radians(mouseRotation));
  stroke(255);
  
  PVector [] depthPoints = kinect.depthMapRealWorld();
  
  //「i+=10」に注意
  //高速に表示を行うため、10個に1個の割合で描画している
  for (int i=0; i<depthPoints.length; i+=10){
    PVector currentPoint = depthPoints[i];
    point(currentPoint.x, currentPoint.y, currentPoint.z);
  }
}
