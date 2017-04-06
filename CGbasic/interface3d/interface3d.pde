float s = 0;
float t = 0;
boolean flag = true;

void setup() {
  size(400, 400, P3D);
  rectMode(CENTER);
}


void draw() {
  background(200);

  pushMatrix();

  translate(width/2, height/2, -200);
  rotateX(radians(s));
  s += 0.5;
  rotateY(radians(t));
  t++;

  //図形
  if (flag) {
    fill(255, 190, 0);
    box(250);
  } else {
    fill(190, 255, 0);
    sphere(200);
  }

  popMatrix();

  //ボタン
  fill(255);
  rect(width/2, height*5/6, 200, 80);

  if (flag == true) {
    fill(255, 0, 0);
  } else {
    fill(50);
  }
  ellipse(width/2-50, height*5/6, 60, 60);

  if (flag == false) {
    fill(255, 0, 0);
  } else {
    fill(50);
  }
  ellipse(width/2+50, height*5/6, 60, 60);
}

void mousePressed() {
  if ( dist(width/2-50, height*5/6, mouseX, mouseY)<30 ) {
    flag = true;
  }
  if ( dist(width/2+50, height*5/6, mouseX, mouseY)<30 ) {
    flag = false;
  }
}