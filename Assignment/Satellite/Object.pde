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
    speedX = (int)random(-5, 5);
    speedY = (int)random(-5, 5);
  }
  void move() {
    x = x + speedX;
    y = y + speedY;
    if ( x > width ) {
      x = 0;
    }
    if ( x < 0 ) {
      x = width;
    }
    if ( y > height ) {
      y = 0;
      
    }
    if ( y < 0 ) {
      y = height;
    }
  }
}

