/**
* Binary Dot Camera
*
* @author aa_debdeb
* @date 2015/12/30
*/

import processing.video.*;

float radious = 8;

Capture camera;

void setup(){
  size(640, 480);
  camera = new Capture(this, width, height);
  camera.start();
}

void draw(){
  background(255);
  camera.loadPixels();
  fill(0);
  for(int x = 0; x < width; x += radious){
    for(int y = 0; y < height; y += radious){
      color c = camera.pixels[y * width + x];
      float gray = 0.30 * red(c) + 0.59 * green(c) + 0.11 * blue(c);
      if(gray <  map(mouseX, 0, width, 0, 255)){
        //fill(c);
        //noStroke();
        ellipse(radious / 2 + x, radious / 2 + y, radious * 0.8, radious * 0.8);
        //rect(x, y, radious, radious);
      }
    }
  }
}

void captureEvent(Capture camera){
  camera.read();
}