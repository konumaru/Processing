class Object {
  int x;
  int y;
  int speedX;
  int speedY;

  Object() {
    init();
  }
  void init() {
    x = (int)random(width);
    y = (int)random(height);
    speedX = (int)random(5);
    speedY = (int)random(5);
  }
  void move() {
    x = x + speedX;
    y = y + speedY;
    if ( x+15 > width ) {
      x = width - 15;
      speedX = -speedX;
    }
    if ( x - 15 < 0 ) {
      x = 15;
      speedX = -speedX;
    }
    if ( y + 15 > height ) {
      y = height - 15;
      speedY = -speedY;
    }
    if ( y - 15 < 0 ) {
      y = 15;
      speedY = -speedY;
    }
  }
}
