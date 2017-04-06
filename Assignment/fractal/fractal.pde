float Len = 1500;

void setup(){
  size(800, 800);
}


void draw(){
  background(120);
  translate(400, 50);
  drawTriangle(Len);
}


void drawTriangle(float len){
  len = len/2;
  
  if (len<10) return;
  
  float x1 = 0, y1 = 0;
  float x2 = len*cos(radians(120)), y2 = len*sin(radians(120));
  float x3 = len*cos(radians(60)), y3 = len*sin(radians(60));
  
  triangle(x1, y1, x2, y2, x3, y3);
  
  float moveX = len/4;
  float moveY = sqrt(3)*(len/4);
  
  pushMatrix();
  drawTriangle(len);
  popMatrix();
  
  pushMatrix();
  translate(moveX, moveY);
  drawTriangle(len);
  popMatrix();
  
  pushMatrix();
  translate(-moveX, moveY);
  drawTriangle(len);
  popMatrix();
}