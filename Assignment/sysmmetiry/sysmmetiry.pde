
void setup(){
  size(600, 600);
  background(0);
}


void draw(){
  stroke(255);
  strokeWeight(2);
  translate(width/2, height/2);
  if (mousePressed){
    float x = mouseX - width/2;
    float y = mouseY - height/2;
    float px = pmouseX - width/2;
    float py = pmouseY - height/2;
    line(x, y, px, py);
    scale(-1, 1);
    line(x, y, px, py);
    scale(1, -1);
    line(x, y, px, py);
    scale(-1, 1);
    line(x, y, px, py);
  }
}

void keyPressed(){
  if (key=='r') background(0);
}