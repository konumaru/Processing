import SimpleOpenNI.*;
SimpleOpenNI kinect;

void setup(){
  size(640*2, 480);
  kinect = new SimpleOpenNI(this);
  
  kinect.enableDepth();
  kinect.enableRGB();
}

void draw(){
  kinect.update();
  
  PImage depth = kinect.depthImage();
  PImage rgb = kinect.rgbImage();
  
  image(depth, 0, 0);
  image(rgb, width/2, 0);
}

void mousePressed(){
  color c = get(mouseX, mouseY);
  println("r: "+red(c) + " /g: "+green(c) + " /b+"+blue(c));
}

