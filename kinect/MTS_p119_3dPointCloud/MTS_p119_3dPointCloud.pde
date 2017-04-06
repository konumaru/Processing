import SimpleOpenNI.*;
SimpleOpenNI kinect;

void setup() {
  size(1024, 768, P3D);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.mirror();
}

void draw() {
  background(0);
  kinect.update();

  //X軸とY軸方向を中央に、Z軸方向には1000ピクセル
  //近づいた位置に描画するよう準備する
  translate(width/2, height/2, -1000);
  rotateX(radians(180));//Y軸を「現実世界」から反転させる

  stroke(255);

  //距離データを3Dポイントとして取り入れる
  PVector [] depthPoints = kinect.depthMapRealWorld();
  for (int i=0; i<depthPoints.length; i++) {
    //ポイントの配列から現在のポイントを得る
    PVector currentPoint = depthPoints[i];
    //現在のポイントを描画
    point(currentPoint.x, currentPoint.y, currentPoint.z);
  }
}

