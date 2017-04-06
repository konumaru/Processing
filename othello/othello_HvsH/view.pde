
void feildDraw() {
  background(255);
  
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      //盤面
      stroke(0);
      strokeWeight(3);
      fill(30, 150, 40);
      rect(i*100, j*100, 100, 100);
      if (field[i][j]==5) {
        fill(255, 0, 0, 120);
        rect(i*100, j*100, 100, 100);
      }
      //駒      
      noStroke();
      if (piece[i][j]==1) {
        fill(0);
        ellipse(50+i*100, 50+j*100, 80, 80);
      }
      if (piece[i][j]==-1) {
        fill(255);
        ellipse(50+i*100, 50+j*100, 80, 80);
      }
    }
  }

  fill(0);
  ellipse(200, 200, 10, 10);
  ellipse(600, 200, 10, 10);
  ellipse(200, 600, 10, 10);
  ellipse(600, 600, 10, 10);
  
}