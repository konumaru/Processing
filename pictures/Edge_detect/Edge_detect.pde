PImage img;

void setup(){
  size(256, 256);
  img = loadImage("image.jpg");
}


void draw(){
  grayScale(img);
}

void grayScale(PImage img){
  loadPixels();
}