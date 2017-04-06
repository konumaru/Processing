float x, y, px, py;

void setup(){
  size(800, 600);
  background(255);
  
  stroke(0);
  strokeWeight(10);
}


void draw(){
}

void mousePressed(){
  x = mouseX;
  y = mouseY;
}

void mouseDragged(){
  px = x;
  py = y;
  x = mouseX;
  y = mouseY;
  line(x, y, px, py);
}