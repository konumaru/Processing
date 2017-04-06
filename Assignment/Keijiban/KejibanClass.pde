class KeijibanClass {
  ///インスタンス変数
  int [][] lights;
  int keijibanLeftX;
  int keijibanTopY;
  int lightRadius;
  int numHorizontal;
  int numVertical;

  ///インスタンスメソッド

  void init(int leftx, int topy, int r, int Horizontal, int Vertical) {
    keijibanLeftX = leftx;
    keijibanTopY = topy;
    lightRadius = r;
    numHorizontal = Horizontal;
    numVertical = Vertical;
    lights = new int [numHorizontal][numVertical];
    for (int y=0; y<numVertical; y++) {
      for (int x=0; x<numHorizontal; x++) {  
        lights[x][y] = 0;
      }
    }
  }

  void light() {
    for (int y=0; y<numVertical; y++) {
      for (int x=0; x<numHorizontal; x++) {  
        if ( lights[x][y] == 1 ) fill( 255, 0, 0 );
        else fill( 255, 255, 255 );
        ellipse( keijibanLeftX+x*lightRadius*2+lightRadius, keijibanTopY+y*lightRadius*2+lightRadius, lightRadius*2, lightRadius*2 );
      }
    }
  }

  void push() {
    for (int y=0; y<numVertical; y++) {
      for (int x=0; x<numHorizontal; x++) {      
        if ( dist(keijibanLeftX+x*lightRadius*2+lightRadius, keijibanTopY+y*lightRadius*2+lightRadius, mouseX, mouseY)<lightRadius ) {
          if ( lights[x][y] == 1 ) lights[x][y] = 0;
          else lights[x][y] = 1;
        }
      }
    }
  }

  void shiftToLeft() {
    int y=0;
    while ( y<numVertical ) {
      int x=0;
      int temp = lights[0][y];
      while ( x<numHorizontal-1 ) {
        lights[x][y] = lights[x+1][y];      
        x++;
      }
      lights[numHorizontal-1][y] = temp;
      y++;
    }
  }

  void shiftToRight() {
    int y=0;
    while ( y<numVertical ) {
      int x=numHorizontal-1;
      int temp = lights[x][y];
      while ( x>0 ) {
        lights[x][y] = lights[x-1][y];      
        x--;
      }
      lights[0][y] = temp;
      y++;
    }
  }
}

