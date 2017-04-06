import saito.objloader.*;

OBJModel model;
float rotX;
float rotY;

float light_angle = 0;   

void setup() {
  size(400, 400, P3D);
  model = new OBJModel(this, "cassini.obj", "absolute", TRIANGLES);
  model.scale(8);
  noStroke();
}


void draw() {
  background(100);

  translate(width/2, height/2, 0);

  pushMatrix();
  rotateX(radians(-30));
  rotateY(radians(light_angle));
  
  lightSpecular(128, 128, 128);
  directionalLight(128, 128, 128, 1, 1, -1);
  ambientLight(255, 100, 100);  //赤の環境光
  popMatrix();


  rotateX(rotY);
  rotateY(rotX);
  model.draw();

  light_angle += 3;
}

void mouseDragged() {
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
}