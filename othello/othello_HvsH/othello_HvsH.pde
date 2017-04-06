//何も置いてない：「０」、ハイライト：「５」
int [][] field = new int [8][8];
//黒：「１」、白：「−１」
int [][] piece = new int [8][8];
//----------------------------
int turn_flag = 1;

boolean reverse_flag =false;

void setup() {
  size(800, 800);
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      field[i][j] = 0;
      piece[i][j] = 0;
    }
  }

  field[2][4] = field[3][5] = 5;
  field[4][2] = field[5][3] = 5;

  piece[3][3] = piece[4][4] = 1;
  piece[3][4] = piece[4][3] = -1;
}


void draw() {
  feildDraw();
}

void mousePressed() {
  int pieceX = mouseX/100;
  int pieceY = mouseY/100;

  if (field[pieceX][pieceY]==5) {
    piece[pieceX][pieceY] = turn_flag;
    //ひっくりかえす
    pieceUpSideDown(pieceX, pieceY, -1, -1);
    pieceUpSideDown(pieceX, pieceY, -1, 0);
    pieceUpSideDown(pieceX, pieceY, -1, 1);

    pieceUpSideDown(pieceX, pieceY, 0, -1);
    pieceUpSideDown(pieceX, pieceY, 0, 1);

    pieceUpSideDown(pieceX, pieceY, 1, -1);
    pieceUpSideDown(pieceX, pieceY, 1, 0);
    pieceUpSideDown(pieceX, pieceY, 1, 1);


    turn_flag = -turn_flag;
  }
}


void mouseReleased() { 
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      //ハイライトを初期化
      field[i][j] = 0;
    }
  }

  for (int x=0; x<8; x++) {
    for (int y=0; y<8; y++) {
      if (piece[x][y]==turn_flag) {
        seachPossibility(x, y, -1, -1);
        seachPossibility(x, y, -1, 0);
        seachPossibility(x, y, -1, 1);

        seachPossibility(x, y, 0, -1);
        seachPossibility(x, y, 0, 1);

        seachPossibility(x, y, 1, -1);
        seachPossibility(x, y, 1, 0);
        seachPossibility(x, y, 1, 1);
      }
    }
  }

  int point = 0;
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      point += field[i][j];
    }
  }

  if (point==0) {
    println("There is no place to put...");
    turn_flag = -turn_flag;
    for (int x=0; x<8; x++) {
      for (int y=0; y<8; y++) {
        if (piece[x][y]==turn_flag) {
          seachPossibility(x, y, -1, -1);
          seachPossibility(x, y, -1, 0);
          seachPossibility(x, y, -1, 1);

          seachPossibility(x, y, 0, -1);
          seachPossibility(x, y, 0, 1);

          seachPossibility(x, y, 1, -1);
          seachPossibility(x, y, 1, 0);
          seachPossibility(x, y, 1, 1);
        }
      }
    }
  }
  redraw();
}