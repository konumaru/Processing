PImage imgIn;
PImage imgOut;

void setup() {
  size(512, 256);
  imgIn = loadImage("Parrots.jpg");
  image(imgIn, 0, 0);
  imgOut = new PImage(imgIn.width, imgIn.height);
}


void draw() {
  sobelFilter(imgIn, imgOut);
  image(imgOut, 256, 0);
}


void sobelFilter(PImage imgSrc, PImage imgDst) {
  //フィルターの重み付け
  float [][] Fx = { 
    {-1, 0, 1}, 
    {-2, 0, 2}, 
    {-1, 0, 1}};
  float [][] Fy = { 
    {1, 2, 1}, 
    {0, 0, 0}, 
    {-1, -2, -1}};
  //元画像の色の情報を保存
  color [][] c = new color [imgSrc.width][imgSrc.height];
  imgSrc.loadPixels();
  for (int i=0; i<imgSrc.width; i++) {
    for (int j=0; j<imgSrc.height; j++) {
      c[i][j] = imgSrc.pixels[i + j*imgSrc.width];
    }
  }

  //３色のエッジ検出をする
  for (int x=0; x<imgDst.width; x++) {
    for  (int y=0; y<imgDst.height; y++) {
      if ( x==0 || x==imgDst.width-1 || y==0 || y==imgDst.height-1 ) {
        imgDst.set(x, y, color(0, 0, 0));
      } else {
        float vgR = 
          Fx[0][0]*red(c[x-1][y-1]) + Fx[1][0]*red(c[x][y-1]) + Fx[2][0]*red(c[x+1][y-1])
          + Fx[0][2]*red(c[x-1][y+1]) + Fx[1][2]*red(c[x][y+1]) + Fx[2][2]*red(c[x+1][y+1]);
        float hgR = 
          Fy[0][0]*red(c[x-1][y-1]) + Fy[1][0]*red(c[x][y-1]) + Fy[2][0]*red(c[x+1][y-1])
          + Fy[0][2]*red(c[x-1][y+1]) + Fy[1][2]*red(c[x][y+1]) + Fy[2][2]*red(c[x+1][y+1]);
        float red = sqrt(sq(vgR) + sq(hgR));

        float vgG = 
          Fx[0][0]*blue(c[x-1][y-1]) + Fx[1][0]*blue(c[x][y-1]) + Fx[2][0]*blue(c[x+1][y-1])
          + Fx[0][2]*blue(c[x-1][y+1]) + Fx[1][2]*blue(c[x][y+1]) + Fx[2][2]*blue(c[x+1][y+1]);
        float hgG = 
          Fy[0][0]*blue(c[x-1][y-1]) + Fy[1][0]*blue(c[x][y-1]) + Fy[2][0]*blue(c[x+1][y-1])
          + Fy[0][2]*blue(c[x-1][y+1]) + Fy[1][2]*blue(c[x][y-1]) + Fy[2][2]*blue(c[x+1][y+1]);
        float blue = sqrt(sq(vgG) + sq(hgG));

        float vgB = 
          Fx[0][0]*green(c[x-1][y-1]) + Fx[1][0]*green(c[x][y-1]) + Fx[2][0]*green(c[x+1][y-1])
          + Fx[0][2]*green(c[x-1][y+1]) + Fx[1][2]*green(c[x][y+1]) + Fx[2][2]*green(c[x+1][y+1]);
        float hgB = 
          Fy[0][0]*green(c[x-1][y-1]) + Fy[1][0]*green(c[x][y-1]) + Fy[2][0]*green(c[x+1][y-1])
          + Fy[0][2]*green(c[x-1][y+1]) + Fy[1][2]*green(c[x][y+1]) + Fy[2][2]*green(c[x+1][y+1]);
        float green = sqrt(sq(vgB) + sq(hgB));

        imgDst.set(x, y, color(red, green, blue));
      }
    }
  }

  save("result.jpg");
}