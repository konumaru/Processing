PImage img;

float rotX, rotY;

void setup() {
  fill(255, 255, 100, 150);
  stroke(0);
}

void settings() {
  img = loadImage("map.png");
  size(1000, 600, P3D);
}


void draw() {
  background(100);
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotateX( radians(60+rotX) );
  rotateZ( radians(20+rotY) );

  beginShape();
  texture(img);
  vertex(-300, -200, 0, 0, 0);
  vertex(300, -200, 0, img.width, 0);
  vertex(300, 200, 0, img.width, img.height);
  vertex(-300, 200, 0, 0, img.height);
  endShape(CLOSE);
  
  popMatrix();
  

  pushMatrix();
  translate(width/2, height/2-50);
  rotateX( radians(60+rotX) );
  rotateZ( radians(20+rotY) );
  translate(-147, -60);
  box(175, 105, 100);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2-25);
  rotateX( radians(60+rotX) );
  rotateZ( radians(20+rotY) );
  translate(-74, 65);
  box(50, 70, 50);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2-50);
  rotateX( radians(60+rotX) );
  rotateZ( radians(20+rotY) );
  translate(-121, 138);
  box(180, 40, 100);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2-50);
  rotateX( radians(60+rotX) );
  rotateZ( radians(20+rotY) );
  translate(175, 71);
  box(200, 100, 100);
  popMatrix();
}

void mousePressed(){
  save("result.jpg");
}

void mouseDragged() {
  rotX = map(mouseX, 0, width, 0, 360);
  rotY = map(mouseY, 0, height, 0, 360);
}