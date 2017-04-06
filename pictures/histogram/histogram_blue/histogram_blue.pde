PImage img;
int [] b = new int [256];


void setup() {
  img = loadImage("sea.jpg");
  size(768, 600);
  tint(0, 0, 255);
  image(img, 0, 0, img.width, height);
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<height; j++) {
      color blue_level = get(i, j);
      float temp = blue(blue_level);
      b[round(temp)]++;
    }
  }
}


void draw(){
  for (int i=0; i<b.length; i++){
    fill(255);
    noStroke();
    rect(1+i*3, height-0.05*b[i], 1, 0.05*b[i]);
  }
}