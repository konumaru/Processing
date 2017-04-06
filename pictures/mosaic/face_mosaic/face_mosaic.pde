import gab.opencv.*;
import processing.video.*;
import java.awt.*;

float mosaic_size = 20;

Capture camera;
OpenCV opencv;

ArrayList<Face> faceList;
Rectangle[] faces;
int faceCount = 0;

void setup() {
  size(640, 480);
  camera = new Capture(this, width, height);
  opencv = new OpenCV(this, width, height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faceList = new ArrayList<Face>();
  camera.start();
}

void draw() {
  background(255);
  opencv.loadImage(camera);
  image(camera, 0, 0 );
  detectFaces();

  for (int i = 0; i < faces.length; i++) {
    //mosaic
    //for (int x=faces[i].x-30; x<faces[i].x+faces[i].width+30; x+=mosaic_size){
    //  for (int y=faces[i].y-50; y<faces[i].y+faces[i].height+30; y+=mosaic_size){
    //    color c = get(x, y);
    //    fill(c);
    //    noStroke();
    //    rect(x, y, mosaic_size, mosaic_size);
    //  }
    //}
    stroke(255, 0, 0);
    strokeWeight(3);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }

  /*
  for (Face f : faceList) {
  strokeWeight(2);
  f.display();
  }
  */
  
}