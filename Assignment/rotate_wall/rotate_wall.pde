
float y=0;

void setup() {
  size(445, 445, P3D);
  rectMode(CENTER);
}


void draw() {
  background(0); 
  for (int i=0; i<10; i++) {
    for (int t=0; t<10; t++) {
      pushMatrix();
      translate(45+i*40, 45+t*40);
      rotateY(y*noise(i, t));
      rect(0, 0, 30, 30);
      popMatrix();
    }
  }
  y = y + 0.03;
}

