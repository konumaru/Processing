//jumpChara
//2015/07/08
//1-3-19 小沼塁
int Human_flag=0;
float t=0.0, g=9.8;
float x0=0, y0=0;
float x=0, y=0;
float Human_theta, theta;
float v0=0;
void setup() {
  size(600, 400);
}

void draw() {
  background(255);
  //砲台
  float theta=-atan2(mouseY-400, mouseX-0);
  /*translate(0, 400);
   rotate(theta);
   line(0, 0, 50, 0);*/
  strokeWeight(5);
  line(0, 400, 50*cos(theta), 400-50*sin(theta) );
  ////chara_初期座標
  x0=50*cos(Human_theta);
  y0=400-50*sin(Human_theta);
  ////移動量
  x=x0+t*v0*cos(Human_theta);
  y=y0-(v0*sin(Human_theta)*t-(g*t*t)/2);
  if (x>600) {
    x=1200-x;
  }
  if (Human_flag==1) {
    drawCharacter(x, y, 0.0, 0.5);
    t+=0.1;
  }
}


void mousePressed() {
  background(255);
  v0=dist(0, 400, mouseX, mouseY);
  Human_theta=-atan2(mouseY-400, mouseX-0);
  Human_flag=1;
  t=0.0;
}


//Chara
void drawCharacter(float x, float y, float angle_deg, float scale_factor) {
  int offset_x=100;
  int offset_y=100;

  pushMatrix();
  translate(x, y);
  scale(scale_factor);
  rotate( radians(angle_deg) );
  translate(-offset_x, -offset_y);
  //chara_panda
  fill(0);
  ellipse(50, 50, 45, 45);
  ellipse(150, 50, 45, 45);
  fill(250);
  ellipse(100, 100, 120, 120);
  fill(0);
  ellipse(70, 80, 15, 20);
  ellipse(130, 80, 15, 20);
  triangle(90, 90, 110, 90, 100, 100);
  strokeWeight(5);
  line(100, 100, 100, 110);
  line(100, 110, 90, 120);
  line(100, 110, 110, 120);
  //
  popMatrix();
}

