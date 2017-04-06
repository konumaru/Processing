PImage imgIn, imgOut;

void setup(){
  size(250, 250);
  
  imgIn = loadImage("cat.jpg");
  imgIn.resize(width, height);
  
  imgOut = new PImage(imgIn.width, imgIn.height);
}


void draw(){
  posterizataion(imgIn, imgOut);
}


void posterizataion(PImage src_image, PImage dst){
  // ポスタリゼーションの処理
  for (int i=0; i<width; i++){
    for (int j=0; j<height; j++){
      color c = src_image.get(i, j);
      int gray = (int)(0.299*red(c) + 0.587*green(c) + 0.114*blue(c));
      if (0<=gray && gray<40) gray = 0;
      else if (40<=gray && gray<90) gray = 50;
      else if (90<=gray && gray<150) gray = 110;
      else if (150<=gray && gray<210) gray = 170;
      else if (210<=gray && gray<=255) gray = 255;
      dst.set(i, j, color(gray, gray, gray));
    }
  }
  dst.updatePixels();
  image(dst, 0, 0);
  save("result.jpg");
}