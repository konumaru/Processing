////Class を宣言する！
KeijibanClass board1, board2;
shift shift1;

void setup() {
  size( 800, 600 );

  ///インスタンス化
  board1 = new KeijibanClass();
  board2 = new KeijibanClass();
  shift1 = new shift();
  ////インスタンスメソッドの使い方。
  board1.init( 30, 30, 10, 10, 10);
  board2.init( 20, 250, 15, 20, 10);
}

void draw() {
  background( 255, 255, 255 );
  board1.light();
  board2.light();
}

void mousePressed() {
  board1.push();
  board2.push();
}

void keyPressed() {
  switch( keyCode ) {
  case CONTROL:
    shift1.flag();
    break;
  
  case LEFT:
    //board1.shiftToLeft();
    //board2.shiftToLeft();
    shift1.left();
    break;

  case RIGHT:
    //board1.shiftToRight();
    //board2.shiftToRight();
    shift1.right();
    break;
  }
}
