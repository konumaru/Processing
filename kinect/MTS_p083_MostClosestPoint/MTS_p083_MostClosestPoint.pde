//最も近いピクセルを見つける。
///前回のように距離を求めるのだが、それを全て比べて最小値を最も近いピクセルとする。

import SimpleOpenNI.*;
SimpleOpenNI kinect;

int closestValue;
int closestX, closestY;

void setup(){
  size(640, 480);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}

void draw(){
  closestValue = 8000;
  kinect.update();
  
  //kinectから距離配列を取り込む
  int [] depthValues = kinect.depthMap();
  
  //距離画像の列ごと
  for (int y=0; y<480; y++){
    for (int x=0; x<640; x++){
      int i = x + y*640;
      int currentDepthValue = depthValues[i];
      
      //そのピクセルが今まで見た中で最も近いものであれば
      if (currentDepthValue < closestValue && currentDepthValue>0){
        closestValue = currentDepthValue;
        closestX = x;
        closestY = y;
      }
    }
  }
  
  //距離画像を表示
  image(kinect.depthImage(), 0, 0);
  
  //その上の
  //保存した最も近いピクセルのXY座標の位置に
  //赤い円を描く
  fill(255, 0, 0);
  ellipse(closestX, closestY, 25, 25);
  
}
