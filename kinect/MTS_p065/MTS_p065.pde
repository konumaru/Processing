import SimpleOpenNI.*;
SimpleOpenNI kinect;

void setup(){
  size(640*2, 480);
  kinect = new SimpleOpenNI(this);
  
  //距離画像
  kinect.enableDepth();
  //RGB画像
  kinect.enableRGB();
}

void draw(){
  kinect.update();
  
  PImage depth = kinect.depthImage();
  PImage rgb = kinect.rgbImage();
  
  image(depth, 0, 0);
  image(rgb, width/2, 0);
}
