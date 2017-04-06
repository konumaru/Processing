//2D noise 5-2
void setup(){
  size(300, 300);
  frameRate(10);
}

void draw() {
  background(255);

  float xstart = random(10);
  float xnoise = xstart;
  float ynoise = random(10);

  for (int y=0; y<=height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x=0; x<=width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

/*
//様々な正方形
 void drawPoint(float x, float y, float noiseFactor){
 float len = 10*noiseFactor;
 rect(x, y, len, len);
 }
 */

/*
//回転を使った
 void drawPoint(float x, float y, float noiseFactor){
 pushMatrix();
 translate(x, y);
 rotate(noiseFactor*radians(360));
 stroke(0, 150);
 line(0, 0, 20, 0);
 popMatrix();
 }
 */


//雲
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor*radians(540));
  float edgeSize = noiseFactor*35;
  float grey = 150+(noiseFactor*120);
  float alph = 150+(noiseFactor*120);
  noStroke();
  fill(grey, alph);
  ellipse(0, 0, edgeSize, edgeSize/2);
  popMatrix();
}












