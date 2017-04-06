void setup(){
  size(600, 600);
  background(0);
}

void draw(){
  float centerx = random(width);
  float centery = random(height);
  float r = random(100);
  ///////////////////////////rect
  stroke(255, r);
  noFill();
  rectMode(CENTER);
  rect(centerx, centery, r, r);
  ///////////////////////////
  float centerX = random(width);
  float centerY = random(height);
  float R = random(100);
  ///////////////////////////box
  noStroke();
  fill(255, R);
  rect(centerX, centerY, R, R);
  //////////////////////////reset
  rectMode(CORNER);
  fill(0, 5);
  rect(0, 0, width, height);
}