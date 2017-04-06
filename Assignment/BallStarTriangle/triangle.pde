class triangle extends Object{
  void display(){
    fill(0, 0, 255);
    triangle(x, y-15, x-15, y+15, x+15, y+15);
  }
  
  /*void move(){
    x = x + speedX;
    y = y + speedY;
    if(x>width) x = 0;
    if(x<0) x = width;
    if(y>height) y = 0;
    if(y<0) y = height;
  }*/
}
