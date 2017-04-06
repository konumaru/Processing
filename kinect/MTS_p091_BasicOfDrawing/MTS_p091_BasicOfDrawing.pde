import SimpleOpenNI.*;
SimpleOpenNI kinect;

//インビジブル・ペンシル

int closestValue, closestX, closestY;
//直前のXY座標を表す関数
int previousX, previousY;

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
      int i = x+y*640;
      int currentDepthValue = depthValues[i];
      
      //判定
      if (currentDepthValue>0 && currentDepthValue<closestValue){
        closestValue = currentDepthValue;
        closestX = x;
        closestY = y;
      }
    }
  }
  
  //毎回、赤い線を上書きしてしまっている
  //image(kinect.depthImage(), 0, 0);
  
  //strokeWeight(5);
  stroke(255, 0, 0);
  line(previousX, previousY, closestX, closestY);
  
  //現在の最も近い点を新たな最も近い点として保存
  previousX = closestX;
  previousY = closestY;
}

void mousePressed(){
  background(0);
}
