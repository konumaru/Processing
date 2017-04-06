int [][] hako = new int [12][12];
int rad;

void setup() {
  size(500, 500);
  noStroke();
  rectMode(CORNERS);
  for (int i=0; i<12; i++) {
    for (int j=0; j<12; j++) {
      if ((i%2==0 && j%2==0) || (i%2==1 && j%2==1)) hako[i][j] = 1;
      else hako[i][j] = 0;
    }
  }
}

void draw() {
  background(255, 0, 0);
  for (int i=0; i<12; i++) {
    for (int j=0; j<12; j++) {
      if (hako[i][j]==1) {
        fill(0);
        pushMatrix();

        translate(-50+i*50, j*50);
        rotate(frameCount*0.05);
        rect(0, 0, 50, 50);
        //-50+i*50, j*50

        popMatrix();
      } else {
        fill(255);
        pushMatrix();

        translate(-50+i*50, j*50);
        rotate(-frameCount*0.05);
        rect(0, 0, 50, 50);
        //-50+i*50, j*50

        popMatrix();
      }
    }
  }
}