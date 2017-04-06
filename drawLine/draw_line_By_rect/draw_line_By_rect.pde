
void setup(){
  size(800, 600);
  background(255);
  
  rectMode(CENTER);
  stroke(0);
  strokeWeight(5);
  fill(0);
}


void draw(){
}

void mousePressed(){
  rect(mouseX, mouseY, 20, 10);
}

void mouseDragged(){
  rect(mouseX, mouseY, 20, 10);
}

void keyPressed(){
  if (keyCode==BACKSPACE) background(255);
}