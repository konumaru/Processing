KeijibanClass board;
Star star;

void setup(){
  size(600, 400);
  background(255);
  board = new KeijibanClass();
  board.init(50, 50, 10, 20, 10);
  star = new Star();
  star.posi(300, 200);
}

void draw(){
  board.light();
  star.display();
}

void mousePressed(){
  board.push();
}

void keyPressed(){
  if (keyCode == LEFT){
    board.shiftToLeft();
  }
  if (keyCode == RIGHT){
    board.shiftToRight();
  }
}