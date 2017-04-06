PImage img1;
PImage img2;
PImage result;

void setup(){
  size(250, 250);
  img1 = loadImage("lena.jpg");
  img2 = loadImage("pattots.jpg");
  img1.width = img2.width = width;
  img1.height = img2.height = height;
  result = createImage(width, height, ARGB);
}


void draw(){
  AlphaBlend(img1, img2, result, 0.5);
}


void AlphaBlend(PImage src1, PImage src2, PImage dst, float alpha){
  //アルファレンダリングの処理
  for(int i=0; i<width; i++){
    for (int j=0; j<height; j++){
      //元画像の色を得る
      color c1 = src1.get(i, j);
      color c2 = src2.get(i, j);
      //合成する値を計算
      int mixR = int( alpha*red(c1) + (1-alpha)*red(c2) );
      int mixG = int( alpha*green(c1) + (1-alpha)*green(c2) );
      int mixB = int( alpha*blue(c1) + (1-alpha)*blue(c2) );
      dst.set(i, j, color(mixR, mixG, mixB));
    }
  }
  dst.updatePixels();
  image(dst, 0, 0);
  save("result.jpg");
}