
void seachPossibility(int x, int y, int directionX, int directionY) {
  if (checkOutOfBound(x+directionX, y+directionY)) {
    if (piece[x+directionX][y+directionY]==-turn_flag) {
      seachEmpty(x+directionX, y+directionY, directionX, directionY);
    }
  }
}

void seachEmpty(int x, int y, int directionX, int directionY) {
  while (checkOutOfBound(x, y)) {
    if (piece[x][y]==turn_flag) return;
    if (piece[x][y] == 0) {
      field[x][y] = 5;
      return;
    }
    x += directionX;
    y += directionY;
  }
}


void pieceUpSideDown(int x, int y, int directionX, int directionY) {
  x += directionX;
  y += directionY;
  if (checkOutOfBound(x, y)) {
    if (piece[x][y]==turn_flag) {
      x -= directionX;
      y -= directionY;
      while ( checkOutOfBound(x, y) && piece[x][y]==-turn_flag) {
        piece[x][y] = turn_flag;
        x -= directionX;
        y -= directionY;
      }
    } else if ( piece[x][y]==-turn_flag) {
      pieceUpSideDown(x, y, directionX, directionY);
    }
  }
}

boolean checkOutOfBound(int x, int y) {
  return x>=0 && x<8 && y>=0 && y<8;
}