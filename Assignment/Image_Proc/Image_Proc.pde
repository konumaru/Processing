//Image Proc
///ある意味classらしい。
PImage img;
void setup() {
  img = loadImage("Apple.jpg");
  size ( img.width*4, img.height*2);
  //1-1
  image ( img, 0, 0);
  //1-2
  img = loadImage("Apple.jpg");
  img.filter ( THRESHOLD );
  image ( img, img.width, 0);
  //1-3
  img = loadImage("Apple.jpg");
  img.filter ( BLUR, 5 );
  image ( img, img.width*2, 0);
  //1-4
  img = loadImage("Apple.jpg");
  img.filter ( INVERT );
  image ( img, img.width*3, 0);
  //2-1
  img = loadImage("Apple.jpg");
  img.filter ( GRAY );
  image ( img, 0, img.height);
  //2-2
  img = loadImage("Apple.jpg");
  img.filter ( ERODE );
  image ( img, img.width, img.height);
  //2-3
  img = loadImage("Apple.jpg");
  img.filter ( DILATE );
  image ( img, img.width*2, img.height);
  //2-4
  img = loadImage("Apple.jpg");
  img.filter ( POSTERIZE, 100 );
  image ( img, img.width*3, img.height);
}

