import processing.opengl.*;
int radius = 150;

void setup() {
  size(500, 300, OPENGL);
}

void draw() {
  background(0);
  stroke(255);
  //Turn
  translate(width/2, height/2, 100);
  rotateY(frameCount*0.03);
  rotateX(frameCount*0.04);

  float s = 0, t = 0;
  float lastx = 0, lasty = 0, lastz = 0;
  while (t < 180) {
    s += 25;
    t += 1;
    float radianS = radians(s);
    float radianT = radians(t);

    float thisx = 0+(radius*cos(radianS))*sin(radianT);
    float thisy = 0+(radius*sin(radianS))*sin(radianT);
    float thisz = 0+(radius*cos(radianT));

    if (lastx != 0) {
      line(thisx, thisy, thisz, lastx, lasty, lastz);

      pushMatrix();
      translate(thisx, thisy, thisz);
      specular(123, 255, 123);
      sphere(2);
      popMatrix();
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}