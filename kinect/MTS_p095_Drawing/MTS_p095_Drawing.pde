import SimpleOpenNI.*;
SimpleOpenNI kinect;

//インビジブル・ペンシル

int closestValue, closestX, closestY;
//直前のXY座標を表す関数
float lastX, lastY;

void setup(){
  size(640, 480);
  background(0);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}

void draw(){
  closestValue = 8000;
  kinect.update();
  
  int [] depthValues = kinect.depthMap();
  
  for (int y=0; y<height; y++){
    for (int x=0; x<width; x++){
      
      //画像の右側から始めることによってX軸を反転 ← これくらいメッソドありそう
      ///きっと「deothImage」は反転してないから表示したら気持ち悪い
      int reversedX = 640-x-1;
      
      //reversedXを使って配列のインデックスを求める
      int i = reversedX+y*640;
      int currentDepthValue = depthValues[i];
      
      //判定
      ///610(2フィート)よりも大きく、1525(5フィート)よりも小さい範囲
      if (currentDepthValue>610 && currentDepthValue<1525 && currentDepthValue<closestValue){
        closestValue = currentDepthValue;
        closestX = x;
        closestY = y;
      }
    }
  }
  
  //毎回、赤い線を上書きしてしまっている
  //image(kinect.depthImage(), 0, 0);

  //「線形補間」すなわち最後の点と新たな最も近い点を平滑化
  float interpolatedX = lerp(lastX, closestX, 0.3f);
  float interpolatedY = lerp(lastY, closestY, 0.3f);
  
  stroke(255, 0, 0);
  strokeWeight(3);
  
  //描画
  line(lastX, lastY, interpolatedX, interpolatedY);
  lastX = interpolatedX;
  lastY = interpolatedY;
}

void mousePressed(){
  //save("drawing.png");
  background(0);
}
