//Wave clock 1
void setup() {
  size(500, 500);
  background(255);

  float centx=250, centy=250;
  float radius = 200;
  float x1, y1, x2, y2;
  float ang=0, oppang=0;
  float clr=0;

  for (int i=0; i<=360; i++) {
    ang += 1;
    oppang = ang + PI;
    stroke(clr);

    x1 = centx + noiseRadius(radius)*cos(ang);
    y1 = centy + noiseRadius(radius)*sin(ang);
    x2 = centx + noiseRadius(radius)*cos(oppang);
    y2 = centy + noiseRadius(radius)*sin(oppang);

    line(x1, y1, x2, y2);
    clr += 255.0/360.0;
  }
}

float noiseRadius(float radius) {
  float i = random(5);
  float num = radius + 100*noise(i) - 50;
  return num;
}